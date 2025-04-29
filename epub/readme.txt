# EPUB Folder Guide

This folder contains everything needed to generate a styled EPUB file from Markdown articles.

## Convert to EPUB

Run this command from the project root to generate the EPUB:

```sh
pandoc epub/articles/test_article.md \
  -o epub/output/test_book.epub \
  --metadata-file=epub/meta/metadata.yaml \
  --css=epub/css/tufte.css \
  --toc
