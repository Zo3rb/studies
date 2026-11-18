#!/bin/bash
# ============================================================
# practice.sh — Migrating to Linux
# Module 02, Lesson 02 | DevOp Camp ZTM
# ============================================================
# Explores system info that confirms why Linux is production-grade
# Usage: bash practice.sh
# ============================================================

echo "========================================"
echo "  Why Linux? — System Snapshot"
echo "========================================"

# 1. System uptime — demonstrates Linux stability
echo ""
echo "--- System Uptime ---"
uptime

# 2. Memory usage — lightweight OS
echo ""
echo "--- Memory Usage ---"
free -h

# 3. Running processes — how lean Linux is
echo ""
echo "--- Process Count ---"
ps aux | wc -l
echo "processes currently running"

# 4. Disk usage
echo ""
echo "--- Disk Usage ---"
df -h /

# 5. Who is logged in
echo ""
echo "--- Current Users ---"
who

# 6. Environment variables — Linux philosophy: config via env
echo ""
echo "--- Key Environment Variables ---"
echo "HOME     = $HOME"
echo "USER     = $USER"
echo "SHELL    = $SHELL"
echo "PATH     = $PATH"

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
