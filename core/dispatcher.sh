#!/usr/bin/env bash

run_checks() {
    for check in "${ENABLED_CHECKS[@]}"; do
        source "checks/$check"
        run
    done
}

