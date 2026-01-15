#!/usr/bin/env bash

log() {
    local level="$1"
    local component="$2"
    local message="$3"

    jq -nc \
      --arg ts "$TIMESTAMP" \
      --arg host "$HOSTNAME" \
      --arg level "$level" \
      --arg component "$component" \
      --arg msg "$message" \
      '{timestamp:$ts,host:$host,level:$level,component:$component,message:$msg}' \
      >> "$AUDIT_OUTPUT"

    [[ "$level" == "CRITICAL" ]] && CRITICAL_FOUND=true
}
