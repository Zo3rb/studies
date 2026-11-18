#!/bin/bash
# ============================================================
# practice.sh — Removing Files and Directories (rm, shred)
# Module 05, Lesson 15 | DevOp Camp ZTM
# ============================================================
# Run this script to test all flags and features of rm, rmdir, and shred:
# - Standard file deletion (rm -v)
# - Safe empty directory cleanup (rmdir)
# - Recursive directory deletion (rm -r)
# - Force deletion of write-protected files (rm -f)
# - Secure, unrecoverable data wiping with shred (-v -n 3 -z -u)
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 15: Removing Files and Directories"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_rm_$$"
mkdir -p "$SANDBOX"/{empty_dir,non_empty_dir/sub,cleanup_target}

# 1. Removing Single and Multiple Files with rm -v
echo ""
echo "--- 1. Removing Files with Verbose Output (rm -v) ---"
touch "$SANDBOX/temp1.txt" "$SANDBOX/temp2.txt"
rm -v "$SANDBOX/temp1.txt" "$SANDBOX/temp2.txt"

# 2. Testing rmdir on Empty vs Non-Empty Directory
echo ""
echo "--- 2. Testing rmdir Safety ---"
echo "Testing rmdir on empty directory (should succeed):"
rmdir -v "$SANDBOX/empty_dir"

echo "Placing a file inside non_empty_dir:"
touch "$SANDBOX/non_empty_dir/file.txt"
echo "Testing rmdir on non-empty directory (safely fails to protect data):"
if rmdir "$SANDBOX/non_empty_dir" 2>&1; then
    echo "ERROR: Should have failed!"
else
    echo "Safeguard verified: rmdir refused to delete non-empty directory."
fi

# 3. Recursive Removal with rm -r -v
echo ""
echo "--- 3. Recursive Removal of Directory Trees (rm -r -v) ---"
rm -rv "$SANDBOX/non_empty_dir"

# 4. Force Flag rm -f on Write-Protected Files
echo ""
echo "--- 4. Force Removal with rm -f (Write-Protected Files) ---"
touch "$SANDBOX/locked_file.txt"
chmod 400 "$SANDBOX/locked_file.txt" # Read-only, no write permission

echo "Write-protected permissions: $(ls -l "$SANDBOX/locked_file.txt")"
echo "Without -f, interactive rm would prompt for confirmation."
echo "Executing rm -vf:"
rm -vf "$SANDBOX/locked_file.txt"

# 5. Secure Deletion with shred
echo ""
echo "--- 5. Secure File Wiping with shred ---"
SECRET_FILE="$SANDBOX/super_secret_credentials.pem"
echo "API_KEY=sk_live_998877665544332211" > "$SECRET_FILE"

echo "Content before shred:"
cat "$SECRET_FILE"

echo ""
echo "Executing: shred -v -n 3 -z -u $SECRET_FILE"
shred -v -n 3 -z -u "$SECRET_FILE"

if [ ! -f "$SECRET_FILE" ]; then
    echo "Confirmed: File has been shredded (overwritten with random patterns + zeros) and unlinked!"
fi

# Clean up sandbox
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 15 practice completed successfully."
echo "============================================================"
