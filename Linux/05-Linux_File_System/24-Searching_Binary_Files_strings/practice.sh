#!/bin/bash
# ============================================================
# practice.sh — Searching Binary Files with strings
# Module 05, Lesson 24 | DevOp Camp ZTM
# ============================================================
# Run this script to practice extracting text from binary files.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 24: Searching Strings in Binary Files"
echo "============================================================"

SANDBOX="/tmp/strings_practice_$$"
mkdir -p "$SANDBOX"

# 1. Create a simulated binary file containing embedded text & secrets
printf '\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00' > "$SANDBOX/dummy_binary"
printf '\x90\x90\x90\x90\x31\xc0\x48\x89' >> "$SANDBOX/dummy_binary"
printf 'DATABASE_PASSWORD=superSecretToken123\x00' >> "$SANDBOX/dummy_binary"
printf '\xeb\x1e\x5e\x31\xc0\x88\x46\x07' >> "$SANDBOX/dummy_binary"
printf 'http://c2-command-node.internal:8080/beacon\x00' >> "$SANDBOX/dummy_binary"
printf '\x90\x90\x90\x90\x90\x90' >> "$SANDBOX/dummy_binary"
printf 'GNU C17 11.2.0 -mtune=generic\x00' >> "$SANDBOX/dummy_binary"

# 2. Basic strings extraction
echo ""
echo "--- 1. Basic Strings Extraction on Custom Binary ---"
echo "Running strings on simulated binary:"
strings "$SANDBOX/dummy_binary"

# 3. Filtering by Minimum String Length (-n)
echo ""
echo "--- 2. Setting Minimum Length (-n) ---"
echo "Extracting strings with minimum length 15 characters (-n 15):"
strings -n 15 "$SANDBOX/dummy_binary"

# 4. Displaying Byte Offsets (-t x and -t d)
echo ""
echo "--- 3. Inspecting Byte Offsets (-t x / -t d) ---"
echo "Hexadecimal file offsets (-t x):"
strings -t x "$SANDBOX/dummy_binary"

echo ""
echo "Decimal file offsets (-t d):"
strings -t d "$SANDBOX/dummy_binary"

# 5. Inspecting Real System Binaries (/bin/ls)
echo ""
echo "--- 4. Inspecting Real System Binaries (/usr/bin/ls) ---"
LS_BIN=$(which ls)
echo "Inspecting $LS_BIN for copyright and author strings:"
strings "$LS_BIN" | grep -i "copyright" | head -n 3 || true
strings "$LS_BIN" | grep -i "written by" | head -n 3 || true

# 6. Glibc Version Inspection
echo ""
echo "--- 5. Detecting Glibc Supported Versions ---"
LIBC_PATH="/lib/x86_64-linux-gnu/libc.so.6"
if [ -f "$LIBC_PATH" ]; then
    echo "Querying $LIBC_PATH for GLIBC versions:"
    strings "$LIBC_PATH" | grep "^GLIBC_2\." | tail -n 6
else
    echo "libc not found at standard path, finding with ldconfig:"
    LIBC_FOUND=$(ldconfig -p | grep "libc.so.6" | head -n 1 | awk '{print $NF}')
    if [ -n "$LIBC_FOUND" ]; then
        strings "$LIBC_FOUND" | grep "^GLIBC_2\." | tail -n 6
    fi
fi

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 24 practice completed successfully."
echo "============================================================"
