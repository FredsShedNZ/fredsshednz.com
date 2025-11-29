#!/bin/bash

# Fail fast
set -e

# Validate up front...
echo "Checking required environment variables..."

echo -n "FREDSSHEDNZ_B2_Bucket_Name? ... "
if [ -n "${FREDSSHEDNZ_B2_Bucket_Name:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'FREDSSHEDNZ_B2_Bucket_Name' is set and contains the bucket name in B2."
  exit 42
fi

echo -n "FREDSSHEDNZ_B2_Profile? ... "
if [ -n "${FREDSSHEDNZ_B2_Profile:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'FREDSSHEDNZ_B2_Profile' is set to the value you want for this project."
  exit 42
fi

echo -n "FREDSSHEDNZ_B2_APPLICATION_KEY_ID? ... "
if [ -n "${FREDSSHEDNZ_B2_APPLICATION_KEY_ID:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'FREDSSHEDNZ_B2_APPLICATION_KEY_ID' is set and contains the application key ID from B2."
  exit 42
fi

echo -n "FREDSSHEDNZ_B2_APPLICATION_KEY? ... "
if [ -n "${FREDSSHEDNZ_B2_APPLICATION_KEY:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'FREDSSHEDNZ_B2_APPLICATION_KEY' is set and contains the application key as issued by B2 and shown to you once at creation time."
  exit 42
fi

echo -n "FREDSSHEDNZ_CloudFlare_API_Token? ... "
if [ -n "${FREDSSHEDNZ_CloudFlare_API_Token:-}" ]; then
  echo "Okay."
else
  echo "Fail."
  echo "Please ensure that 'FREDSSHEDNZ_CloudFlare_API_Token' is set and contains the Cloudflare API token."
  exit 42
fi

# Export tool-consumed variables with original names
export B2_APPLICATION_KEY_ID="${FREDSSHEDNZ_B2_APPLICATION_KEY_ID}"
export B2_APPLICATION_KEY="${FREDSSHEDNZ_B2_APPLICATION_KEY}"
export CLOUDFLARE_API_TOKEN="${FREDSSHEDNZ_CloudFlare_API_Token}"

# Determine script location and base directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

# Git clean, all committed, pushed, in sync, ready to publish?

# Make sure we have a recent copy of our remote
git -C "${BASE_DIR}" fetch
# TODO Not ahead of remote?
# TODO Not behind remote?
# TODO Not dirty?

# Build it first...
"${SCRIPT_DIR}/build.sh"

# Set reusable path up...
BasePath="SiteContent"
BucketPath="${BasePath}/$(git -C "${BASE_DIR}" describe --always --dirty=-FAIL --long)-$(date +"%d-%m-%Y_%Hh%Mm%Ss")"
echo "Bucket path set to \"${BucketPath}\""

# Upload to B2...
PROFILE="--profile ${FREDSSHEDNZ_B2_Profile}"
echo "B2 command base set to \"b2 <> ${PROFILE}\""
b2 sync ${PROFILE} "${BASE_DIR}/build" "b2://${FREDSSHEDNZ_B2_Bucket_Name}/${BucketPath}"

# Point cloudflare at new path...
cd "${BASE_DIR}/cloudflare-worker"
echo "Set value to ${BucketPath}"
(sleep 3; echo -e "${BucketPath}\n") | npx wrangler secret put B2_BUCKET_PATH
cd -
