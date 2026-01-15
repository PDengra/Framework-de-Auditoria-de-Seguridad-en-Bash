#!/usr/bin/env bash
set -euo pipefail

mkdir -p output
: > output/audit.json

source core/config.sh
source core/logger.sh
source core/utils.sh
source core/dispatcher.sh
source core/notifier.sh
source profiles/$AUDIT_MODE.profile

log "INFO" "framework" "Inicio auditoría ($AUDIT_MODE)"

run_checks

if [[ "$CRITICAL_FOUND" == "true" && "$FAIL_ON_CRITICAL" == "true" ]]; then
    log "CRITICAL" "framework" "Auditoría fallida | Score=$SCORE"
    notify "FAIL" "Se detectaron hallazgos críticos. Score=$SCORE. Revisa $AUDIT_OUTPUT"
    exit 1
else
    log "INFO" "framework" "Auditoría completada | Score=$SCORE"
    notify "OK" "Auditoría finalizada sin riesgos críticos. Score=$SCORE"
fi
