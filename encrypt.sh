#!/bin/bash

YEAR=$1

if [ -z "$YEAR" ]; then
  echo "Usage: ./encrypt.sh <YEAR>"
  exit 1
fi

INPUT_FILE="${YEAR}/letter_to_future.md"
OUTPUT_FILE="${YEAR}/letter_to_future.enc"

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: ${INPUT_FILE} not found."
  exit 1
fi

echo "Encrypting letter for ${YEAR}..."

openssl enc -aes-256-cbc -pbkdf2 -salt -in "$INPUT_FILE" -out "$OUTPUT_FILE"

echo "Created ${OUTPUT_FILE}"
echo "Please DELETE the plaintext file: rm ${INPUT_FILE}"