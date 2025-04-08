// Cut down, simplified, and customised from cloudflare-B2 repo
import { AwsClient } from 'aws4fetch'

const UNSIGNABLE_HEADERS = [
    // These headers appear in the request, but are never passed upstream
    'x-forwarded-proto',
    'x-real-ip',
    // We can't include accept-encoding in the signature because Cloudflare
    // sets the incoming accept-encoding header to "gzip, br", then modifies
    // the outgoing request to set accept-encoding to "gzip".
    // Not cool, Cloudflare!
    'accept-encoding',
    // Conditional headers are not consistently passed upstream
    'if-match',
    'if-modified-since',
    'if-none-match',
    'if-range',
    'if-unmodified-since',
];

// URL needs colon suffix on protocol, and port as a string
const HTTPS_PROTOCOL = 'https:';
const HTTPS_PORT = '443';

// How many times to retry a range request where the response is missing content-range
const RANGE_RETRY_ATTEMPTS = 3;

// Filter out cf-* and any other headers we don't want to include in the signature
function filterHeaders(headers, env) {
    // Suppress irrelevant IntelliJ warning
    // noinspection JSCheckFunctionSignatures
    return new Headers(Array.from(headers.entries())
        .filter(pair => !(
            UNSIGNABLE_HEADERS.includes(pair[0])
            || pair[0].startsWith('cf-')
            || ('ALLOWED_HEADERS' in env && !env['ALLOWED_HEADERS'].includes(pair[0]))
        ))
    );
}

function createHeadResponse(response) {
    return new Response(null, {
        headers: response.headers,
        status: response.status,
        statusText: response.statusText
    });
}

export default {
    async fetch(request, env) {
        // Only allow GET and HEAD methods
        if (!['GET'].includes(request.method)){
            return new Response(null, {
                status: 405,
                statusText: "Method Not Allowed"
            });
        }

        const b2url = new URL(request.url);

        // B2 only supports https on 443
        b2url.protocol = HTTPS_PROTOCOL;
        b2url.port = HTTPS_PORT;

        // Remove leading slashes from path
        let path = b2url.pathname.replace(/^\//, '');

        // Block by default
        let allowRequest = false;

        if (path === '') {
          // Root path → rewrite to index.html
          path = 'index.html';
          allowRequest = true;
        } else if (path === 'index.html') {
          allowRequest = true;
        } else if (path.startsWith('_app/')) {
          allowRequest = true;
        } else if (path.startsWith('images/')) {
          allowRequest = true;
        }

        if (!allowRequest) {
          return new Response("Not Found", { status: 404 });
        }

        // Set to GET since we're not allowing anything else...
        const requestMethod = 'GET';

        // Rewrite path to the bucket base path
        path = env['B2_BUCKET_PATH'] + '/' + path;

        b2url.hostname = env['B2_BUCKET_NAME'] + "." + env['B2_ENDPOINT'];
        b2url.pathname = '/' + path;

        // Certain headers, such as x-real-ip, appear in the incoming request but
        // are removed from the outgoing request. If they are in the outgoing
        // signed headers, B2 can't validate the signature.
        const headers = filterHeaders(request.headers, env);

        // Create an S3 API client that can sign the outgoing request
        const client = new AwsClient({
            "accessKeyId": env['B2_APPLICATION_KEY_ID'],
            "secretAccessKey": env['B2_APPLICATION_KEY'],
            "service": "s3",
        });

        // Sign the outgoing request
        //
        // For HEAD requests Cloudflare appears to change the method on the outgoing request to GET (#18), which
        // breaks the signature, resulting in a 403. So, change all HEADs to GETs. This is not too inefficient,
        // since we won't read the body of the response if the original request was a HEAD.
        const signedRequest = await client.sign(b2url.toString(), {
            method: 'GET',
            headers: headers
        });

        // For large files, Cloudflare will return the entire file, rather than the requested range
        // So, if there is a range header in the request, check that the response contains the
        // content-range header. If not, abort the request and try again.
        // See https://community.cloudflare.com/t/cloudflare-worker-fetch-ignores-byte-request-range-on-initial-request/395047/4
        if (signedRequest.headers.has("range")) {
            let attempts = RANGE_RETRY_ATTEMPTS;
            let response;
            do {
                let controller = new AbortController();
                response = await fetch(signedRequest.url, {
                    method: signedRequest.method,
                    headers: signedRequest.headers,
                    signal: controller.signal,
                });
                if (response.headers.has("content-range")) {
                    // Only log if it didn't work first time
                    if (attempts < RANGE_RETRY_ATTEMPTS) {
                        console.log(`Retry for ${signedRequest.url} succeeded - response has content-range header`);
                    }
                    // Break out of loop and return the response
                    break;
                } else if (response.ok) {
                    attempts -= 1;
                    console.error(`Range header in request for ${signedRequest.url} but no content-range header in response. Will retry ${attempts} more times`);
                    // Do not abort on the last attempt, as we want to return the response
                    if (attempts > 0) {
                        controller.abort();
                    }
                } else {
                    // Response is not ok, so don't retry
                    break;
                }
            } while (attempts > 0);

            if (attempts <= 0) {
                console.error(`Tried range request for ${signedRequest.url} ${RANGE_RETRY_ATTEMPTS} times, but no content-range in response.`);
            }

            if (requestMethod === 'HEAD') {
                // Original request was HEAD, so return a new Response without a body
                return createHeadResponse(response);
            }

            // Return whatever response we have rather than an error response
            // This response cannot be aborted, otherwise it will raise an exception
            return response;
        }

        // Send the signed request to B2
        const fetchPromise = fetch(signedRequest);

        if (requestMethod === 'HEAD') {
            const response = await fetchPromise;
            // Original request was HEAD, so return a new Response without a body
            return createHeadResponse(response);
        }

        // Return the upstream response unchanged
        return fetchPromise;
    },
};
