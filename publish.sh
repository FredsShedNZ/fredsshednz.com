#!/bin/bash

# Fail fast
set -e

# Validate up front...

# Backblaze key and bucket details in vars?
# TODO B2_Bucket_Name
# TODO B2_Profile
# TODO B2_APPLICATION_KEY_ID
# TODO B2_APPLICATION_KEY


# CloudFlare login is done manually and cached by Wrangler:
# npx wrangler login


# Move to the dir the script lives in
ScriptPath="$(dirname "$0")"
echo "Moving to working dir \"${ScriptPath}\""
cd "${ScriptPath}"

# Git clean, all committed, pushed, in sync, ready to publish?

# Make sure we have a recent copy of our remote
git fetch
# TODO Not ahead of remote?
# TODO Not behind remote?
# TODO Not dirty?

# Build it first...
${ScriptPath}/build.sh

# Set reusable path up...
BasePath="SiteContent"
BucketPath="${BasePath}/$(git describe --always --dirty=-FAIL --long)-$(date +"%d-%m-%Y_%Hh%Mm%Ss")"
echo "Bucket path set to \"${BucketPath}\""

# Upload to B2...
PROFILE="--profile ${B2_Profile}"
echo "B2 command base set to \"b2 <> ${PROFILE}\""
b2 sync ${PROFILE} ./build "b2://${B2_Bucket_Name}/${BucketPath}"

# Point cloudflare at new path...
cd cloudflare-worker
echo "Set value to ${BucketPath}"
(sleep 3; echo -e "${BucketPath}\n") | npx wrangler secret put B2_BUCKET_PATH
cd -
