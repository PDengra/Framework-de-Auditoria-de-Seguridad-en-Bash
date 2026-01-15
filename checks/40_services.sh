#!/usr/bin/env bash

run() {
    log "INFO" "services" "Revisando servicios activos"

    if require_cmd systemctl; then
        systemctl list-units --type=service --state=running \
        | grep -Ei "telnet|ftp|rsh|rpcbind|nc" \
        | while read -r svc; do
            log "WARN" "services" "Servicio inseguro activo: $svc"
            penalize 10
        done
    fi
}
