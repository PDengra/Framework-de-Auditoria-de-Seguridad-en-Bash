#!/usr/bin/env bash

run() {
    log "INFO" "network" "Analizando puertos y conexiones activas"

    if require_cmd ss; then
        ss -tunlp | while read -r line; do
            log "INFO" "network" "$line"
        done
    else
        log "WARN" "network" "Comando ss no disponible"
    fi
}
