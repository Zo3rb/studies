#!/usr/bin/env bash
# ==============================================================================
# 🎯 Module 04: The Linux Terminal — Challenge Practice Script
# ==============================================================================
# Course: DevOp Camp ZTM — Linux Mastery
# Module: 04 — Challenges: The Linux Terminal
# Associated Module: 03 — The Linux Terminal in Depth
#
# INSTRUCTIONS:
# 1. Work through each challenge task numbered 01 to 10 below.
# 2. Replace the "# TODO: Write your command(s) below" placeholders with your
#    own commands.
# 3. Test your script by running: ./challenge.sh
# 4. If you get stuck, consult challenges/README.md or refer to the commented-out
#    Reference Solutions at the very bottom of this file.
#
# SAFETY NOTE:
# This script is safe to execute on any Ubuntu system. Interactive challenges
# (such as su, passwd, and Ctrl+R) provide simulated non-destructive checks
# alongside interactive instructions so the script runs from start to finish
# without hanging or altering account passwords unexpectedly.
# ==============================================================================

set -uo pipefail

# Enable bash history in non-interactive script mode for history challenges
HISTFILE="${HOME}/.bash_history"
set -o history
HISTSIZE=1000

echo "=================================================================="
echo "  🚀 Starting Module 04 Terminal Challenges Validation"
echo "  Target User: $(whoami) | Host: $(hostname)"
echo "=================================================================="
echo ""

# ------------------------------------------------------------------------------
# CHALLENGE 01: Find the flag that makes 'ls' show hidden files
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 01] Reveal Hidden Files with 'ls'"
echo "=================================================================="
# Goal: Use 'man ls' to discover the flag that displays hidden files (dotfiles),
#       then execute 'ls' with that flag on a directory containing hidden files.

# Set up a sandbox directory with normal and hidden files
SANDBOX_DIR=$(mktemp -d /tmp/ztm_terminal_challenge_XXXXXX)
touch "${SANDBOX_DIR}/normal_file.txt"
touch "${SANDBOX_DIR}/.secret_dotfile.env"
mkdir "${SANDBOX_DIR}/.hidden_config"

echo "Created sandbox directory: ${SANDBOX_DIR}"
echo "Standard 'ls' output (hidden files suppressed):"
ls "${SANDBOX_DIR}"
echo ""

echo "Your Solution Output:"
# TODO: Write your command below to list ALL files in $SANDBOX_DIR including hidden files:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Cleanup sandbox for Challenge 01
rm -rf "${SANDBOX_DIR}"
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 02: Find what type of command 'cd' is using 'type'
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 02] Identify Command Classification using 'type'"
echo "=================================================================="
# Goal: Determine whether 'cd' is an external binary, shell builtin, alias,
#       or keyword using the 'type' utility.

echo "Your Solution Output:"
# TODO: Write your command below to inspect the type of 'cd':
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# (Optional) Try inspecting 'type -a cd' or 'type -t cd' as well.
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 03: Use 'apropos' to find commands related to 'copy'
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 03] Search Manual Page Database using 'apropos'"
echo "=================================================================="
# Goal: Query the whatis database for all commands with descriptions matching 'copy'.
# Bonus: Restrict results to Section 1 (User Commands).

echo "Your Solution Output:"
# TODO: Write your command below to find commands related to 'copy' using apropos:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 04: Run a previous command from history using !n
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 04] History Event Expansion (!n)"
echo "=================================================================="
# Goal: Execute a previous command from history by its event number (!n).
# Note: In Bash scripts, history expansion is disabled by default. We enable it
#       here with 'set -H' for demonstration purposes.

# Populate dummy history entries for testing
history -s "echo 'First historic command: uname -s'"
history -s "echo 'Second historic command: uptime'"
history -s "echo 'Third historic command: date'"

echo "Recent history entries:"
history | tail -n 3
echo ""

