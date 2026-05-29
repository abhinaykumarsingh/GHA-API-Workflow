#!/bin/bash

set -e

# Output directory
OUTPUT_DIR="output"

# Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Created output directory: $OUTPUT_DIR"

# Free public API
API_URL="https://jsonplaceholder.typicode.com/users"

echo "Calling API..."

# Fetch API response
curl -s "$API_URL" \
  -o "$OUTPUT_DIR/users.json"

echo "Saved raw JSON."

# Pretty print JSON using jq
jq '.' "$OUTPUT_DIR/users.json" \
  > "$OUTPUT_DIR/users_pretty.json"

echo "Created pretty JSON."

# Extract selected fields
jq '[.[] | {
    id: .id,
    name: .name,
    email: .email,
    city: .address.city
}]' "$OUTPUT_DIR/users.json" \
  > "$OUTPUT_DIR/users_summary.json"

echo "Created summary JSON."

# Convert JSON to YAML using yq
yq -P -oy '.' "$OUTPUT_DIR/users.json" \
  > "$OUTPUT_DIR/users.yaml"

echo "Created YAML file."

# Display sample output
echo ""
echo "===== User Names ====="

yq '.[] | .name' "$OUTPUT_DIR/users.yaml"

echo ""
echo "Files generated inside: $OUTPUT_DIR"