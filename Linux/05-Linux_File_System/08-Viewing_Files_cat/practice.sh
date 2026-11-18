#!/bin/bash
# ============================================================
# practice.sh — Viewing Files with cat and tac
# Module 05, Lesson 08 | DevOp Camp ZTM
# ============================================================
# Run this script to test all flags and features of cat and tac:
# - Reading and concatenating files
# - Line numbering (-n, -b)
# - Squeezing empty lines (-s)
# - Displaying hidden characters (-A)
# - Scripted heredoc file creation and appending
# - Reverse line viewing with tac
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 08: Viewing Files with cat and tac"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_cat_$$"
mkdir -p "$SANDBOX"

# Create a sample file with spaces, tabs, and repeated blank lines
cat << 'EOF' > "$SANDBOX/sample_spaced.txt"
Line 1: Normal text
Line 2: Contains	tab	characters



Line 3: Follows multiple blank lines

Line 4: Final line with trailing spaces   
EOF

# 1. Standard cat Output
echo ""
echo "--- 1. Standard cat Output ---"
cat "$SANDBOX/sample_spaced.txt"

# 2. Line Numbering: All lines (-n) vs Non-blank (-b)
echo ""
echo "--- 2. Line Numbering: All lines (cat -n) ---"
cat -n "$SANDBOX/sample_spaced.txt"

echo ""
echo "--- Line Numbering: Non-blank lines only (cat -b) ---"
cat -b "$SANDBOX/sample_spaced.txt"

# 3. Squeezing Blank Lines (-s)
echo ""
echo "--- 3. Squeeze Multiple Blank Lines (cat -s) ---"
cat -s "$SANDBOX/sample_spaced.txt"

# 4. Revealing Hidden Characters & Tabs (cat -A)
echo ""
echo "--- 4. Revealing Tabs and Line Endings (cat -A) ---"
echo "(Tabs show as ^I, line endings show as $)"
cat -A "$SANDBOX/sample_spaced.txt"

# 5. Concatenating Multiple Files
echo ""
echo "--- 5. Concatenating Multiple Files into One ---"
echo "Header section" > "$SANDBOX/part1.txt"
echo "Body section" > "$SANDBOX/part2.txt"
echo "Footer section" > "$SANDBOX/part3.txt"

cat "$SANDBOX/part1.txt" "$SANDBOX/part2.txt" "$SANDBOX/part3.txt" > "$SANDBOX/full_document.txt"
echo "Combined document output:"
cat "$SANDBOX/full_document.txt"

# 6. Creating and Appending via Redirection & Heredoc
echo ""
echo "--- 6. Creating and Appending via Heredoc ---"
cat << 'EOF' > "$SANDBOX/config.cfg"
[database]
host = 127.0.0.1
port = 5432
EOF

cat << 'EOF' >> "$SANDBOX/config.cfg"
user = postgres
ssl = true
EOF

echo "Resulting config.cfg content:"
cat "$SANDBOX/config.cfg"

# 7. Reverse Line Output with tac
echo ""
echo "--- 7. Reverse Line Output with tac ---"
echo "Counting 1 to 5 with cat:"
seq 1 5 > "$SANDBOX/numbers.txt"
cat "$SANDBOX/numbers.txt"

echo ""
echo "Reversing numbers.txt line-by-line with tac:"
tac "$SANDBOX/numbers.txt"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 08 practice completed successfully."
echo "============================================================"
