#!/bin/bash
# ============================================================
# practice.sh — Searching String Patterns in Text Files (grep)
# Module 05, Lesson 23 | DevOp Camp ZTM
# ============================================================
# Run this script to practice grep with all flags and regex.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 23: Searching String Patterns with grep"
echo "============================================================"

SANDBOX="/tmp/grep_practice_$$"
mkdir -p "$SANDBOX"/logs

# Create sample config file with comments and blanks
cat << 'EOF' > "$SANDBOX/app.conf"
# Server Configuration File
# Version 2.4

port = 8080
listen = 0.0.0.0
# debug_mode = true
max_workers = 8

# Database settings
db_host = 127.0.0.1
db_port = 5432
EOF

# Create sample server log
cat << 'EOF' > "$SANDBOX/logs/server.log"
2026-11-18 00:01:10 INFO [main] Server starting up
2026-11-18 00:01:12 WARN [auth] User admin login failed
2026-11-18 00:01:14 ERROR [db] Connection refused: 127.0.0.1:5432
Traceback (most recent call last):
  File "db.py", line 42, in connect
    raise ConnectionError("Host unreachable")
2026-11-18 00:01:20 INFO [worker] Task completed successfully
2026-11-18 00:01:25 ERROR [http] 500 Internal Server Error for /api/v1/users
EOF

# 1. Basic Matching & Case Insensitivity (-i)
echo ""
echo "--- 1. Case-Insensitive Matching (-i) ---"
echo "Searching for 'error' in log (case-insensitive):"
grep -i "error" "$SANDBOX/logs/server.log"

# 2. Line Numbers (-n) and Inverted Matching (-v)
echo ""
echo "--- 2. Line Numbers (-n) and Inverting Matches (-v) ---"
echo "All active (non-comment, non-empty) config directives:"
grep -vE "^\s*#|^\s*$" "$SANDBOX/app.conf"

echo ""
echo "Finding 'port' with line numbers (-n):"
grep -n "port" "$SANDBOX/app.conf"

# 3. Whole Word Matching (-w) vs Substring
echo ""
echo "--- 3. Whole Word Matching (-w) ---"
echo "Matching 'db' as a whole word:"
grep -w "db" "$SANDBOX/logs/server.log"

# 4. Counting Matches (-c)
echo ""
echo "--- 4. Counting Matches (-c) ---"
echo -n "Total ERROR lines: "
grep -c "ERROR" "$SANDBOX/logs/server.log" || true

# 5. Context Lines (-A, -B, -C)
echo ""
echo "--- 5. Context Lines around Matches (-A, -B) ---"
echo "Showing ERROR line and 3 lines after (-A 3) for the stack trace:"
grep -A 3 "Connection refused" "$SANDBOX/logs/server.log"

# 6. Recursive Search & File Listing (-r, -l)
echo ""
echo "--- 6. Recursive Search (-r) & Listing Files (-l) ---"
echo "Files in sandbox containing '127.0.0.1' (-rl):"
grep -rl "127.0.0.1" "$SANDBOX"

# 7. Extended Regex (-E) & Only Matching (-o)
echo ""
echo "--- 7. Extended Regex (-E) and Extraction (-o) ---"
echo "Extracting all IP addresses using regex and -o:"
grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" "$SANDBOX/logs/server.log" "$SANDBOX/app.conf" | sort -u

echo ""
echo "Matching either WARN or ERROR with ERE alternation:"
grep -E "(WARN|ERROR)" "$SANDBOX/logs/server.log"

# 8. Fixed Strings (-F)
echo ""
echo "--- 8. Fast Fixed-String Search (-F) ---"
echo "Literal search for '127.0.0.1:5432' (no regex overhead):"
grep -F "127.0.0.1:5432" "$SANDBOX/logs/server.log"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up temporary sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 23 practice completed successfully."
echo "============================================================"
