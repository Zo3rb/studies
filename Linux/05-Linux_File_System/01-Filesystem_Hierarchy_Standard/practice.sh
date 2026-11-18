#!/bin/bash
# ============================================================
# practice.sh — The Filesystem Hierarchy Standard (FHS)
# Module 05, Lesson 01 | DevOp Camp ZTM
# ============================================================
# Run this script to explore the FHS directories on your system.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 01: The Filesystem Hierarchy Standard (FHS)"
echo "============================================================"

# 1. Listing Root Directory
echo ""
echo "--- 1. Root Directory Listing (ls -ld /) ---"
ls -ld /

# 2. Verify Modern UsrMerge Symlinks (/bin, /sbin, /lib)
echo ""
echo "--- 2. Checking UsrMerge Architecture ---"
for dir in /bin /sbin /lib /lib64; do
    if [ -L "$dir" ]; then
        echo "Symlink: $(ls -ld "$dir")"
    elif [ -d "$dir" ]; then
        echo "Directory: $(ls -ld "$dir")"
    else
        echo "Not found: $dir"
    fi
done

# 3. Explore Host Configuration Files (/etc)
echo ""
echo "--- 3. System Configuration Directory (/etc) ---"
echo "Total entries in /etc: $(ls -1 /etc | wc -l)"
echo ""
echo "Sample configuration files in /etc:"
ls -ld /etc/passwd /etc/fstab /etc/hosts /etc/os-release

echo ""
echo "Viewing /etc/os-release (first 4 lines):"
head -n 4 /etc/os-release

# 4. Explore Variable Data & Logs (/var and /var/log)
echo ""
echo "--- 4. Variable Data Directory (/var and /var/log) ---"
echo "Listing /var/log entries:"
ls -lh /var/log | head -n 10

# 5. Explore Virtual Filesystems (/proc and /sys)
echo ""
echo "--- 5. Virtual Kernel Filesystems (/proc and /sys) ---"
echo "Disk space used by /proc (note Size is 0 because it exists in RAM):"
ls -ld /proc
echo "Kernel uptime (/proc/uptime):"
cat /proc/uptime

echo ""
echo "Network interfaces reported by /sys/class/net:"
ls -l /sys/class/net

# 6. Explore Device Nodes (/dev)
echo ""
echo "--- 6. Device Nodes Directory (/dev) ---"
echo "Standard character and block devices:"
ls -ld /dev/null /dev/zero /dev/urandom /dev/tty /dev/sda* 2>/dev/null || ls -ld /dev/null /dev/zero /dev/urandom

# 7. Explore User & Root Homes (/home and /root)
echo ""
echo "--- 7. Home Directories (/home and /root) ---"
echo "Standard user home directories:"
ls -ld /home/* 2>/dev/null || echo "(No standard homes found)"
echo "Root user home directory permissions:"
ls -ld /root

echo ""
echo "============================================================"
echo "  Done! Lesson 01 practice completed successfully."
echo "============================================================"
