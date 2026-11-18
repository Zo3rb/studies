#!/bin/bash
# ============================================================
# practice.sh — Sorting Files by Timestamp
# Module 05, Lesson 06 | DevOp Camp ZTM
# ============================================================
# Run this script to test sorting directory entries by:
# - mtime (ls -lt, ls -ltr)
# - atime (ls -ltu, ls -ltru)
# - ctime (ls -ltc, ls -ltrc)
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 06: Sorting Files by Timestamp"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_sort_$$"
mkdir -p "$SANDBOX"

# Create files with staggered mtimes
touch -d "5 days ago" "$SANDBOX/archive_5d.log"
touch -d "2 days ago" "$SANDBOX/backup_2d.log"
touch -d "3 hours ago" "$SANDBOX/service_3h.log"
touch -d "1 minute ago" "$SANDBOX/app_1m.log"

# 1. Sorting by Modification Time (mtime)
echo ""
echo "--- 1. Sort by Modification Time: Newest First (ls -lt) ---"
ls -lt "$SANDBOX"

echo ""
echo "--- 2. Sort by Modification Time: Oldest First (ls -ltr) ---"
echo "(DevOps favorite: newest file appears at the bottom)"
ls -ltr "$SANDBOX"

# 2. Sorting by Access Time (atime)
echo ""
echo "--- 3. Sorting by Access Time (ls -ltu vs ls -ltru) ---"
# Set specific access times
touch -a -d "10 days ago" "$SANDBOX/archive_5d.log"
touch -a -d "1 day ago" "$SANDBOX/backup_2d.log"
touch -a -d "10 minutes ago" "$SANDBOX/service_3h.log"
touch -a -d "now" "$SANDBOX/app_1m.log"

echo "Sort by atime: Most recently accessed first (ls -ltu):"
ls -ltu "$SANDBOX"

echo ""
echo "Sort by atime: Oldest access first (ls -ltru):"
ls -ltru "$SANDBOX"

# 3. Sorting by Change Time (ctime)
echo ""
echo "--- 4. Sorting by Change Time (ls -ltc vs ls -ltrc) ---"
echo "Notice: archive_5d.log has the oldest mtime (5 days ago)."
echo "Now changing permissions on archive_5d.log with chmod 777..."
chmod 777 "$SANDBOX/archive_5d.log"

echo ""
echo "Listing sorted by mtime (archive_5d.log remains at bottom):"
ls -lt "$SANDBOX"

echo ""
echo "Listing sorted by ctime (ls -ltc) — archive_5d.log jumps to TOP!:"
ls -ltc "$SANDBOX"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 06 practice completed successfully."
echo "============================================================"
