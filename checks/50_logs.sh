#!/usr/bin/env bash

run() {
    log "INFO" "logs" "Analizando eventos de autenticación"

    for file in /var/log/auth.log /var/log/secure; do
        [[ -f "$file" ]] || continue

        grep -Ei "failed|invalid|authentication failure" "$file" \
        | tail -n 20 \
        | while read -r line; do
            log "WARN" "logs" "$line"
        done
    done
}
