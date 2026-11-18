#!/bin/bash
# ============================================================
# practice.sh — Linux Distributions
# Module 02, Lesson 01 | DevOp Camp ZTM
# ============================================================
# Run this script to explore your system's distribution info.
# Usage: bash practice.sh
# ============================================================

echo "========================================"
echo "  Linux Distribution Info"
echo "========================================"

# 1. Show distribution name and version
echo ""
echo "--- /etc/os-release ---"
cat /etc/os-release

# 2. Short distro info (works on most distros)
echo ""
echo "--- lsb_release -a ---"
lsb_release -a 2>/dev/null || echo "(lsb_release not available)"

# 3. Kernel version
echo ""
echo "--- Kernel Version ---"
uname -r

# 4. Full system info
echo ""
echo "--- Full uname output ---"
uname -a

# 5. Check which package manager is available
echo ""
echo "--- Package Manager Detection ---"
if command -v apt &>/dev/null; then
    echo "✅ apt found  → Debian-based (Ubuntu, Mint, etc.)"
elif command -v dnf &>/dev/null; then
    echo "✅ dnf found  → Red Hat-based (Fedora, CentOS 8+)"
elif command -v yum &>/dev/null; then
    echo "✅ yum found  → Red Hat-based (CentOS 7, RHEL)"
elif command -v pacman &>/dev/null; then
    echo "✅ pacman found → Arch-based"
else
    echo "❓ Unknown package manager"
fi

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
