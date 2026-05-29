#!/bin/bash

set -e

# Input YAML file
YAML_FILE="output/users.yaml"

# Output JSON file
OUTPUT_JSON="output/user_names.json"

# Check if YAML file exists
if [ ! -f "$YAML_FILE" ]; then
    echo "YAML file not found: $YAML_FILE"
    exit 1
fi

echo "Reading YAML file..."

# Extract all user names from YAML and convert to JSON
yq -o=json '[.[].name]' "$YAML_FILE" \
    | jq '.' \
    > "$OUTPUT_JSON"

echo "Generated JSON file: $OUTPUT_JSON"

echo ""
echo "===== User Names JSON ====="

cat "$OUTPUT_JSON"