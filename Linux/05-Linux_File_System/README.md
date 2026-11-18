# 📁 Module 05 — The Linux File System

## Overview

A deep, hands-on dive into the Linux File System. This module covers the foundational architecture of Linux storage, the Filesystem Hierarchy Standard (FHS), directory navigation, file inspection, timestamps, file operations (creation, copy, move, deletion, shredding), I/O redirection and pipelines, search utilities (find, grep), the VIM editor, file compression, and inode/link mechanics.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[00 - Intro to The Linux File System](./00-Intro_to_Linux_File_System/README.md)** | Filesystem definition, Unix philosophy "Everything is a file" | ⬜ |
| **[01 - The Filesystem Hierarchy Standard (FHS)](./01-Filesystem_Hierarchy_Standard/README.md)** | Root (`/`), `/etc`, `/var`, `/proc`, `/sys`, `/dev`, `/usr`, `/home` | ⬜ |
| **[02 - Absolute vs Relative Paths](./02-Absolute_vs_Relative_Paths/README.md)** | Navigation with `pwd`, `cd`, `tree`, `.`, `..`, `~`, `-` | ⬜ |
| **[03 - Quiz for The Linux File System](./quiz.md#part-1-lessons-016)** | Self-assessment: Filesystem concepts & FHS | ⬜ |
| **[04 - The LS Command In Depth](./04-The_LS_Command_in_Depth/README.md)** | Flags (`-l`, `-a`, `-h`, `-r`, `-t`, `-S`, `-R`, `-d`, `-i`, `-F`), output parsing | ⬜ |
| **[05 - Understanding File Timestamps](./05-File_Timestamps/README.md)** | `atime`, `mtime`, `ctime`, inspection via `stat`, altering with `touch`, `date` | ⬜ |
| **[06 - Sorting Files by Timestamp](./06-Sorting_Files_by_Timestamp/README.md)** | Sorting chronologically: `ls -lt`, `ls -ltr`, `ls -ltu`, `ls -ltc` | ⬜ |
| **[07 - File Types in Linux](./07-File_Types_in_Linux/README.md)** | The 7 file types (`-`, `d`, `l`, `c`, `b`, `p`, `s`), `ls -F`, `file` command | ⬜ |
| **[08a - Quiz for LS, File Types and Timestamps](./quiz.md#part-1-lessons-016)** | Self-assessment: `ls` flags, timestamps, file types | ⬜ |
| **[08b - Viewing Files - Part 1 (cat)](./08-Viewing_Files_cat/README.md)** | Displaying and concatenating: `cat -n`, `cat -A`, `cat -s`, `tac` | ⬜ |
| **[09 - Viewing Files - Part 2 (less, more)](./09-Viewing_Files_less_more/README.md)** | Pagers: `more` vs `less`, movement keys, search, `less +F`, line numbers | ⬜ |
| **[10 - Viewing Files - Part 3 (tail, head, watch)](./10-Viewing_Files_tail_head_watch/README.md)** | Stream viewing: `head -n`, `tail -n`, `tail -f`, `tail -F`, `watch -n` | ⬜ |
| **[11 - Quiz for Viewing Files](./quiz.md#part-1-lessons-016)** | Self-assessment: `cat`, `tac`, `less`, `more`, `head`, `tail`, `watch` | ⬜ |
| **[12 - Creating Files and Directories](./12-Creating_Files_and_Directories/README.md)** | File & dir creation: `touch`, `mkdir`, `mkdir -p`, `mkdir -v`, `tree` | ⬜ |
| **[13 - Copying Files and Directories](./13-Copying_Files_and_Directories/README.md)** | Copy operations: `cp`, `cp -r`, `cp -i`, `cp -v`, `cp -p`, `cp -a`, wildcards | ⬜ |
| **[14 - Moving and Renaming Files and Directories](./14-Moving_and_Renaming/README.md)** | Move & rename: `mv`, `mv -i`, `mv -v`, `mv -n`, batch renaming with loops | ⬜ |
| **[15 - Removing Files and Directories](./15-Removing_Files_and_Directories/README.md)** | Deletion: `rm`, `rm -r`, `rm -i`, `rm -f`, `rm -rf` danger, `rmdir`, `shred` | ⬜ |
| **[16 - Quiz for mkdir, cp, mv, rm, shred](./quiz.md#part-1-lessons-016)** | Self-assessment: CRUD file operations & shred | ⬜ |
| **17 - Working With Pipes in Linux (pipe, wc)** | Piping streams, counting words/lines/bytes with `wc` | ⬜ |
| **18 - Command Redirection (stdout, stderr, cut, tee)** | Redirection operators (`>`, `>>`, `2>`, `&>`), `tee`, `cut` | ⬜ |
| **19 - Quiz for Piping and Command Redirection** | Self-assessment: Redirection operators and pipes | ⬜ |
| **20 - Finding Files and Directories Part 1 (locate, which)** | Fast indexing with `locate`/`updatedb`, binary paths with `which` | ⬜ |
| **21 - Finding Files and Directories Part 2 (find)** | Deep filesystem search with `find` (name, type, size, mtime) | ⬜ |
| **22 - Find and Exec** | Executing actions on search results with `find ... -exec` | ⬜ |
| **23 - Searching for String Patterns in Text Files (grep)** | Regular expressions and string matching with `grep` | ⬜ |
| **24 - Searching for Strings in Binary Files (strings)** | Extracting ASCII text from binaries and compiled objects | ⬜ |
| **25 - Quiz for locate, find and grep** | Self-assessment: Search tools in Linux | ⬜ |
| **26 - Comparing Files (cmp, diff, sha256)** | Byte comparisons (`cmp`), line differences (`diff`), checksums (`sha256sum`) | ⬜ |
| **27 - The Basics of VIM Text Editor** | VIM modes (Normal, Insert, Command), saving and quitting | ⬜ |
| **28 - The VIM Editor In Depth Part 1** | Navigation, deletion, yank/paste, undo/redo | ⬜ |
| **29 - The VIM Editor In Depth Part 2** | Search and replace, visual mode, settings, configuration | ⬜ |
| **30 - Quiz for VIM Editor** | Self-assessment: VIM commands and workflows | ⬜ |
| **31 - Compressing and Archiving Files and Directories (tar, gzip)** | Archiving with `tar` (cvf, xvf, tvf), compressing with `gzip`, `bzip2`, `xz` | ⬜ |
| **32 - Hard Links and the Inode Structure** | Inode anatomy, superblock, metadata, hard link creation and limits | ⬜ |
| **33 - Working With Symlinks. Symlinks vs Hard Links** | Symbolic links (`ln -s`), broken symlinks, cross-filesystem linking | ⬜ |
| **43 - Quiz for Hard and Symlinks** | Self-assessment: Inodes, hard links vs soft links | ⬜ |

## 🎯 Module Objective

Attain professional-grade proficiency navigating, inspecting, manipulating, and securing the Linux file system hierarchy. Master command-line manipulation of files and directories, understand timestamp mechanics and file classifications, navigate effortlessly between relative and absolute paths, and develop the mental models required for advanced Linux systems administration and DevOps automation.

## 🎓 Course Video

`~/Videos/video_courses/DevOp Camp ZTM/5.The Linux File System/`
