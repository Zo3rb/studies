#!/bin/bash
# ============================================================
# practice.sh — File Types in Linux
# Module 05, Lesson 07 | DevOp Camp ZTM
# ============================================================
# Run this script to inspect and identify all 7 Linux file types:
# - Regular files (-)
# - Directories (d)
# - Symbolic links (l)
# - Character devices (c)
# - Block devices (b)
# - Named pipes / FIFOs (p)
# - Sockets (s)
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 07: File Types in Linux"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_filetypes_$$"
mkdir -p "$SANDBOX/mydir"

# 1. Regular File (-)
touch "$SANDBOX/regular_file.txt"
echo "echo 'hello'" > "$SANDBOX/executable_file.sh"
chmod +x "$SANDBOX/executable_file.sh"

# 2. Directory (d)
# already created: $SANDBOX/mydir

# 3. Symbolic Link (l)
ln -s "$SANDBOX/regular_file.txt" "$SANDBOX/symlink_file"

# 4. Named Pipe / FIFO (p)
mkfifo "$SANDBOX/named_pipe"

# 5. Character Device (c) — Reference system device
CHAR_DEV="/dev/null"

# 6. Block Device (b) — Locate available block device safely
BLOCK_DEV=""
for dev in /dev/sda /dev/sda1 /dev/nvme0n1 /dev/vda /dev/loop0; do
    if [ -b "$dev" ]; then
        BLOCK_DEV="$dev"
        break
    fi
done

# 7. Socket (s) — Locate active system socket safely
SOCK_FILE=$(find /run -type s 2>/dev/null | head -n 1 || true)

echo ""
echo "--- 1. Inspecting the 7 File Types via ls -l (First Character) ---"
printf "%-20s %-10s %s\n" "TYPE" "SYMBOL" "SAMPLE OBJECT"
echo "------------------------------------------------------------"
printf "%-20s %-10s %s\n" "Regular File" "-" "$(ls -ld "$SANDBOX/regular_file.txt")"
printf "%-20s %-10s %s\n" "Directory" "d" "$(ls -ld "$SANDBOX/mydir")"
printf "%-20s %-10s %s\n" "Symbolic Link" "l" "$(ls -ld "$SANDBOX/symlink_file")"
printf "%-20s %-10s %s\n" "Named Pipe (FIFO)" "p" "$(ls -ld "$SANDBOX/named_pipe")"
printf "%-20s %-10s %s\n" "Character Device" "c" "$(ls -ld "$CHAR_DEV")"
if [ -n "$BLOCK_DEV" ]; then
    printf "%-20s %-10s %s\n" "Block Device" "b" "$(ls -ld "$BLOCK_DEV")"
fi
if [ -n "$SOCK_FILE" ]; then
    printf "%-20s %-10s %s\n" "Domain Socket" "s" "$(ls -ld "$SOCK_FILE")"
fi

# 2. Inspecting via ls -F indicators
echo ""
echo "--- 2. File Classification Symbols via ls -F ---"
ls -F "$SANDBOX"

# 3. Deep Content Inspection with file command
echo ""
echo "--- 3. Identifying True File Format via file Command ---"
file "$SANDBOX/regular_file.txt"
file "$SANDBOX/executable_file.sh"
file "$SANDBOX/mydir"
file "$SANDBOX/symlink_file"
file "$SANDBOX/named_pipe"
file "$CHAR_DEV"
[ -n "$BLOCK_DEV" ] && file "$BLOCK_DEV"
[ -n "$SOCK_FILE" ] && file "$SOCK_FILE"

echo ""
echo "MIME type of executable shell script (file -i):"
file -i "$SANDBOX/executable_file.sh"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 07 practice completed successfully."
echo "============================================================"
