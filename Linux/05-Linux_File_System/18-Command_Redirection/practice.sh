#!/bin/bash
# ============================================================
# practice.sh — Command Redirection in Linux
# Module 05, Lesson 18 | DevOp Camp ZTM
# ============================================================
# Run this script to practice stdout, stderr, stdin redirection,
# stream merging, /dev/null discarding, cut, and tee.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 18: Command Redirection"
echo "============================================================"

# Create sandbox directory
SANDBOX="/tmp/redirection_practice_$$"
mkdir -p "$SANDBOX"

# 1. Basic stdout redirection (> and >>)
echo ""
echo "--- 1. Overwriting (>) and Appending (>>) ---"
echo "First entry: system initialized" > "$SANDBOX/log.txt"
echo "Second entry: database started" >> "$SANDBOX/log.txt"
echo "Third entry: web server online" >> "$SANDBOX/log.txt"

echo "Contents of log.txt:"
cat "$SANDBOX/log.txt"

# 2. Separating stdout (1) and stderr (2)
echo ""
echo "--- 2. Separating stdout (1) and stderr (2) ---"
# ls on an existing file and a non-existent file
ls -l "$SANDBOX/log.txt" "$SANDBOX/missing_file.txt" > "$SANDBOX/stdout.txt" 2> "$SANDBOX/stderr.txt" || true

echo "Captured stdout (FD 1):"
cat "$SANDBOX/stdout.txt"

echo "Captured stderr (FD 2):"
cat "$SANDBOX/stderr.txt"

# 3. Discarding output to /dev/null
echo ""
echo "--- 3. Discarding Errors with 2> /dev/null ---"
echo "Searching /etc for 'shadow' while discarding permission errors:"
grep -rn "shadow" /etc 2>/dev/null | head -n 3 || true
echo "Notice: Any 'Permission denied' errors were silently sent to /dev/null."

# 4. Merging stdout and stderr (2>&1 and &>)
echo ""
echo "--- 4. Merging stdout and stderr ---"
# Using 2>&1
ls -l "$SANDBOX/log.txt" "$SANDBOX/missing_file.txt" > "$SANDBOX/combined_1.txt" 2>&1 || true
echo "Combined output with 'command > file 2>&1':"
cat "$SANDBOX/combined_1.txt"

# Using &>
ls -l "$SANDBOX/log.txt" "$SANDBOX/missing_file.txt" &> "$SANDBOX/combined_2.txt" || true
echo "Combined output with 'command &> file':"
cat "$SANDBOX/combined_2.txt"

# 5. Stdin Redirection (< and <<)
echo ""
echo "--- 5. Stdin Redirection (< and <<) ---"
echo "Using < to count lines from file (omits filename from wc output):"
wc -l < "$SANDBOX/log.txt"

echo ""
echo "Using Here-Document (<< EOF) to generate configuration:"
cat << 'EOF' > "$SANDBOX/server.conf"
[server]
port = 8080
host = 127.0.0.1
environment = production
max_connections = 1000
EOF
cat "$SANDBOX/server.conf"

# 6. Tabular Data Extraction with cut
echo ""
echo "--- 6. Extracting Fields with 'cut' ---"
# Create sample CSV data
cat << 'EOF' > "$SANDBOX/employees.csv"
ID:Name:Department:Role
101:Alice:DevOps:Senior Engineer
102:Bob:Security:Auditor
103:Charlie:Backend:Lead Developer
104:Diana:DevOps:Platform Architect
EOF

echo "Original dataset:"
cat "$SANDBOX/employees.csv"

echo ""
echo "Extracting Name and Role (Fields 2 and 4, delimiter ':'):"
cut -d: -f2,4 "$SANDBOX/employees.csv"

echo ""
echo "Extracting only usernames from /etc/passwd (first 5):"
cut -d: -f1 /etc/passwd | head -n 5

# 7. Splitting Streams with tee
echo ""
echo "--- 7. Splitting Streams with 'tee' ---"
echo "Writing timestamp to screen AND appending to audit.log simultaneously:"
date | tee -a "$SANDBOX/audit.log"
echo "Second event at $(date +%T)" | tee -a "$SANDBOX/audit.log"

echo ""
echo "Verifying audit.log contents:"
cat "$SANDBOX/audit.log"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up temporary sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 18 practice completed successfully."
echo "============================================================"
