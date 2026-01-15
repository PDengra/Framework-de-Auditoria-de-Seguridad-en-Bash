#!/usr/bin/env bash

run() {
    log "INFO" "kernel" "Verificando parámetros de hardening del kernel"

    for param in \
        kernel.randomize_va_space \
        kernel.kptr_restrict \
        kernel.dmesg_restrict
    do
        value=$(sysctl -n "$param" 2>/dev/null || echo "N/A")
        log "INFO" "kernel" "$param=$value"

        [[ "$value" == "0" ]] && {
            log "WARN" "kernel" "Hardening débil: $param"
            penalize 5
        }
    done
}
