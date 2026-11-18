#!/bin/bash
# ============================================================
# practice.sh — Working With Pipes in Linux
# Module 05, Lesson 17 | DevOp Camp ZTM
# ============================================================
# Run this script to practice Linux pipes and the wc utility.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 17: Working With Pipes in Linux"
echo "============================================================"

# Create temporary sandbox
SANDBOX="/tmp/pipes_practice_$$"
mkdir -p "$SANDBOX"

# Create a sample text file
cat << 'EOF' > "$SANDBOX/sample.txt"
Linux is a family of open-source Unix-like operating systems.
Pipes allow output of one program to become input to another.
Mastering the command line is essential for DevOps.
Bash pipelines run commands concurrently in memory.
EOF

# 1. Understanding wc flags
echo ""
echo "--- 1. Exploring 'wc' (Word Count) Flags ---"
echo "Target file content:"
cat "$SANDBOX/sample.txt"
echo "----------------------------------------"

echo -n "Line count (-l): "
wc -l < "$SANDBOX/sample.txt"

echo -n "Word count (-w): "
wc -w < "$SANDBOX/sample.txt"

echo -n "Byte count (-c): "
wc -c < "$SANDBOX/sample.txt"

echo -n "Character count (-m): "
wc -m < "$SANDBOX/sample.txt"

echo -n "Longest line display width (-L): "
wc -L < "$SANDBOX/sample.txt"

# 2. Basic Pipe: stdout -> stdin
echo ""
echo "--- 2. Basic Pipe (stdout to stdin) ---"
echo "Counting files in /etc:"
ls -1 /etc | wc -l

echo ""
echo "Listing top 5 largest files/directories in /etc:"
# Note: head terminates early, sending SIGPIPE (141) to ls. We handle this cleanly:
(ls -lhS /etc 2>/dev/null || true) | head -n 6

# 3. Chaining Multiple Pipes
echo ""
echo "--- 3. Multi-Stage Pipeline Chaining ---"
echo "Extracting usernames from /etc/passwd that use bash, sorted alphabetically:"
grep "bash" /etc/passwd | cut -d: -f1 | sort

echo ""
echo "Count of users with /bin/bash as their login shell:"
grep -c "bash" /etc/passwd || true

# 4. Sorting and Counting Unique Values
echo ""
echo "--- 4. Data Aggregation Pipeline (cut | sort | uniq -c) ---"
echo "Distribution of login shells in /etc/passwd:"
cut -d: -f7 /etc/passwd | sort | uniq -c | sort -nr

# 5. Process Monitoring with Pipes & The Bracket Trick
echo ""
echo "--- 5. Process Filtering with Pipes ---"
echo "Finding systemd / init processes:"
ps -ef | grep -E "systemd|init" | head -n 5

echo ""
echo "Demonstrating the bracket trick to eliminate 'grep' from output:"
echo "Without bracket trick (matches grep itself):"
ps aux | grep "bash" | head -n 3 || true

echo ""
echo "With bracket trick (grep '[b]ash' does not match its own process):"
ps aux | grep "[b]ash" | head -n 3 || true

# 6. Pipeline Exit Codes and PIPESTATUS
echo ""
echo "--- 6. Pipeline Exit Codes and PIPESTATUS ---"
# Temporarily disable pipefail to demonstrate PIPESTATUS
set +o pipefail
cat /nonexistent_file_test 2>/dev/null | wc -l
PIPELINE_RESULTS=("${PIPESTATUS[@]}")
echo "Exit code of last command in pipeline: ${PIPELINE_RESULTS[1]}"
echo "Exit code of first command in pipeline: ${PIPELINE_RESULTS[0]}"
set -o pipefail

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up temporary sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 17 practice completed successfully."
echo "============================================================"
