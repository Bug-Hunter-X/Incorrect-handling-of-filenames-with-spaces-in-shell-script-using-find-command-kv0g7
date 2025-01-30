#!/bin/bash

# This script correctly processes files, even those with spaces in their names.

while IFS= read -r -d '' file; do
  echo "Processing: $file"
  # ... process the file safely here ...
  if [[ "$file" == *"problem file.txt"* ]]; then
    echo "Found problem file"
  fi
  # ... more processing ...
done < <(find . -maxdepth 1 -type f -print0) 