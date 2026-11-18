#!/bin/bash
# ============================================================
# practice.sh — VIM In Depth Part 2 (visual, substitution, vimrc)
# Module 05, Lesson 29 | DevOp Camp ZTM
# ============================================================

echo "========================================"
echo "  VIM In Depth Part 2 — Cheat Sheet"
echo "========================================"

SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

cat > sample.txt << 'EOF'
Hello World, hello world
The Fox jumped over the fox
Linux Linux linux LINUX
one two three four five
alpha beta gamma delta
EOF

echo ""
echo "--- Original file ---"
cat -n sample.txt

# 1. Global substitution: replace all 'fox' (case-insensitive) with 'cat'
echo ""
echo "--- After :%s/fox/cat/gi (global case-insensitive replace) ---"
cp sample.txt subst_test.txt
vim -e -s subst_test.txt << 'VIMCMDS'
:%s/fox/cat/gi
:w
:q
VIMCMDS
cat -n subst_test.txt

# 2. Replace only in a range (lines 1-2)
echo ""
echo "--- After :1,2s/hello/goodbye/gi (range replace lines 1-2) ---"
cp sample.txt range_test.txt
vim -e -s range_test.txt << 'VIMCMDS'
:1,2s/hello/goodbye/gi
:w
:q
VIMCMDS
cat -n range_test.txt

# 3. Create a minimal .vimrc
echo ""
echo "--- Recommended ~/.vimrc settings ---"
cat << 'VIMRC'
set number
set relativenumber
set hlsearch
set incsearch
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
syntax on
colorscheme desert
VIMRC

# 4. Visual mode and splits cheat sheet
echo ""
echo "--- Visual Mode ---"
cat << 'REF'
  v         → character-wise selection
  V         → line-wise selection
  Ctrl+V    → block (column) selection
  After selecting:
    d → delete   y → yank   c → change   > → indent
REF

echo ""
echo "--- Split Windows ---"
cat << 'REF'
  :sp file    → horizontal split
  :vsp file   → vertical split
  Ctrl+W h/j/k/l → move between splits
  Ctrl+W =    → equalize split sizes
  :q          → close current split
REF

echo ""
echo "--- Tabs ---"
cat << 'REF'
  :tabnew file   → new tab
  gt / gT        → next / previous tab
  :tabclose      → close tab
REF

echo ""
echo "========================================"
echo "  Apply .vimrc: source ~/.vimrc  (or :source ~/.vimrc in vim)"
echo "========================================"
