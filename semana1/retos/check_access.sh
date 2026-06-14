#!/bin/bash

FILE="/srv/releases/release_notes.txt"
LOG_FILE="/var/log/access_attempts.log"
GROUP_NAME="release_team"

if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root o con sudo."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Uso: sudo ./check_access.sh <usuario>"
    exit 1
fi

USER_NAME="$1"

if groups "$USER_NAME" | grep -qw "$GROUP_NAME"; then
    echo "Access granted"
    echo "Contenido de release_notes.txt:"
    cat "$FILE"
else
    echo "Access denied"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - usuario: $USER_NAME" >> "$LOG_FILE"
fi