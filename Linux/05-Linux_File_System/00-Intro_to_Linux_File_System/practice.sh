#!/bin/bash
# ============================================================
# practice.sh — Intro to The Linux File System
# Module 05, Lesson 00 | DevOp Camp ZTM
# ============================================================
# Run this script to explore Linux filesystem concepts:
# - Mounted filesystems and types
# - Root directory structure
# - The "Everything is a file" philosophy in action
# - Case sensitivity demonstration
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 00: Intro to The Linux File System"
echo "============================================================"

# 1. Inspect Mounted Filesystems & Types
echo ""
echo "--- 1. Mounted Filesystems and Types (df -T) ---"
df -Th

# 2. View Root Directory Contents
echo ""
echo "--- 2. Inspecting the Root Directory (/) ---"
ls -ld /
ls -1 /

# 3. Everything is a File: Reading Hardware & Kernel Info via /proc
echo ""
echo "--- 3. Kernel / System Info as Files (/proc) ---"
echo "Reading Kernel Version from /proc/version:"
cat /proc/version

echo ""
echo "Reading CPU model from /proc/cpuinfo (first 5 lines):"
head -n 5 /proc/cpuinfo

echo ""
echo "Reading Memory stats from /proc/meminfo (first 4 lines):"
head -n 4 /proc/meminfo

# 4. Everything is a File: Interacting with Device Files (/dev)
echo ""
echo "--- 4. Device Files in /dev ---"
echo "Inspecting /dev/null (the bit bucket):"
ls -l /dev/null

echo "Redirecting test output into /dev/null (suppresses output):"
echo "You will not see this text" > /dev/null
echo "Written to /dev/null successfully."

echo "Inspecting /dev/zero and generating a small 16-byte dummy file:"
SANDBOX="/tmp/fs_intro_sandbox_$$"
mkdir -p "$SANDBOX"
head -c 16 /dev/zero > "$SANDBOX/zeros.dat"
ls -lh "$SANDBOX/zeros.dat"

# 5. Case Sensitivity Demonstration
echo ""
echo "--- 5. Demonstrating Strict Case Sensitivity ---"
touch "$SANDBOX/file.txt"
touch "$SANDBOX/File.txt"
touch "$SANDBOX/FILE.TXT"

echo "Listing directory with case variants:"
ls -l "$SANDBOX"/*file*.txt "$SANDBOX"/*File*.txt "$SANDBOX"/*FILE*.txt 2>/dev/null || ls -l "$SANDBOX"

# Clean up sandbox
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up temporary sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 00 practice completed successfully."
echo "============================================================"
