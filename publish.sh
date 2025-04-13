#!/bin/bash

# Fail fast
set -e

# Validate up front...
echo "Checking required environment variables..."

echo -n "B2_Bucket_Name? ... "
if [ -n "${B2_Bucket_Name:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'B2_Bucket_Name' is set and contains the bucket name in B2."
  exit 42
fi

echo -n "B2_Profile? ... "
if [ -n "${B2_Profile:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'B2_Profile' is set to the value you want for this project."
  exit 42
fi

echo -n "B2_APPLICATION_KEY_ID? ... "
if [ -n "${B2_APPLICATION_KEY_ID:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'B2_APPLICATION_KEY_ID' is set and contains the application key ID from B2."
  exit 42
fi

echo -n "B2_APPLICATION_KEY? ... "
if [ -n "${B2_APPLICATION_KEY:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'B2_APPLICATION_KEY' is set and contains the application key as issued by B2 and shown to you once at creation time."
  exit 42
fi


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
