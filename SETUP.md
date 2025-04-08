# Set up of tooling for this site/project

Get the following:

## Development / Contribution

* npm @ 10.9.2 (or later?)
* node @ 22.14.0 (or later?)

## Publishing:

* b2-tools @ 4.3.1 (or later?)
* wrangler via package.json

cd into cloudflare-worker dir

npx wrangler login # to get perms

npx wrangler deploy # to make live

no frequent updates needed to worker

Just use ./publish.sh from the main dir to build the site and publish it and make it live.
