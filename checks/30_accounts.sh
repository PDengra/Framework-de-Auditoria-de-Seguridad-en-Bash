#!/usr/bin/env bash

run() {
    log "INFO" "accounts" "Auditoría de cuentas locales"

    awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null | while read -r user; do
        log "CRITICAL" "accounts" "Usuario sin contraseña: $user"
        penalize 30
    done

    awk -F: '($3==0){print $1}' /etc/passwd | while read -r user; do
        [[ "$user" != "root" ]] && {
            log "CRITICAL" "accounts" "Usuario UID 0 no autorizado: $user"
            penalize 40
        }
    done
}
