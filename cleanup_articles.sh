#!/bin/bash

echo "🔍 Removing all _index.md files from article folders..."
find content/articles/ -type f -name '_index.md' -exec rm {} \;

echo "🔄 Renaming index.old.md files to index.md.disabled..."
find content/articles/ -type f -name 'index.old.md' -exec bash -c 'mv "$0" "${0%index.old.md}index.md.disabled"' {} \;

echo "✅ Done. _index.md files removed and index.old.md files renamed."
