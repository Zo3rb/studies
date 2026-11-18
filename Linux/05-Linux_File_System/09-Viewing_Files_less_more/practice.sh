#!/bin/bash
# ============================================================
# practice.sh — Viewing Files with less and more
# Module 05, Lesson 09 | DevOp Camp ZTM
# ============================================================
# Run this script to generate realistic log data and practice
# using the less and more pagers with key navigation shortcuts.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 09: Viewing Files with less and more"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_pagers_$$"
mkdir -p "$SANDBOX"
SAMPLE_LOG="$SANDBOX/sample_server.log"

echo ""
echo "--- 1. Generating a Realistic Multi-Line Server Log (120 lines) ---"
for i in $(seq 1 120); do
    STATUS="200 OK"
    LEVEL="INFO"
    if [ $((i % 25)) -eq 0 ]; then
        STATUS="500 Internal Server Error"
        LEVEL="ERROR"
    elif [ $((i % 10)) -eq 0 ]; then
        STATUS="404 Not Found"
        LEVEL="WARN"
    fi
    echo "2026-11-18 00:$(printf "%02d" $((i % 60))):00 [thread-$((i % 4))] $LEVEL Request #$i - /api/v1/resource - Status: $STATUS" >> "$SAMPLE_LOG"
done
echo "Created $SAMPLE_LOG with $(wc -l < "$SAMPLE_LOG") lines."

# 2. Verifying Available Pagers
echo ""
echo "--- 2. Verifying Installed Pagers ---"
echo "Default PAGER environment variable: ${PAGER:-less}"
echo "less binary location: $(command -v less || echo 'not found')"
echo "more binary location: $(command -v more || echo 'not found')"

# 3. Previewing Sample Data
echo ""
echo "--- 3. Previewing Sample Data (First 5 lines) ---"
head -n 5 "$SAMPLE_LOG"

# 4. Interactive Navigation Cheatsheet
echo ""
echo "============================================================"
echo "  PAGER INTERACTIVE SHORTCUT CHEATSHEET (inside less):"
echo "============================================================"
echo "  Navigation:"
echo "    Space / f    : Forward one full screen"
echo "    b            : Backward one full screen"
echo "    Enter / j    : Down one line"
echo "    k            : Up one line"
echo "    g            : Jump to top (line 1)"
echo "    G            : Jump to bottom (last line)"
echo "    50g          : Jump to line 50"
echo "  Search:"
echo "    /ERROR       : Search forward for 'ERROR'"
echo "    ?WARN        : Search backward for 'WARN'"
echo "    n            : Next match"
echo "    N            : Previous match"
echo "  Flags:"
echo "    less -N file : Display line numbers"
echo "    less -S file : Chop long lines (horizontal scroll)"
echo "    less +F file : Live follow mode (Ctrl+C to break back to pager)"
echo "  Exit:"
echo "    q            : Quit less immediately"
echo "============================================================"

echo ""
echo "--- 4. Manual Practice Instructions ---"
echo "To practice interactively with the generated sample log in your terminal, run:"
echo "  less -N $SAMPLE_LOG"
echo "  less -S $SAMPLE_LOG"
echo "  less +/ERROR $SAMPLE_LOG"

# Clean up sandbox
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 09 practice completed successfully."
echo "============================================================"
