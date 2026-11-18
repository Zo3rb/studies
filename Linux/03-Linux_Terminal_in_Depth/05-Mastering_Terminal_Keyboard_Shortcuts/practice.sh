#!/bin/bash
# ==============================================================================
# practice.sh — Mastering the Terminal: Keyboard Shortcuts
# Module 03, Lesson 05 | DevOp Camp ZTM
# ==============================================================================
# Inspects Readline keybindings, displays terminal driver control settings (stty),
# simulates Readline cursor movement & kill ring operations, and demonstrates
# process signal handling.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 05: Mastering Terminal Keyboard Shortcuts"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Inspecting Terminal Driver Control Characters (stty)
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Terminal Driver Special Characters (stty -a) ---"
if command -v stty &>/dev/null && [ -t 0 ]; then
    stty -a | grep -E "intr|susp|eof|kill|werase|start|stop" || stty -a | head -n 3
else
    echo "Current environment special characters (standard Linux defaults):"
    echo "  • Interrupt (SIGINT) : Ctrl + C (^C)"
    echo "  • Suspend   (SIGTSTP): Ctrl + Z (^Z)"
    echo "  • End-Of-File (EOF)  : Ctrl + D (^D)"
    echo "  • Kill Line (kill)   : Ctrl + U (^U)"
    echo "  • Word Erase (werase): Ctrl + W (^W)"
    echo "  • Flow Stop / Start  : Ctrl + S / Ctrl + Q"
fi

# ------------------------------------------------------------------------------
# 2. Inspecting GNU Readline Key Bindings (bind -P)
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] GNU Readline Key Bindings Verification ---"
echo "Inspecting bindings for key terminal editing functions:"

SHORTCUT_FUNCTIONS=(
    "beginning-of-line"
    "end-of-line"
    "unix-line-discard"
    "kill-line"
    "backward-kill-word"
    "kill-word"
    "yank"
    "clear-screen"
    "reverse-search-history"
)

for func in "${SHORTCUT_FUNCTIONS[@]}"; do
    BINDING=$(bind -P 2>/dev/null | grep "^$func " || echo "$func is not bound")
    printf "  %-25s -> %s\n" "$func" "$BINDING"
done

# ------------------------------------------------------------------------------
# 3. Simulating Readline Kill Ring Operations in Code
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Simulating Readline Line Editing & Kill Ring ---"

SAMPLE_LINE="apt install nginx postgresql redis-server"
echo "Initial command line      : '$SAMPLE_LINE'"

echo ""
echo "[Simulation of Ctrl+A + inserting 'sudo ']:"
CURSOR_POS=0
NEW_LINE="sudo $SAMPLE_LINE"
echo "Modified command line     : '$NEW_LINE'"

echo ""
echo "[Simulation of Ctrl+W (cut previous word)]:"
WORD_TO_CUT="redis-server"
KILL_RING="$WORD_TO_CUT"
TRIMMED_LINE="${SAMPLE_LINE% $WORD_TO_CUT}"
echo "Line after cutting word   : '$TRIMMED_LINE'"
echo "Readline Kill Ring buffer : '$KILL_RING'"

echo ""
echo "[Simulation of Ctrl+Y (yank / paste back)]:"
PASTED_LINE="$TRIMMED_LINE $KILL_RING"
echo "Line after Ctrl+Y (yank)  : '$PASTED_LINE'"

# ------------------------------------------------------------------------------
# 4. Process Signals Demonstration (SIGINT Trap)
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Process Signal Demonstration (Ctrl+C = SIGINT) ---"
echo "Simulating a command running in background that catches SIGINT:"

(
    trap 'echo "  -> Caught SIGINT (Ctrl+C)! Cleaning up and exiting cleanly."; exit 0' INT
    # Send SIGINT to this subshell process
    kill -INT "$BASHPID" 2>/dev/null || true
)

echo ""
echo "============================================================"
echo "  Lesson 05 practice completed successfully!"
echo "============================================================"
