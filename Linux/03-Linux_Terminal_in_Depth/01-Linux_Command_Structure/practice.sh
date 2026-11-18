#!/bin/bash
# ==============================================================================
# practice.sh — Linux Command Structure
# Module 03, Lesson 01 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates command anatomy, short vs long options, combined short options,
# case sensitivity, the double-dash (--) delimiter, echo, date, and cal.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 01: Linux Command Structure"
echo "============================================================"

# Create an isolated temporary sandbox directory for experiments
SANDBOX=$(mktemp -d /tmp/cmd_structure_sandbox.XXXXXX)
trap 'rm -rf "$SANDBOX"' EXIT

cd "$SANDBOX"

# ------------------------------------------------------------------------------
# 1. Anatomy of a Command: Command [Options] [Arguments]
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Anatomy of a Command ---"
touch file1.txt file2.log .hidden_config.cfg
mkdir -p subfolder

echo "Command with no options, no arguments:"
ls

echo ""
echo "Command with short option (-l) and argument (file1.txt):"
ls -l file1.txt

# ------------------------------------------------------------------------------
# 2. Short Options vs. Long Options vs. Combined Options
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Short Options vs Long Options vs Combined Options ---"

echo "Short separate options (ls -l -a):"
ls -l -a

echo ""
echo "Long options equivalent (ls --all --format=long):"
ls --all -l

echo ""
echo "Combined short options (ls -la):"
ls -la

# ------------------------------------------------------------------------------
# 3. Case Sensitivity in Linux
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Demonstrating Case Sensitivity ---"
touch alpha.txt Alpha.txt ALPHA.TXT

echo "Listing directory to show 3 separate files created:"
ls -1 [aA]*

echo ""
echo "Checking invalid uppercase command 'DATE':"
if DATE 2>/dev/null; then
    echo "DATE succeeded."
else
    echo "  -> Expected error: 'DATE' command not found (Linux commands are strictly lowercase/case-sensitive)."
fi

# ------------------------------------------------------------------------------
# 4. Demonstrating the Double Dash (--) Delimiter
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Safely Handling Files Starting with a Hyphen (-) ---"
# Creating a file named '-hyphenated_file.txt'
touch -- -hyphenated_file.txt

echo "Listing the file using -- to prevent it from being parsed as a flag:"
ls -l -- -hyphenated_file.txt

# Remove it safely
rm -- -hyphenated_file.txt
echo "Removed -hyphenated_file.txt safely."

# ------------------------------------------------------------------------------
# 5. Exploring Utility Commands: echo, date, cal
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Utility Commands: echo, date, and cal ---"

echo "[echo] Without trailing newline (-n):"
echo -n "Progress: 100% "
echo "[Completed]"

echo "[echo] Interpreting escapes (-e):"
echo -e "Item\tPrice\nApple\t\$1.00\nOrange\t\$0.75"

echo ""
echo "[date] Default date output:"
date

echo "[date] UTC date (-u):"
date -u

echo "[date] Custom formatted string (+%Y-%m-%d %H:%M:%S):"
date "+%Y-%m-%d %H:%M:%S"

echo ""
echo "[cal] Testing calendar command:"
if command -v cal &>/dev/null; then
    echo "Current month calendar:"
    cal
    echo ""
    echo "Three-month calendar (cal -3):"
    cal -3
else
    echo "cal utility is not installed (install via: sudo apt install bsdmainutils / ncal)."
fi

echo ""
echo "============================================================"
echo "  Lesson 01 practice completed successfully!"
echo "============================================================"
