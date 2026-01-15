#!/usr/bin/env bash

require_cmd() {
    command -v "$1" &>/dev/null
}

penalize() {
    local points="$1"
    SCORE=$((SCORE - points))
}
