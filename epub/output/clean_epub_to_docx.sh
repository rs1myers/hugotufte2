#!/bin/bash

# === CONFIG ===
INPUT_EPUB="$1"
TEMP_MD="cleaned_temp.md"
OUTPUT_DOCX="${INPUT_EPUB%.epub}_cleaned.docx"

# === CHECK INPUT ===
if [ -z "$INPUT_EPUB" ]; then
  echo "Usage: ./clean_epub_to_docx.sh path/to/book.epub"
  exit 1
fi

if [ ! -f "$INPUT_EPUB" ]; then
  echo "Error: File not found: $INPUT_EPUB"
  exit 1
fi

# === STEP 1: Convert EPUB to Markdown ===
echo "Converting EPUB to Markdown..."
pandoc "$INPUT_EPUB" -t markdown -o "$TEMP_MD"

# === STEP 2: Clean Carriage Returns in Markdown ===
echo "Cleaning carriage returns..."
sed -i '' 's/\r//g' "$TEMP_MD"

# === STEP 3: Convert Markdown back to Word (.docx) ===
echo "Converting Markdown to DOCX..."
pandoc "$TEMP_MD" -o "$OUTPUT_DOCX"

# === STEP 4: Cleanup ===
rm "$TEMP_MD"

echo "✅ Done: $OUTPUT_DOCX"

