#!/bin/bash
# ============================================================
# practice.sh — Things to Do After Installing Ubuntu
# Module 02, Lesson 05 | DevOp Camp ZTM
# ============================================================
# Runs through post-install verification and setup steps.
# Usage: bash practice.sh
# NOTE: Some commands require sudo. Run with care.
# ============================================================

echo "========================================"
echo "  Ubuntu Post-Install Checklist"
echo "========================================"

# 1. System update status
echo ""
echo "--- [1] Check for Updates ---"
sudo apt update -qq
UPGRADABLE=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
echo "Packages available to upgrade: $UPGRADABLE"

# 2. Check essential tools
echo ""
echo "--- [2] Essential Tools Check ---"
TOOLS=("curl" "wget" "git" "vim" "htop" "tree" "net-tools" "unzip")
for tool in "${TOOLS[@]}"; do
    if command -v "$tool" &>/dev/null; then
        echo "  ✅ $tool"
    else
        echo "  ❌ $tool (not installed — run: sudo apt install $tool)"
    fi
done

# 3. Timezone
echo ""
echo "--- [3] Timezone ---"
timedatectl | grep "Time zone"

# 4. Firewall status
echo ""
echo "--- [4] UFW Firewall Status ---"
sudo ufw status 2>/dev/null || echo "(ufw not installed)"

# 5. Disk space
echo ""
echo "--- [5] Disk Space ---"
df -h / | awk 'NR==2 {print "Used: "$3" / "$2" ("$5" full)"}'

# 6. Uptime
echo ""
echo "--- [6] System Uptime ---"
uptime -p

# 7. Snapshot reminder
echo ""
echo "--- [7] Snapshot Reminder ---"
echo "💾 Remember: Take a VM snapshot now if you haven't already!"
echo "   VirtualBox: Machine → Take Snapshot → 'Post-Install Clean'"

echo ""
echo "========================================"
echo "  Post-install checklist complete!"
echo "========================================"
