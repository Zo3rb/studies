#!/bin/bash
# ============================================================
# practice.sh — Copying Files and Directories (cp)
# Module 05, Lesson 13 | DevOp Camp ZTM
# ============================================================
# Run this script to test all flags and features of cp:
# - Basic copy & multiple file copy
# - Recursive directory copy (-r)
# - Verbose output (-v)
# - Preserving metadata & timestamps (-p, -a)
# - Update synchronization (-u)
# - Safe copying with no-clobber (-n) and backup (-b)
# - Wildcard patterns with cp
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 13: Copying Files and Directories"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_cp_$$"
mkdir -p "$SANDBOX"/{source_dir,target_dir,backup_dir}

# Create sample files
echo "Hello original file" > "$SANDBOX/source_file.txt"
touch -d "2024-05-01 10:00:00" "$SANDBOX/source_file.txt"

# 1. Basic File Copy & Verbose Output (-v)
echo ""
echo "--- 1. Basic Copy with Verbose Output (cp -v) ---"
cp -v "$SANDBOX/source_file.txt" "$SANDBOX/target_dir/copied_file.txt"

# 2. Copying Multiple Files into a Directory
echo ""
echo "--- 2. Copying Multiple Files into a Target Directory ---"
touch "$SANDBOX/doc1.txt" "$SANDBOX/doc2.txt" "$SANDBOX/doc3.txt"
cp -v "$SANDBOX/doc1.txt" "$SANDBOX/doc2.txt" "$SANDBOX/doc3.txt" "$SANDBOX/target_dir/"

# 3. Recursive Directory Copy (cp -r)
echo ""
echo "--- 3. Recursive Directory Copy (cp -r -v) ---"
mkdir -p "$SANDBOX/source_dir/sub1/sub2"
echo "Config data" > "$SANDBOX/source_dir/sub1/sub2/app.conf"
cp -rv "$SANDBOX/source_dir" "$SANDBOX/backup_dir/"

# 4. Preserving Timestamps and Permissions (-p vs standard)
echo ""
echo "--- 4. Preserving Timestamps (-p vs Standard Copy) ---"
echo "Source file original mtime: $(stat -c '%y' "$SANDBOX/source_file.txt")"

# Standard copy resets mtime
cp "$SANDBOX/source_file.txt" "$SANDBOX/target_dir/standard_copy.txt"
echo "Standard copy mtime:        $(stat -c '%y' "$SANDBOX/target_dir/standard_copy.txt") (Current time)"

# Preserved copy retains mtime
cp -p "$SANDBOX/source_file.txt" "$SANDBOX/target_dir/preserved_copy.txt"
echo "Preserved copy (-p) mtime:  $(stat -c '%y' "$SANDBOX/target_dir/preserved_copy.txt") (Cloned 2024 timestamp!)"

# 5. Archive Mode (-a)
echo ""
echo "--- 5. Archive Mode (cp -a) ---"
ln -s "$SANDBOX/source_file.txt" "$SANDBOX/source_dir/symlink.txt"
cp -a "$SANDBOX/source_dir" "$SANDBOX/archive_backup"
echo "Verifying symlink preserved as link:"
ls -l "$SANDBOX/archive_backup/symlink.txt"

# 6. Update Synchronization (-u)
echo ""
echo "--- 6. Update Synchronization (cp -u -v) ---"
echo "Destination file is newer than source:"
touch -d "2026-01-01" "$SANDBOX/target_dir/sync_test.txt"
touch -d "2024-01-01" "$SANDBOX/source_sync.txt"

echo "Attempting cp -u from older source to newer destination (should do nothing):"
cp -uv "$SANDBOX/source_sync.txt" "$SANDBOX/target_dir/sync_test.txt" || true

echo "Now updating source to be newer:"
touch -d "2026-12-01" "$SANDBOX/source_sync.txt"
echo "Attempting cp -u again (source is now newer):"
cp -uv "$SANDBOX/source_sync.txt" "$SANDBOX/target_dir/sync_test.txt"

# 7. No-Clobber (-n) and Backup (-b)
echo ""
echo "--- 7. Overwrite Protection: No-Clobber (-n) & Backup (-b) ---"
echo "Original target content" > "$SANDBOX/target_file.txt"
echo "New content" > "$SANDBOX/new_file.txt"

echo "Testing -b (Creates backup file ~ before overwrite):"
cp -b -v "$SANDBOX/new_file.txt" "$SANDBOX/target_file.txt"
ls -l "$SANDBOX"/target_file.txt*

# 8. Wildcard Pattern Copying
echo ""
echo "--- 8. Wildcard Pattern Copying ---"
mkdir -p "$SANDBOX/text_dumps"
cp -v "$SANDBOX"/doc*.txt "$SANDBOX/text_dumps/"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 13 practice completed successfully."
echo "============================================================"
