#!/usr/bin/env bash

run() {
    log "INFO" "integrity" "Verificando integridad de binarios críticos"

    for bin in /bin/bash /bin/ls /usr/bin/sudo /usr/bin/passwd; do
        if [[ -f "$bin" ]]; then
            hash=$(sha256sum "$bin" | awk '{print $1}')
            log "INFO" "integrity" "$bin sha256=$hash"
        fi
    done
}
