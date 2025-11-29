#!/bin/bash

# Determine script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Wrap the other two...
"${SCRIPT_DIR}/build.sh"
"${SCRIPT_DIR}/preview.sh"
