#!/usr/bin/env bash
# Perfil CI: checks no intrusivos, sin acceso a sistema sensible

ENABLED_CHECKS=(
  "00_integrity.sh"
  "10_network.sh"
  "20_kernel.sh"
)
