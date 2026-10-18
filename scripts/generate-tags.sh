#!/bin/bash

# Generate tag markdown files from _data/tags.yml
set -e

KOTATSU_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TAGS_FILE="$KOTATSU_DIR/_data/tags.yml"
TAG_DIR="$KOTATSU_DIR/tag"

rm -rf "$TAG_DIR"
mkdir -p "$TAG_DIR"

# Parse YAML and generate tag files
# This uses grep to extract tag names from the YAML file
grep "^[a-z-]*:" "$TAGS_FILE" | sed 's/:$//' | while read -r tag_name; do
    tag_file="$TAG_DIR/$tag_name.md"

    cat > "$tag_file" << EOF
---
layout: tag
tag: $tag_name
permalink: /tag/$tag_name/
---
EOF

    echo "Generated: $tag_file"
done

echo "✓ Tag pages generated from _data/tags.yml"
