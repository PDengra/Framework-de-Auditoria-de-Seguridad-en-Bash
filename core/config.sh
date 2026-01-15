#!/usr/bin/env bash

AUDIT_MODE="${AUDIT_MODE:-server}"
AUDIT_OUTPUT="${AUDIT_OUTPUT:-output/audit.json}"
FAIL_ON_CRITICAL="${FAIL_ON_CRITICAL:-true}"

HOSTNAME="$(hostname)"
TIMESTAMP="$(date -Iseconds)"

CRITICAL_FOUND=false
SCORE=100

# Notificaciones
EMAIL="tucorreo@dominio.com"             # Correo destino
TELEGRAM_BOT_TOKEN="TU TOKEN BOT"  # Token de tu bot
TELEGRAM_CHAT_ID="TU CHAT ID"            # ID del chat o grupo
