#!/bin/bash
# ==============================================================================
# practice.sh — Recording the Date and Time in History
# Module 03, Lesson 09 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates configuring HISTTIMEFORMAT, inspecting strftime format specifiers,
# examining epoch timestamp disk serialization, and testing bashrc integration.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system (uses isolated sandbox history).
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 09: Recording the Date and Time in History"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Checking Current System Setting
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Current System HISTTIMEFORMAT ---"
if [ -z "${HISTTIMEFORMAT:-}" ]; then
    echo "HISTTIMEFORMAT is currently unset (default: history displays numbers only)."
else
    echo "Active HISTTIMEFORMAT: '$HISTTIMEFORMAT'"
fi

# ------------------------------------------------------------------------------
# 2. Testing Multiple Timestamp Formats in Isolated Session
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Testing Different strftime Formats ---"

SANDBOX_HIST=$(mktemp /tmp/timed_history.XXXXXX)
trap 'rm -f "$SANDBOX_HIST"' EXIT

export HISTFILE="$SANDBOX_HIST"
set -o history
history -c

# Populate sample entries
history -s "git status"
history -s "df -h"
history -s "systemctl status docker"

echo "[Format A: Standard ISO-8601 (%F %T  )]:"
export HISTTIMEFORMAT="%F %T  "
history

echo ""
echo "[Format B: Full Date, Time, and Timezone (%Y-%m-%d %H:%M:%S %Z  )]:"
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S %Z  "
history

echo ""
echo "[Format C: US 12-Hour Format (%m/%d/%Y %I:%M:%S %p  )]:"
export HISTTIMEFORMAT="%m/%d/%Y %I:%M:%S %p  "
history

# ------------------------------------------------------------------------------
# 3. Inspecting Raw Epoch Storage on Disk
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Inspecting Epoch Timestamps in Disk File ---"
# Save in-memory history to disk
history -w "$SANDBOX_HIST"

echo "Raw file contents of $SANDBOX_HIST (note '#<epoch>' comments):"
cat -n "$SANDBOX_HIST"

# Pick the first numeric epoch timestamp from the file and convert it
FIRST_EPOCH=$(grep -E '^#[0-9]+$' "$SANDBOX_HIST" | head -n 1 | tr -d '#')
if [ -n "$FIRST_EPOCH" ]; then
    READABLE=$(date -d "@$FIRST_EPOCH" 2>/dev/null || date -r "$FIRST_EPOCH" 2>/dev/null || echo "N/A")
    echo ""
    echo "Converting Epoch #$FIRST_EPOCH back to human time:"
    echo "  Epoch: $FIRST_EPOCH -> Human: $READABLE"
fi

# ------------------------------------------------------------------------------
# 4. Checking Persistence Configuration in ~/.bashrc
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Verifying Persistence in ~/.bashrc ---"
if grep -q "HISTTIMEFORMAT" "$HOME/.bashrc" 2>/dev/null; then
    echo "HISTTIMEFORMAT is already configured in $HOME/.bashrc:"
    grep -n "HISTTIMEFORMAT" "$HOME/.bashrc"
else
    echo "HISTTIMEFORMAT is not yet configured in $HOME/.bashrc."
    echo "To configure permanently, add this line:"
    echo "  echo 'export HISTTIMEFORMAT=\"%F %T  \"' >> ~/.bashrc"
fi

echo ""
echo "============================================================"
echo "  Lesson 09 practice completed successfully!"
echo "============================================================"
