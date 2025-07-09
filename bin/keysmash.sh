#!/usr/bin/env bash
# Generate “keysmash” strings that look like real keyboard-mash gibberish.
# Usage: keysmash.sh [COUNT] [MINLEN] [MAXLEN]
#   COUNT   – how many strings to emit         (default 3)
#   MINLEN  – shortest length (≥2)             (default 12)
#   MAXLEN  – longest length (≥MINLEN)         (default 24)

set -euo pipefail

count=${1:-3}
minlen=${2:-12}
maxlen=${3:-24}

# Weighted character set: lots of home-row, a little top-row variety
chars='asdfghjklasdfghjklasdfghjklqwert'

for ((n=0; n<count; n++)); do
    len=$(( RANDOM % (maxlen - minlen + 1) + minlen ))
    # First char is always 'a' for authenticity; generate the rest.
    printf 'a'
    tr -dc "$chars" </dev/urandom | head -c $((len - 1))
    printf '\n'
done