echo "Your Solution (or Interactive Command):"
# Note: In an interactive terminal, you would run '!<number>' or '!!'.
# Inside this script, write the command or use fc / eval to execute event #3:
# ------------------------------------------------------------------------------
# TODO: Re-run a previous history command using event expansion:



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 05: Run a command without it appearing in history
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 05] Prevent Command from Appearing in History"
echo "=================================================================="
# Goal: Configure HISTCONTROL to ignore commands starting with a space, then
#       execute a command with a leading space and verify it is NOT in history.

# Ensure HISTCONTROL contains 'ignorespace' or 'ignoreboth'
export HISTCONTROL="ignoreboth"

echo "Current HISTCONTROL: ${HISTCONTROL}"
echo ""

# TODO: Execute a command prefixed with a leading space below:
# (Remember: The line MUST begin with at least one space character)
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo "Verifying last 3 history commands (the secret command should not appear):"
history | tail -n 3
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 06: Set HISTTIMEFORMAT and verify timestamps appear
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 06] Configure Forensic Timestamps with HISTTIMEFORMAT"
echo "=================================================================="
# Goal: Export HISTTIMEFORMAT with a standard date/time pattern (e.g. '%F %T ')
#       and display history with timestamps.

echo "Your Solution Output:"
# TODO: Export HISTTIMEFORMAT and display the last 5 history commands:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 07: Switch to root using 'su' and verify with 'whoami', then exit
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 07] Switch to Root with 'su' and Verify Identity"
echo "=================================================================="
# Goal: Switch to root with a login shell ('su -'), check identity with 'whoami',
#       and exit back to your user.
# Interactive Terminal Steps:
#   $ su -
#   # whoami
#   # id
#   # exit
#
# NOTE: To prevent this automated script from hanging on an interactive password
# prompt, write your command below or run a non-interactive simulation (e.g. su -c).

echo "Your Solution (or non-interactive test):"
# TODO: Write your command or interactive test below:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 08: Use 'sudo' to run a command as root
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 08] Execute Privileged Commands with 'sudo'"
echo "=================================================================="
# Goal: Execute a privileged command with 'sudo' and verify that the effective
#       user is root (without opening a persistent root shell).

echo "Your Solution Output:"
# TODO: Use sudo to run 'whoami' or inspect a protected file:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 09: Change your user password with 'passwd'
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 09] User Credential Management with 'passwd'"
echo "=================================================================="
# Goal: Inspect password status and understand how 'passwd' works.
# Interactive Command:
#   $ passwd
#
# In this automated script, verify password status using 'passwd -S' without
# modifying credentials unexpectedly.

echo "Your Solution Output:"
# TODO: Write your command below to check current user password status:
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""


# ------------------------------------------------------------------------------
# CHALLENGE 10: Use Ctrl+R to find a previous command in history
# ------------------------------------------------------------------------------
echo "=================================================================="
echo "  [Challenge 10] Interactive History Search with Ctrl+R"
echo "=================================================================="
# Goal: Demonstrate understanding of GNU Readline reverse incremental search.
# Interactive Shortcut:
#   1. Press [Ctrl + R] in terminal.
#   2. Type search query (e.g., 'HISTTIMEFORMAT' or 'sandbox').
#   3. Press [Ctrl + R] repeatedly to cycle backward through matches.
#   4. Press [Enter] to run immediately, or [Right Arrow] / [Tab] to edit.

echo "Demonstrating programmatic history lookup equivalent to Ctrl+R:"
# TODO: Write a command that searches history for 'HISTTIMEFORMAT' or 'sandbox':
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
echo ""
echo "=================================================================="
echo "  🎉 All Challenges Completed! Check reference solutions if needed."
echo "=================================================================="

exit 0


