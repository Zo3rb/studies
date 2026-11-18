#!/bin/bash
# ============================================================
# practice.sh — The LS Command In Depth
# Module 05, Lesson 04 | DevOp Camp ZTM
# ============================================================
# Run this script to test and observe all key flags of the ls command.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 04: The LS Command In Depth"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_ls_$$"
mkdir -p "$SANDBOX/subdir/nested"

# Create diverse test files
echo "small" > "$SANDBOX/file_small.txt"
dd if=/dev/zero of="$SANDBOX/file_1mb.bin" bs=1024 count=1024 2>/dev/null
dd if=/dev/zero of="$SANDBOX/file_512k.bin" bs=1024 count=512 2>/dev/null
touch "$SANDBOX/.hidden_config"
touch "$SANDBOX/script.sh" && chmod +x "$SANDBOX/script.sh"
ln -s "$SANDBOX/file_small.txt" "$SANDBOX/symlink_to_small"
touch "$SANDBOX/subdir/child_file.txt"

# 1. Standard listing vs 1 per line
echo ""
echo "--- 1. Standard ls vs One-Per-Line (ls -1) ---"
echo "ls:"
ls "$SANDBOX"
echo ""
echo "ls -1:"
ls -1 "$SANDBOX"

# 2. Hidden files (-a vs -A)
echo ""
echo "--- 2. Hidden Files (ls -a vs ls -A) ---"
echo "ls -a (includes . and ..):"
ls -a "$SANDBOX"
echo ""
echo "ls -A (omits . and ..):"
ls -A "$SANDBOX"

# 3. Long listing (-l) and human-readable (-h)
echo ""
echo "--- 3. Long Listing and Human Sizes (ls -l vs ls -lh) ---"
echo "ls -l (raw byte sizes):"
ls -l "$SANDBOX"
echo ""
echo "ls -lh (human readable K/M):"
ls -lh "$SANDBOX"

# 4. Inode numbers (-i) and File Type Indicators (-F)
echo ""
echo "--- 4. Inode Numbers (-i) and Type Indicators (-F) ---"
echo "ls -laiF:"
ls -laiF "$SANDBOX"

# 5. Directory itself (-d)
echo ""
echo "--- 5. Listing Directory Itself (ls -d vs ls) ---"
echo "Listing contents of directory: ls $SANDBOX/subdir"
ls "$SANDBOX/subdir"
echo ""
echo "Listing directory metadata: ls -ld $SANDBOX/subdir"
ls -ld "$SANDBOX/subdir"

# 6. Sorting by Size (-S) and Reversing (-r)
echo ""
echo "--- 6. Sorting by Size (ls -lhS) & Reverse (ls -lhSr) ---"
echo "Largest files first (ls -lhS):"
ls -lhS "$SANDBOX"
echo ""
echo "Smallest files first (ls -lhSr):"
ls -lhSr "$SANDBOX"

# 7. Sorting by Timestamp (-t) and Oldest First (-ltr)
echo ""
echo "--- 7. Sorting by Modification Time (ls -lt vs ls -ltr) ---"
# Give distinct timestamps
touch -d "2 hours ago" "$SANDBOX/file_small.txt"
touch -d "10 minutes ago" "$SANDBOX/file_512k.bin"
touch -d "now" "$SANDBOX/file_1mb.bin"

echo "Newest first (ls -lt):"
ls -lt "$SANDBOX"
echo ""
echo "Oldest first / newest at bottom (ls -ltr):"
ls -ltr "$SANDBOX"

# 8. Recursive Listing (-R)
echo ""
echo "--- 8. Recursive Listing (ls -R) ---"
ls -R "$SANDBOX"

# 9. Colorized output (--color=always)
echo ""
echo "--- 9. Colorized Output (ls --color=always -F) ---"
ls --color=always -F "$SANDBOX"

# Clean up sandbox
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 04 practice completed successfully."
echo "============================================================"
