#!/bin/bash
# ==============================================================================
# practice.sh — Terminals, Consoles, Shells, and Commands
# Module 03, Lesson 00 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates how to inspect the terminal device, identify the running shell,
# query valid login shells, examine process hierarchy, and understand the REPL.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 00: Terminals, Consoles, Shells, and Commands"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Identify the Current Terminal Device (TTY / PTS)
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Checking Current Terminal Device (`tty`) ---"
CURRENT_TTY=$(tty 2>/dev/null || echo "Not a TTY (running in non-interactive pipeline)")
echo "Current Terminal Device Node: $CURRENT_TTY"

if [[ "$CURRENT_TTY" =~ /dev/pts/ ]]; then
    echo "  -> You are connected via a Pseudo-Terminal (PTS), e.g., GUI emulator or SSH."
elif [[ "$CURRENT_TTY" =~ /dev/tty ]]; then
    echo "  -> You are on a Virtual Console (Linux TTY)."
else
    echo "  -> Standard input is not a terminal device (e.g. automated subshell)."
fi

# ------------------------------------------------------------------------------
# 2. Check the Configured Login Shell vs Currently Running Shell
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Inspecting Shell Environment Variables ---"
echo "Configured login shell (\$SHELL)     : $SHELL"
echo "Currently executing script/shell (\$0): $0"
echo "Bash version                        : $BASH_VERSION"

# ------------------------------------------------------------------------------
# 3. View All Approved System Shells (/etc/shells)
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Inspecting /etc/shells (Approved Login Shells) ---"
if [ -f /etc/shells ]; then
    echo "Contents of /etc/shells:"
    grep -v '^#' /etc/shells | grep -v '^$' | sed 's/^/  • /'
else
    echo "⚠️  /etc/shells not found on this system."
fi

# ------------------------------------------------------------------------------
# 4. Process Status and Process Tree for Current Shell
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Process Status of Current Shell Process (PID: $$) ---"
echo "Command: ps -f -p $$"
ps -f -p $$

echo ""
echo "Command: ps -o pid,ppid,tty,stat,time,comm -p $$"
ps -o pid,ppid,tty,stat,time,comm -p $$

# ------------------------------------------------------------------------------
# 5. Explaining Command Types and the REPL Cycle
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Demonstrating Command Classification (Builtin vs External) ---"
COMMANDS=("cd" "ls" "echo" "pwd" "grep" "history")

for cmd in "${COMMANDS[@]}"; do
    CMD_TYPE=$(type -t "$cmd" 2>/dev/null || echo "not found")
    CMD_LOCATION=$(type -p "$cmd" 2>/dev/null || echo "built into shell")
    printf "  • %-10s -> Type: %-10s | Path: %s\n" "$cmd" "$CMD_TYPE" "$CMD_LOCATION"
done

echo ""
echo "============================================================"
echo "  Lesson 00 practice completed successfully!"
echo "============================================================"
