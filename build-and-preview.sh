#!/bin/bash

# Wrap the other two...
ScriptPath="$(dirname "$0")"
${ScriptPath}/build.sh
${ScriptPath}/preview.sh
