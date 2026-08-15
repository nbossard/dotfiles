#!/bin/bash
# Vérifie si un processus dépasse le seuil CPU
# Usage: check-cpu.sh <pattern> [seuil]
# Retourne 1 si un processus dépasse le seuil, 0 sinon

PATTERN="$1"
THRESHOLD="${2:-90}"

if [ -z "$PATTERN" ]; then
    echo "Usage: check-cpu.sh <pattern> [threshold]"
    exit 2
fi

# Cherche tous les processus matchant le pattern avec CPU > seuil
HIGH_CPU=$(ps aux | grep -v grep | awk -v pat="$PATTERN" -v thresh="$THRESHOLD" \
    '$0 ~ pat && $3 > thresh {printf "PID %s: %.1f%%\n", $2, $3}')

if [ -n "$HIGH_CPU" ]; then
    echo "$PATTERN CPU élevé détecté:"
    echo "$HIGH_CPU"
    exit 1
fi

exit 0
