#!/bin/bash
# ==============================================================================
# practice.sh — Mastering the Terminal: The TAB Key
# Module 03, Lesson 04 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates Bash auto-completion mechanics, candidate listing, partial
# completion behavior, and the underlying compgen engine.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 04: Mastering the Terminal — The TAB Key"
echo "============================================================"

# Create an isolated temporary sandbox
SANDBOX=$(mktemp -d /tmp/tab_completion_sandbox.XXXXXX)
trap 'rm -rf "$SANDBOX"' EXIT

cd "$SANDBOX"

# ------------------------------------------------------------------------------
# 1. Simulating Command Candidates (Double-TAB on Commands)
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Command Completion Lookup with 'compgen -c' ---"
echo "Simulating what Double-TAB lists when typing 'rm':"
compgen -c rm | sort -u | sed 's/^/  • /'

echo ""
echo "Simulating what Double-TAB lists when typing 'who':"
compgen -c who | sort -u | sed 's/^/  • /'

# ------------------------------------------------------------------------------
# 2. File and Directory Path Completion
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] File and Directory Completion Simulation ---"
mkdir -p project_backup project_docs project_source
touch project_backup/archive.tar.gz
touch project_docs/manual.pdf
touch project_source/main.py project_source/utils.py

echo "Created sandbox directory structure:"
ls -d project_*

echo ""
echo "Candidate directories matching 'project_' (compgen -d):"
compgen -d project_ | sed 's/^/  📁 /'

echo ""
echo "Files inside project_source/ matching 'm':"
compgen -f project_source/m | sed 's/^/  📄 /'

# ------------------------------------------------------------------------------
# 3. Step-by-Step Longest Common Prefix (Partial Completion)
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Demonstrating Longest Common Prefix Mechanics ---"
touch report_2026_q1_finance.csv
touch report_2026_q1_marketing.csv
touch report_2026_q2_finance.csv

echo "Created test files:"
ls -1 report_*

echo ""
echo "Step 1: User types 'report_' and presses TAB:"
MATCHES=( $(compgen -f report_) )
echo "  Matching candidates (${#MATCHES[@]} found): ${MATCHES[*]}"
echo "  Common prefix expands to: report_2026_q"

echo ""
echo "Step 2: User types '1' ('report_2026_q1') and presses TAB:"
MATCHES=( $(compgen -f report_2026_q1) )
echo "  Matching candidates (${#MATCHES[@]} found): ${MATCHES[*]}"
echo "  Common prefix expands to: report_2026_q1_"

echo ""
echo "Step 3: User types 'f' ('report_2026_q1_f') and presses TAB:"
MATCHES=( $(compgen -f report_2026_q1_f) )
echo "  Unique match found! Full completion: ${MATCHES[0]}"

# ------------------------------------------------------------------------------
# 4. Environment Variable Auto-Completion
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Shell Variable Completion (compgen -v) ---"
echo "Listing variables starting with 'HIST':"
compgen -v HIST | sed 's/^/  💲 /'

echo ""
echo "============================================================"
echo "  Lesson 04 practice completed successfully!"
echo "============================================================"
