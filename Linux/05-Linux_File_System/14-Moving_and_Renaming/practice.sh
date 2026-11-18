#!/bin/bash
# ============================================================
# practice.sh — Moving and Renaming Files and Directories (mv)
# Module 05, Lesson 14 | DevOp Camp ZTM
# ============================================================
# Run this script to test all capabilities of mv:
# - Renaming files in place (verifying identical inode!)
# - Moving files into directories
# - Moving multiple files simultaneously
# - Moving directories without -r
# - Overwrite protection flags (-n, -b, -v)
# - Batch renaming via bash parameter expansion
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 14: Moving and Renaming (mv)"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_mv_$$"
mkdir -p "$SANDBOX"/{folder_a,folder_b,batch_tests}

# 1. Renaming In Place & Inode Preservation
echo ""
echo "--- 1. Renaming File in Place (Verifying Inode Remains Identical) ---"
echo "Original data" > "$SANDBOX/original.txt"
ORIG_INODE=$(stat -c '%i' "$SANDBOX/original.txt")
echo "Original file: original.txt | Inode: $ORIG_INODE"

mv -v "$SANDBOX/original.txt" "$SANDBOX/renamed.txt"
NEW_INODE=$(stat -c '%i' "$SANDBOX/renamed.txt")
echo "Renamed file:  renamed.txt  | Inode: $NEW_INODE"
if [ "$ORIG_INODE" -eq "$NEW_INODE" ]; then
    echo "Confirmed: Inode is identical! Zero bytes were copied; only metadata was updated."
fi

# 2. Moving File to Another Directory
echo ""
echo "--- 2. Moving File into Subdirectory ---"
mv -v "$SANDBOX/renamed.txt" "$SANDBOX/folder_a/"
ls -l "$SANDBOX/folder_a"

# 3. Moving Multiple Files Simultaneously
echo ""
echo "--- 3. Moving Multiple Files to Directory ---"
touch "$SANDBOX/report1.csv" "$SANDBOX/report2.csv" "$SANDBOX/report3.csv"
mv -v "$SANDBOX"/report*.csv "$SANDBOX/folder_b/"
ls -l "$SANDBOX/folder_b"

# 4. Moving an Entire Directory (No -r needed!)
echo ""
echo "--- 4. Moving an Entire Directory Hierarchy ---"
mkdir -p "$SANDBOX/parent_dir/child_dir"
echo "Nested file" > "$SANDBOX/parent_dir/child_dir/nested.txt"

echo "Moving parent_dir into folder_a (notice: no -r flag!):"
mv -v "$SANDBOX/parent_dir" "$SANDBOX/folder_a/"
tree -F "$SANDBOX/folder_a"

# 5. Overwrite Protection: No-Clobber (-n) and Backup (-b)
echo ""
echo "--- 5. Protection with -n (No-Clobber) and -b (Backup) ---"
echo "Existing destination content" > "$SANDBOX/folder_a/target.txt"
echo "Incoming new content" > "$SANDBOX/incoming.txt"

echo "Testing mv -n (Silently refuses to overwrite existing destination):"
mv -n -v "$SANDBOX/incoming.txt" "$SANDBOX/folder_a/target.txt"
echo "Destination file content after -n:"
cat "$SANDBOX/folder_a/target.txt"

echo ""
echo "Testing mv -b (Creates automatic backup ~ of target file):"
mv -b -v "$SANDBOX/incoming.txt" "$SANDBOX/folder_a/target.txt"
echo "Target directory entries (notice target.txt~):"
ls -l "$SANDBOX/folder_a/target.txt"*

# 6. Batch Renaming Files with a Bash Loop
echo ""
echo "--- 6. Batch Renaming via Bash Loop (*.txt -> *.md) ---"
touch "$SANDBOX/batch_tests/doc1.txt"
touch "$SANDBOX/batch_tests/doc2.txt"
touch "$SANDBOX/batch_tests/doc3.txt"
echo "Before batch rename:"
ls -1 "$SANDBOX/batch_tests"

for file in "$SANDBOX/batch_tests"/*.txt; do
    [ -f "$file" ] || continue
    mv -v "$file" "${file%.txt}.md"
done

echo ""
echo "After batch rename:"
ls -1 "$SANDBOX/batch_tests"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 14 practice completed successfully."
echo "============================================================"
