#!/bin/bash
# ============================================================
# practice.sh — Find and Exec (-exec, xargs, -delete)
# Module 05, Lesson 22 | DevOp Camp ZTM
# ============================================================
# Run this script to practice executing actions on find results.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 22: Find and Exec"
echo "============================================================"

SANDBOX="/tmp/find_exec_practice_$$"
mkdir -p "$SANDBOX"/{webroot/css,webroot/js,backup,logs}

# Create test files, including filenames with spaces
touch "$SANDBOX/webroot/index.html"
touch "$SANDBOX/webroot/css/style.css"
touch "$SANDBOX/webroot/js/app.js"
touch "$SANDBOX/webroot/file with spaces.txt"
touch "$SANDBOX/logs/access.log"
touch "$SANDBOX/logs/error.log"
touch "$SANDBOX/logs/old_2020.log"

# Set non-standard permissions to test bulk chmod
chmod 777 "$SANDBOX/webroot/index.html"
chmod 777 "$SANDBOX/webroot/css/style.css"

# 1. Understanding -exec {} \; (per-file execution)
echo ""
echo "--- 1. Per-File Execution with -exec ... \; ---"
echo "Printing filename headers with echo:"
find "$SANDBOX/webroot" -maxdepth 1 -type f -exec echo "Found item: {}" \;

# 2. Bulk Execution with -exec {} + (batched execution)
echo ""
echo "--- 2. High-Performance Batched Execution (-exec ... +) ---"
echo "Current permissions before fix:"
ls -l "$SANDBOX/webroot/index.html"

echo "Standardizing all regular files to mode 644 in bulk:"
find "$SANDBOX/webroot" -type f -exec chmod 644 {} +

echo "Permissions after fix:"
ls -l "$SANDBOX/webroot/index.html"

# 3. Copying Search Results with cp -t
echo ""
echo "--- 3. Copying Found Files to Backup Directory (cp -t) ---"
echo "Copying all .log files into backup directory:"
find "$SANDBOX/logs" -type f -name "*.log" -exec cp -t "$SANDBOX/backup" {} +

echo "Files in backup directory:"
ls -la "$SANDBOX/backup"

# 4. Safe Filename Handling with Spaces (xargs -0)
echo ""
echo "--- 4. Handling Filenames with Spaces (-print0 | xargs -0) ---"
echo "Using find -print0 and xargs -0 to inspect file word counts safely:"
find "$SANDBOX/webroot" -type f -name "*spaces*" -print0 | xargs -0 wc -c

# 5. Native Deletion with -delete
echo ""
echo "--- 5. Native Deletion with -delete ---"
echo "Deleting files ending in old_2020.log:"
find "$SANDBOX/logs" -type f -name "*2020*" -delete

echo "Remaining files in logs directory:"
ls -1 "$SANDBOX/logs"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up temporary sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 22 practice completed successfully."
echo "============================================================"
