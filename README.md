# Shell Script Bug: Handling Filenames with Spaces

This repository demonstrates a common bug in shell scripts that arises when processing filenames containing spaces using the `find` command. The script incorrectly handles filenames with spaces, leading to unexpected behavior.

## Bug Description
The original script uses `find . -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do ... done`. This approach is problematic because if a filename contains spaces, it will be split into multiple words. This leads to errors, especially when the script relies on the whole filename as a unit.

## Solution
The solution uses the safer way to process files:
```bash
while IFS= read -r -d '' file; do 
  process "$file" 
  done < <(find . -maxdepth 1 -type f -print0)
```
This ensures that filenames with spaces are handled correctly.

## How to reproduce the bug
1. Create a file with a space in its name (e.g., `My Document.txt`).
2. Run the `bug.sh` script.  Observe the unexpected behavior.