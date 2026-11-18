#!/bin/bash
# ============================================================
# practice.sh — Installing Ubuntu in a VM
# Module 02, Lesson 03 | DevOp Camp ZTM
# ============================================================
# Run these commands after installing Ubuntu to verify the setup
# Usage: bash practice.sh
# ============================================================

echo "========================================"
echo "  Post-Install Ubuntu Verification"
echo "========================================"

# 1. Confirm OS version
echo ""
echo "--- Ubuntu Version ---"
lsb_release -a 2>/dev/null

# 2. Confirm kernel
echo ""
echo "--- Kernel ---"
uname -r

# 3. Check CPU info (VM allocation)
echo ""
echo "--- CPU Info ---"
lscpu | grep -E "Architecture|CPU\(s\)|Model name|Virtualization"

# 4. Check RAM allocation
echo ""
echo "--- RAM ---"
free -h

# 5. Check disk allocation
echo ""
echo "--- Disk ---"
df -h /

# 6. Check network is working
echo ""
echo "--- Network Connectivity ---"
ping -c 2 8.8.8.8 && echo "✅ Internet OK" || echo "❌ No internet"

# 7. Verify apt works
echo ""
echo "--- APT Status ---"
sudo apt update -qq && echo "✅ apt working" || echo "❌ apt issue"

echo ""
echo "========================================"
echo "  All checks complete!"
echo "========================================"
