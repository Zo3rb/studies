#!/bin/bash
# ==============================================================================
# practice.sh — Root vs. Non-Privileged Users
# Module 03, Lesson 10 | DevOp Camp ZTM
# ==============================================================================
# Inspects user and group identifiers (UID/GID), categorizes accounts in /etc/passwd,
# validates sudoers syntax with visudo -c, inspects sudo permissions, and checks
# password status safely.
# Usage: bash practice.sh
# Safe to run on any Linux / Ubuntu system.
# ==============================================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 10: Root vs. Non-Privileged Users"
echo "============================================================"

# ------------------------------------------------------------------------------
# 1. Inspecting Active User Identity and Group Memberships
# ------------------------------------------------------------------------------
echo ""
echo "--- [1] Current Identity & Privileges ---"
echo "Username (whoami)       : $(whoami)"
echo "User ID (id -u)         : $(id -u)"
echo "Primary Group ID (id -g): $(id -g)"
echo "All Groups (id -Gn)     : $(id -Gn)"
echo "Full identity details   : $(id)"

if [ "$(id -u)" -eq 0 ]; then
    echo "  -> Currently running as the ROOT superuser (UID 0)."
else
    echo "  -> Currently running as a standard non-privileged user (UID >= 1000)."
fi

# ------------------------------------------------------------------------------
# 2. Account Categories in /etc/passwd (Root vs System vs Regular)
# ------------------------------------------------------------------------------
echo ""
echo "--- [2] User Categories in /etc/passwd ---"
echo "[A] Superuser Account (UID 0):"
awk -F: '$3 == 0 { printf "  • User: %-12s | UID: %-4s | Home: %-12s | Shell: %s\n", $1, $3, $6, $7 }' /etc/passwd

echo ""
echo "[B] Sample System / Daemon Accounts (UID 1-999):"
awk -F: '$3 >= 1 && $3 < 1000 { printf "  • User: %-12s | UID: %-4s | Home: %-16s | Shell: %s\n", $1, $3, $6, $7 }' /etc/passwd | head -n 5

echo ""
echo "[C] Regular Human User Accounts (UID >= 1000):"
awk -F: '$3 >= 1000 && $3 < 65534 { printf "  • User: %-12s | UID: %-4s | Home: %-16s | Shell: %s\n", $1, $3, $6, $7 }' /etc/passwd

# ------------------------------------------------------------------------------
# 3. Validating /etc/sudoers Syntax with visudo -c
# ------------------------------------------------------------------------------
echo ""
echo "--- [3] Sudoers Configuration Integrity Check (visudo -c) ---"
if command -v visudo &>/dev/null; then
    echo "Checking /etc/sudoers syntax safely via 'sudo visudo -c':"
    if sudo -n visudo -c 2>/dev/null; then
        echo "  -> /etc/sudoers syntax is VALID."
    else
        echo "  -> Sudo requires password or visudo check requires elevated permissions."
        echo "  (Run 'sudo visudo -c' interactively to verify /etc/sudoers syntax integrity)"
    fi
else
    echo "visudo command not found."
fi

# ------------------------------------------------------------------------------
# 4. Checking User Sudo Permissions (sudo -l)
# ------------------------------------------------------------------------------
echo ""
echo "--- [4] Checking Configured Sudo Permissions (sudo -l) ---"
if sudo -n -l 2>/dev/null; then
    echo "Sudo permissions currently cached and active:"
    sudo -n -l | sed 's/^/  /'
else
    echo "Sudo requires password authentication for $(whoami)."
    echo "To view full sudo privileges, run interactively: sudo -l"
fi

# ------------------------------------------------------------------------------
# 5. Inspecting Password Status with passwd -S
# ------------------------------------------------------------------------------
echo ""
echo "--- [5] Password Status Check (passwd -S) ---"
echo "Checking password status for current user '$(whoami)':"
passwd -S 2>/dev/null || echo "Password status inspection requires sudo or terminal input."

echo ""
echo "============================================================"
echo "  Lesson 10 practice completed successfully!"
echo "============================================================"