# ==============================================================================
# 📖 REFERENCE SOLUTIONS (COMMENTED OUT)
# ==============================================================================
# Below are complete reference implementations for each of the 10 challenges.
# To test any solution, uncomment the relevant block or run it directly in your
# terminal.
#
# ------------------------------------------------------------------------------
# SOLUTION 01: Reveal Hidden Files with 'ls'
# ------------------------------------------------------------------------------
# # In manual page:
# man ls
# # (Type '/hidden' to find the flag, 'q' to quit)
#
# # Running the command:
# ls -a "${SANDBOX_DIR}"
# # Or omit . and ..:
# ls -A "${SANDBOX_DIR}"
#
# ------------------------------------------------------------------------------
# SOLUTION 02: Identify Command Classification using 'type'
# ------------------------------------------------------------------------------
# type cd
# # Output: cd is a shell builtin
#
# # Print only the category:
# type -t cd
# # Output: builtin
#
# # Show all occurrences across path, builtins, and aliases:
# type -a cd
#
# ------------------------------------------------------------------------------
# SOLUTION 03: Search Manual Page Database using 'apropos'
# ------------------------------------------------------------------------------
# # Search all manual page short descriptions for 'copy':
# apropos copy
#
# # Restrict to Section 1 (User executable commands):
# apropos -s 1 copy | head -n 10
#
# # Equivalent command using man:
# man -k copy
#
# ------------------------------------------------------------------------------
# SOLUTION 04: History Event Expansion (!n)
# ------------------------------------------------------------------------------
# # 1. View history numbers:
# history | tail -n 10
#
# # 2. Run command #500:
# !500
#
# # 3. Re-run last command:
# !!
#
# # 4. Re-run most recent command starting with 'echo':
# !echo
#
# ------------------------------------------------------------------------------
# SOLUTION 05: Prevent Command from Appearing in History
# ------------------------------------------------------------------------------
# # Verify or set HISTCONTROL to ignorespace or ignoreboth:
# export HISTCONTROL=ignoreboth
#
# # Execute any command with at least one leading space:
#  echo "This secret command with a leading space is NOT saved in history!"
#
# # Confirm it did not enter history:
# history | tail -n 5
#
# ------------------------------------------------------------------------------
# SOLUTION 06: Configure Forensic Timestamps with HISTTIMEFORMAT
# ------------------------------------------------------------------------------
# # Set standard ISO-like timestamp format:
# export HISTTIMEFORMAT="%F %T "
#
# # View history with timestamps enabled:
# history 5
#
# # Make it permanent in ~/.bashrc:
# # echo 'export HISTTIMEFORMAT="%F %T "' >> ~/.bashrc
#
# ------------------------------------------------------------------------------
# SOLUTION 07: Switch to Root with 'su' and Verify Identity
# ------------------------------------------------------------------------------
# # In interactive terminal:
# su -
# # (Enter root password)
# whoami
# # Output: root
# id
# # Output: uid=0(root) gid=0(root)...
# exit
#
# # Note on Ubuntu (where root password is locked by default):
# # sudo su -
# # whoami
# # exit
#
# ------------------------------------------------------------------------------
# SOLUTION 08: Execute Privileged Commands with 'sudo'
# ------------------------------------------------------------------------------
# # Run whoami as root via sudo:
# sudo whoami
# # Output: root
#
# # Inspect allowed sudo privileges:
# sudo -l
#
# ------------------------------------------------------------------------------
# SOLUTION 09: User Credential Management with 'passwd'
# ------------------------------------------------------------------------------
# # Interactive password change:
# # passwd
#
# # Check current account password status (P = active, L = locked):
# passwd -S "$(whoami)"
#
# ------------------------------------------------------------------------------
# SOLUTION 10: Interactive History Search with Ctrl+R
# ------------------------------------------------------------------------------
# # Interactively:
# # 1. Press Ctrl + R
# # 2. Type search query, e.g. 'HISTCONTROL'
# # 3. Press Ctrl + R to cycle backwards
# # 4. Press Enter to run or Tab / Right Arrow to edit
#
# # Non-interactive / programmatic equivalent:
# history | grep -E "HISTTIMEFORMAT|HISTCONTROL" | tail -n 5
# ==============================================================================
