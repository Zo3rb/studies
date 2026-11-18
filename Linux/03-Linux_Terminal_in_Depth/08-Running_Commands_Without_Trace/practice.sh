#!/bin/bash
# ==============================================================================
# practice.sh — Running Commands Without Leaving a Trace in History
# Module 03, Lesson 08 | DevOp Camp ZTM
# ==============================================================================
# Demonstrates HISTCONTROL settings (ignorespace, ignoredups, ignoreboth),
# executing commands with a leading space, session silencing with unset HISTFILE,
# and toggling tracking with 'set +o history'.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 08: Running Commands Without Leaving a Trace"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Inspecting System HISTCONTROL
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Checking Current HISTCONTROL Setting ---"
echo "Active \$HISTCONTROL: ${HISTCONTROL:-<unset>}"

# ------------------------------------------------------------------------------
# 2. Testing Leading Space with HISTCONTROL=ignorespace
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] Testing Leading Space Technique (ignorespace) ---"

# Launch an interactive-like subshell with history enabled
bash --norc << 'EOF'
set -o history
HISTCONTROL=ignorespace
history -c

# Enter a normal command (saved)
echo "Executing regular command A"
history -s "echo 'Normal public command'"

# Enter a secret command with a leading space (ignored by history)
# Note: we simulate entering a line starting with space
history -s " echo 'SECRET_TOKEN=xyz12345'"

# Check what history recorded:
echo "History contents (notice the secret command with leading space is absent):"
history
EOF

# ------------------------------------------------------------------------------
# 3. Testing Duplicate Filtering (HISTCONTROL=ignoredups)
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Testing Duplicate Filtering (ignoredups) ---"

bash --norc << 'EOF'
set -o history
HISTCONTROL=ignoredups
history -c

history -s "uptime"
history -s "uptime"
history -s "uptime"
history -s "whoami"

echo "History contents after 3 consecutive 'uptime' commands (only 1 recorded):"
history
EOF

# ------------------------------------------------------------------------------
# 4. Silencing Disk Persistence with unset HISTFILE
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Session Silencing with 'unset HISTFILE' ---"

SANDBOX_FILE=$(mktemp /tmp/test_histfile.XXXXXX)
trap 'rm -f "$SANDBOX_FILE"' EXIT

bash --norc << EOF
set -o history
HISTFILE="$SANDBOX_FILE"
history -s "command_1_before_unset"

# Unset HISTFILE completely
unset HISTFILE
history -s "sensitive_maintenance_operation"

# Try to save session on exit
history -a 2>/dev/null || true
EOF

echo "Checking disk file size after unset HISTFILE:"
if [ -s "$SANDBOX_FILE" ]; then
    echo "File contains:"
    cat "$SANDBOX_FILE"
else
    echo "  -> Verified: Disk history file remains completely empty (0 bytes)!"
fi

# ------------------------------------------------------------------------------
# 5. Pausing and Resuming History Tracking (set +o history / set -o history)
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Pausing Tracking with 'set +o history' ---"

bash --norc << 'EOF'
set -o history
history -c

history -s "public_command_1"

# Pause history recording
set +o history
# Commands run during this window are invisible
echo "  [History is now PAUSED]"

# Resume history recording
set -o history
history -s "public_command_2"

echo "History contents:"
history
EOF

echo ""
echo "============================================================"
echo "  Lesson 08 practice completed successfully!"
echo "============================================================"
