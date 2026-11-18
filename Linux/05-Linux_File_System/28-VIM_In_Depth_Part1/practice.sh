#!/bin/bash
# ============================================================
# practice.sh — VIM In Depth Part 1 (search, delete, yank, undo)
# Module 05, Lesson 28 | DevOp Camp ZTM
# ============================================================

echo "========================================"
echo "  VIM In Depth Part 1 — Cheat Sheet"
echo "========================================"

SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

# Create a sample file for practice context
cat > sample.txt << 'EOF'
The quick brown fox jumps over the lazy dog.
Linux is a powerful operating system.
VIM is the editor of choice for many developers.
Learning VIM takes practice but pays off greatly.
The quick brown fox appears again in this line.
System administrators use VIM daily on servers.
EOF

echo ""
echo "--- Sample file created: sample.txt ---"
cat -n sample.txt

echo ""
echo "--- VIM Search Commands ---"
cat << 'REF'
  /pattern    → search forward (press Enter, then n/N to navigate)
  ?pattern    → search backward
  *           → search for word under cursor (forward)
  #           → search for word under cursor (backward)
  :noh        → clear highlights
REF

echo ""
echo "--- VIM Delete Commands ---"
cat << 'REF'
  x           → delete char under cursor
  dd          → delete line
  5dd         → delete 5 lines
  dw          → delete to end of word
  D or d$     → delete to end of line
  dgg         → delete to top of file
  dG          → delete to bottom of file
REF

echo ""
echo "--- VIM Yank & Paste ---"
cat << 'REF'
  yy          → yank (copy) current line
  3yy         → yank 3 lines
  yw          → yank word
  p           → paste AFTER cursor / BELOW line
  P           → paste BEFORE cursor / ABOVE line
REF

echo ""
echo "--- Undo / Redo ---"
cat << 'REF'
  u           → undo last change
  Ctrl+R      → redo
  .           → repeat last change (the dot command!)
REF

# Demonstrate non-interactive vim edits
echo ""
echo "--- Demonstrating: delete line 3 and paste after line 5 (via Ex mode) ---"
vim -e -s sample.txt << 'VIMCMDS'
:3d
:5put
:w
:q
VIMCMDS
echo "After delete+paste:"
cat -n sample.txt

echo ""
echo "========================================"
echo "  Practice interactively: vim sample.txt"
echo "========================================"
