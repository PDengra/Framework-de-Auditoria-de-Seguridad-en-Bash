#!/usr/bin/env bash

notify() {
    local status="$1"   # "OK" o "FAIL"
    local message="$2"  # Mensaje detallado

    # Email usando msmtp o mailx
    if [[ -n "$EMAIL" ]] && command -v msmtp >/dev/null 2>&1; then
        {
            echo "Subject: Auditoría [$status] - $HOSTNAME"
            echo "To: $EMAIL"
            echo "Content-Type: text/plain"
            echo
            echo "$message"
        } | msmtp "$EMAIL"
    fi

    # Telegram
    if [[ -n "$TELEGRAM_BOT_TOKEN" && -n "$TELEGRAM_CHAT_ID" ]]; then
        curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
            -d chat_id="$TELEGRAM_CHAT_ID" \
            -d text="[$status] Auditoría en $HOSTNAME | $message" >/dev/null
    fi
}
