#!/bin/bash
# ============================================================
# practice.sh — VIM Basics
# Module 05, Lesson 27 | DevOp Camp ZTM
# ============================================================
# Note: VIM is interactive. This script shows non-interactive
# usage patterns using vim -e (Ex mode) and heredocs.
# ============================================================

echo "========================================"
echo "  VIM Basics — Non-Interactive Practice"
echo "========================================"

SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

# 1. Create a file using vim in Ex mode (non-interactive)
echo ""
echo "--- Creating a file with vim (Ex mode) ---"
vim -e -s - <<'EOF'
:e practice.txt
:i
Line 1: Hello from VIM
Line 2: Learning VIM is essential
Line 3: Normal mode is the default
Line 4: Use i to enter Insert mode
Line 5: Use Esc to return to Normal mode
.
:w
:q
EOF
echo "File created:"
cat practice.txt

# 2. Show vim --version info (what features are compiled in)
echo ""
echo "--- VIM Version ---"
vim --version | head -5

# 3. Demonstrate vim key reference
echo ""
echo "--- VIM Mode Cheat Sheet ---"
cat << 'CHEATSHEET'
  MODES:
    Normal   → default, press Esc to return here
    Insert   → i (before), a (after), o (new line below), O (new line above)
    Visual   → v (char), V (line), Ctrl+V (block)
    Command  → : (save, quit, substitute)

  OPEN / CLOSE:
    vim file       → open file
    :w             → save
    :q             → quit
    :wq or :x      → save and quit
    :q!            → quit without saving
    ZZ             → save and quit (Normal shortcut)

  NAVIGATION (Normal mode):
    h j k l        → left down up right
    w / b          → next / prev word
    0 / $          → start / end of line
    gg / G         → top / bottom of file
    :N             → go to line N
CHEATSHEET

echo ""
echo "========================================"
echo "  Open any file with 'vim filename' to practice interactively!"
echo "========================================"
