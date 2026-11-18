#!/bin/bash
# ============================================================
# practice.sh — Installing CentOS in a VM
# Module 02, Lesson 04 | DevOp Camp ZTM
# ============================================================
# Detects whether system is CentOS/RHEL or Debian-based
# and shows the relevant package manager usage
# Usage: bash practice.sh
# ============================================================

echo "========================================"
echo "  Distro Detection & Package Manager"
echo "========================================"

# 1. Detect distro family
echo ""
echo "--- Distro Family Detection ---"
if [ -f /etc/centos-release ]; then
    echo "✅ CentOS detected"
    cat /etc/centos-release
    PKG_MGR="yum"
elif [ -f /etc/redhat-release ]; then
    echo "✅ Red Hat / Rocky / AlmaLinux detected"
    cat /etc/redhat-release
    PKG_MGR="dnf"
elif [ -f /etc/debian_version ]; then
    echo "✅ Debian-based (Ubuntu/Mint) detected"
    lsb_release -d 2>/dev/null
    PKG_MGR="apt"
else
    echo "❓ Unknown distro"
    PKG_MGR="unknown"
fi

# 2. Show package manager info
echo ""
echo "--- Package Manager: $PKG_MGR ---"
case $PKG_MGR in
    yum)
        echo "Commands: yum install, yum remove, yum update, yum search"
        yum --version 2>/dev/null | head -1
        ;;
    dnf)
        echo "Commands: dnf install, dnf remove, dnf upgrade, dnf search"
        dnf --version 2>/dev/null | head -1
        ;;
    apt)
        echo "Commands: apt install, apt remove, apt update, apt search"
        apt --version 2>/dev/null
        ;;
esac

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
