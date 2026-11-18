#!/bin/bash
# ==============================================================================
# practice.sh — Getting Help and Man Pages
# Module 03, Lesson 02 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates classifying commands with type, reading builtin help with help,
# looking up one-liners with whatis, searching descriptions with apropos / man -k,
# and inspecting manual page sections without blocking terminal execution.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 02: Getting Help and Man Pages"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Determining Command Nature with `type`
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Classifying Commands with 'type' ---"
echo "Checking 'cd':"
type cd

echo ""
echo "Checking 'ls':"
type ls

echo ""
echo "Checking all definitions of 'ls' (including aliases and binaries) with 'type -a':"
type -a ls

echo ""
echo "Checking 'echo' (has both builtin and disk binary):"
type -a echo

# ------------------------------------------------------------------------------
# 2. Reading Help for Shell Builtins with `help`
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Using 'help' for Shell Builtins ---"
echo "Help synopsis for 'cd':"
help cd | awk 'NR<=6'

echo ""
echo "Help synopsis for 'pwd':"
help pwd | awk 'NR<=6'

# ------------------------------------------------------------------------------
# 3. Reading One-Line Summaries with `whatis`
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] One-Line Manual Page Summaries with 'whatis' ---"
for tool in ls cp mkdir date; do
    printf "Summary for %-6s: " "'$tool'"
    whatis "$tool" 2>/dev/null | awk 'NR==1' || echo "(not found in whatis database)"
done

# ------------------------------------------------------------------------------
# 4. Keyword Discovery with `apropos` and `man -k`
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Keyword Search with 'apropos' and 'man -k' ---"
echo "Searching man pages related to 'copy' (first 5 matches):"
apropos copy 2>/dev/null | awk 'NR<=5'

echo ""
echo "Equivalent search using 'man -k compress' (first 5 matches):"
man -k compress 2>/dev/null | awk 'NR<=5'

# ------------------------------------------------------------------------------
# 5. Understanding Multiple Manual Sections (e.g., passwd in Sec 1 vs Sec 5)
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Multi-Section Man Pages ---"
echo "Inspecting all available manual sections for 'passwd':"
whatis passwd 2>/dev/null || true

echo ""
echo "Header of Section 1 manual (User Command):"
man 1 passwd 2>/dev/null | col -b | awk 'NR<=6'

echo ""
echo "Header of Section 5 manual (File Format /etc/passwd):"
man 5 passwd 2>/dev/null | col -b | awk 'NR<=6'

echo ""
echo "============================================================"
echo "  Lesson 02 practice completed successfully!"
echo "============================================================"
