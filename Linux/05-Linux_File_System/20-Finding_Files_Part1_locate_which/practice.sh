#!/bin/bash
# ============================================================
# practice.sh — Finding Files Part 1: locate, which, whereis
# Module 05, Lesson 20 | DevOp Camp ZTM
# ============================================================
# Run this script to practice locate, which, and whereis.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 20: Finding Files Part 1 (locate, which, whereis)"
echo "============================================================"

# 1. Inspect locate / plocate installation
echo ""
echo "--- 1. Checking locate availability and DB stats ---"
if command -v locate &>/dev/null; then
    echo "✅ locate is installed at: $(which locate)"
    echo "Database statistics:"
    locate -S || true
else
    echo "ℹ️  locate is not installed. You can install it with: sudo apt install plocate"
fi

# 2. Searching with locate
echo ""
echo "--- 2. Searching with locate ---"
if command -v locate &>/dev/null; then
    echo "Limiting results to 5 matches for '*.conf' (-n 5):"
    locate -n 5 "*.conf" || true

    echo ""
    echo "Case-insensitive search for 'NGINX' (-i):"
    locate -i -n 3 "nginx" || true

    echo ""
    echo "Matching exact basename 'passwd' (-b):"
    locate -b "\passwd" | head -n 5 || true

    echo ""
    echo "Counting total '.log' files indexed (-c):"
    locate -c "*.log" || true
else
    echo "(Skipping locate tests — locate not present)"
fi

# 3. Locating executables with which
echo ""
echo "--- 3. Locating Executable Binaries with 'which' ---"
echo -n "Path to bash: "
which bash

echo -n "Path to python3: "
which python3 || echo "python3 not found"

echo -n "Path to tar: "
which tar

echo -n "Path to grep: "
which grep

# 4. Testing which against shell built-ins
echo ""
echo "--- 4. 'which' vs Shell Built-ins ---"
echo "Running 'which cd' (built-in command):"
if which cd 2>/dev/null; then
    echo "which found cd"
else
    echo "which returned nothing for 'cd' because cd is a shell built-in!"
fi

echo ""
echo "Using 'type -a' to inspect built-ins vs binaries:"
type -a cd
type -a echo
type -a ls

# 5. Exploring whereis (binaries + man pages + source)
echo ""
echo "--- 5. Exploring 'whereis' ---"
echo "Running whereis for 'grep':"
whereis grep

echo ""
echo "Running whereis -b (binaries only) for 'systemd':"
whereis -b systemd

echo ""
echo "Running whereis -m (manual pages only) for 'passwd':"
whereis -m passwd

echo ""
echo "============================================================"
echo "  Done! Lesson 20 practice completed successfully."
echo "============================================================"
