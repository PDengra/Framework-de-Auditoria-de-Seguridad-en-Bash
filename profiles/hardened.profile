#!/usr/bin/env bash
# Perfil endurecido (producción / crítico)

FAIL_ON_CRITICAL=true

ENABLED_CHECKS=(
  "00_integrity.sh"
  "10_network.sh"
  "20_kernel.sh"
  "30_accounts.sh"
  "40_services.sh"
  "50_logs.sh"
)
