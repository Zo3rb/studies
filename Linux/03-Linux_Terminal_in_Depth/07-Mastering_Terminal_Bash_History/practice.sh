#!/bin/bash
# ==============================================================================
# practice.sh — Mastering the Terminal: The Bash History
# Module 03, Lesson 07 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates history configuration variables, history recording, entry deletion,
# buffer clearing, disk persistence, and history expansion simulation.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system (uses isolated sandbox history file).
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 07: Mastering the Terminal — The Bash History"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Inspecting Default History Environment Variables
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Default History Configuration ---"
echo "Active HISTSIZE (in-memory buffer limit)  : ${HISTSIZE:-1000}"
echo "Active HISTFILESIZE (disk file line limit): ${HISTFILESIZE:-2000}"
echo "Active HISTFILE (disk storage path)       : ${HISTFILE:-$HOME/.bash_history}"

# ------------------------------------------------------------------------------
# 2. Operating with an Isolated Sandbox History File
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Isolated History Session Setup ---"
# Set up a sandbox history file so we never tamper with the user's real history
SANDBOX_HIST=$(mktemp /tmp/sandbox_history.XXXXXX)
trap 'rm -f "$SANDBOX_HIST"' EXIT

export HISTFILE="$SANDBOX_HIST"
export HISTSIZE=50
export HISTFILESIZE=50

# Enable history tracking inside this bash script
set -o history
history -c  # start with empty buffer

# Add sample commands into session history
history -s "echo 'First command: Hello World'"
history -s "ls -la /var/log"
history -s "grep -i 'error' /var/log/syslog"
history -s "cat /etc/hosts"
history -s "sudo systemctl status nginx"

echo "Current in-memory history list:"
history

# ------------------------------------------------------------------------------
# 3. Deleting a Specific History Entry with 'history -d <line>'
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Deleting a Specific Entry with 'history -d' ---"
echo "Deleting entry #3 ('grep -i error ...'):"
history -d 3

echo ""
echo "History list after deleting entry #3:"
history

# ------------------------------------------------------------------------------
# 4. Writing In-Memory History to Disk with 'history -w'
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Writing In-Memory History to Disk File ('history -w') ---"
history -w "$SANDBOX_HIST"

echo "Raw contents of the sandbox history file on disk ($SANDBOX_HIST):"
cat -n "$SANDBOX_HIST"

# ------------------------------------------------------------------------------
# 5. Clearing In-Memory Buffer with 'history -c'
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Clearing In-Memory Buffer ('history -c') ---"
history -c
echo "History count in RAM after 'history -c': $(history | wc -l)"

# ------------------------------------------------------------------------------
# 6. Demonstrating History Expansion Syntax ('history -p')
# ------------------------------------------------------------------------------
echo ""
echo "--- [6] Demonstrating History Expansion Operators ('history -p') ---"
# Re-populate test history entries
history -s "apt-get update"
history -s "mkdir -p /opt/myapp/configs"

echo "Current history entries:"
history

echo ""
echo "Bang-Bang (!!) expansion with sudo:"
EXPANDED_BANG=$(history -p 'sudo !!')
echo "  'sudo !!' -> '$EXPANDED_BANG'"

echo ""
echo "Last Argument (!\$) expansion for cd:"
EXPANDED_ARG=$(history -p 'cd !$')
echo "  'cd !$'   -> '$EXPANDED_ARG'"

echo ""
echo "Prefix match (!apt) expansion:"
EXPANDED_PREFIX=$(history -p '!apt')
echo "  '!apt'    -> '$EXPANDED_PREFIX'"

echo ""
echo "============================================================"
echo "  Lesson 07 practice completed successfully!"
echo "============================================================"
