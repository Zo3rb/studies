#!/bin/bash
# ============================================================
# practice.sh — Understanding File Timestamps (atime, mtime, ctime)
# Module 05, Lesson 05 | DevOp Camp ZTM
# ============================================================
# Run this script to test and observe how Linux tracks and modifies
# file timestamps using stat, touch, chmod, and date.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 05: Understanding File Timestamps"
echo "============================================================"

# Prepare a dedicated test sandbox
SANDBOX="/tmp/sandbox_timestamps_$$"
mkdir -p "$SANDBOX"
TEST_FILE="$SANDBOX/sample.txt"

# 1. Initial Creation & stat inspection
echo ""
echo "--- 1. Initial File Creation & stat Inspection ---"
echo "Hello Linux" > "$TEST_FILE"
stat "$TEST_FILE"

# 2. Reading Content (Observing atime)
echo ""
echo "--- 2. Reading Content (atime behavior) ---"
echo "Reading file with cat:"
cat "$TEST_FILE" > /dev/null
echo "atime after read: $(stat -c '%x' "$TEST_FILE")"

# 3. Modifying Content (Observing mtime & ctime)
echo ""
echo "--- 3. Modifying Content (mtime & ctime update together) ---"
sleep 1
echo "Appended new line." >> "$TEST_FILE"
echo "Modified content. New timestamps:"
echo "  mtime: $(stat -c '%y' "$TEST_FILE")"
echo "  ctime: $(stat -c '%z' "$TEST_FILE")"

# 4. Modifying Metadata Only (chmod) — ctime changes, mtime stays unchanged!
echo ""
echo "--- 4. Changing Permissions with chmod (ctime changes, mtime intact) ---"
sleep 1
OLD_MTIME=$(stat -c '%y' "$TEST_FILE")
chmod 600 "$TEST_FILE"
NEW_MTIME=$(stat -c '%y' "$TEST_FILE")
NEW_CTIME=$(stat -c '%z' "$TEST_FILE")

echo "Before chmod mtime: $OLD_MTIME"
echo "After chmod mtime:  $NEW_MTIME (Unchanged!)"
echo "After chmod ctime:  $NEW_CTIME (Updated!)"

# 5. Using touch to manipulate timestamps explicitly
echo ""
echo "--- 5. Explicitly Setting Timestamps with touch ---"
echo "Setting mtime to 2024-01-01 12:00:00 (touch -t 202401011200):"
touch -t 202401011200.00 "$TEST_FILE"
echo "  mtime: $(stat -c '%y' "$TEST_FILE")"
echo "  ctime: $(stat -c '%z' "$TEST_FILE") (Notice ctime reflects NOW, cannot be forged to 2024!)"

echo ""
echo "Setting atime only (touch -a):"
touch -a "$TEST_FILE"
echo "  atime: $(stat -c '%x' "$TEST_FILE")"

echo ""
echo "Setting timestamp via natural language date (touch -d '3 days ago'):"
touch -d "3 days ago" "$TEST_FILE"
echo "  mtime: $(stat -c '%y' "$TEST_FILE")"

# 6. Copying Timestamps with touch -r (reference file)
echo ""
echo "--- 6. Copying Timestamps Using a Reference File (touch -r) ---"
REF_FILE="$SANDBOX/reference.txt"
touch -d "2023-05-10 09:30:00" "$REF_FILE"
TARGET_FILE="$SANDBOX/target.txt"
touch "$TARGET_FILE"

echo "Reference file mtime: $(stat -c '%y' "$REF_FILE")"
echo "Target file mtime before: $(stat -c '%y' "$TARGET_FILE")"
touch -r "$REF_FILE" "$TARGET_FILE"
echo "Target file mtime after touch -r: $(stat -c '%y' "$TARGET_FILE")"

# 7. Formatting System Date with date
echo ""
echo "--- 7. Formatting System Dates with date ---"
echo "Default date: $(date)"
echo "UTC date:     $(date -u)"
echo "Custom log timestamp: $(date '+%Y-%m-%d_%H-%M-%S')"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 05 practice completed successfully."
echo "============================================================"
