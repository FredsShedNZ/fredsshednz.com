#!/bin/bash

# Determine script location and base directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"

# Make it live on localhost...
npm --prefix "${BASE_DIR}" run preview
