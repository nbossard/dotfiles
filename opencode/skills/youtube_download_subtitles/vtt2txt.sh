#!/usr/bin/env bash
# vtt2txt - Convertit un fichier VTT en texte propre
# - Supprime les balises et timecodes
# - Filtre les doublons et préfixes
# - Reconstruit le texte en coupant sur la ponctuation de fin de phrase
# Usage: vtt2txt input.vtt [output.txt]

set -euo pipefail

INPUT="${1:-}"
OUTPUT="${2:-}"

[[ -z "$INPUT" ]] && { echo "Usage: vtt2txt input.vtt [output.txt]" >&2; exit 1; }
[[ ! -f "$INPUT" ]] && { echo "Fichier introuvable: $INPUT" >&2; exit 1; }

process() {
    # 1. Supprime les lignes d'en-tête, timecodes et lignes vides
    # 2. Supprime toutes les balises inline <...>
    # 3. Supprime les doublons et préfixes via awk :
    #    - stocke toutes les lignes dans un tableau
    #    - ne garde que les lignes qui ne sont préfixe d'aucune autre
    # 4. Concatène en un flux continu
    # 5. Coupe après chaque fin de phrase (. ! ?)
    grep -v '^WEBVTT\|^Kind:\|^Language:' "$INPUT" \
    | grep -v '^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]' \
    | grep -v '^$' \
    | sed 's/<[^>]*>//g' \
    | sed 's/[[:space:]]*$//' \
    | awk '
        { lines[NR] = $0 }
        END {
            for (i = 1; i <= NR; i++) {
                is_prefix = 0
                for (j = 1; j <= NR; j++) {
                    if (i != j && index(lines[j], lines[i]) == 1 && lines[j] != lines[i]) {
                        is_prefix = 1
                        break
                    }
                }
                if (!is_prefix) print lines[i]
            }
        }
    ' \
    | tr '\n' ' ' \
    | sed 's/  */ /g' \
    | sed 's/\([.!?]\) /\1\n/g' \
    | sed 's/^[[:space:]]*//' \
    | grep -v '^$'
}

if [[ -z "$OUTPUT" ]]; then
    process
else
    process > "$OUTPUT"
    echo "Fichier généré : $OUTPUT"
fi

