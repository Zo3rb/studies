# ⚡ Challenges — The Linux File System

Work through each set after watching the corresponding Module 05 lessons. Write your solutions in `challenge.sh`.

---

## Set A — Paths, ls, Timestamps, File Types, Viewing Files {#set-a}

**A1.** Display your current working directory. Then navigate to `/var/log` using an absolute path, list its contents in long format sorted by modification time (newest first), and return to your home directory using a shortcut (not `cd /home/username`).

**A2.** In `/etc`, list all files whose names start with the letter `h`, showing hidden files, human-readable sizes, and inode numbers — all in one `ls` command.

**A3.** Create a file called `testfile.txt`. Use `stat` to display its full metadata. Then:
- Access the file with `cat`
- Check if `atime` changed
- Modify the file, then check if `mtime` and `ctime` changed
- Change its permissions with `chmod`, then check if `ctime` changed without `mtime` changing

**A4.** In a test directory, create one file of each of these types and verify its type with `ls -F` and `file`:
- A regular file
- A directory
- A symbolic link

**A5.** Use `cat` with the appropriate flag to display `/etc/passwd` with line numbers. Then use `less` to open `/var/log/syslog` (or `/var/log/kern.log`) and search for the word "error". Use `tail -f` to monitor `/var/log/syslog` live (press Ctrl+C to stop after a few seconds).

**A6.** Extract lines 10 through 15 from `/etc/passwd` using a `head` + `tail` pipeline.

---

## Set B — cp, mv, rm, shred {#set-b}

**B1.** Create a directory `~/challenge_b/` with subdirectories `src/` and `backup/`. Create 3 files in `src/`: `alpha.txt`, `beta.txt`, `gamma.txt` with some content in each.

**B2.** Copy `alpha.txt` to `backup/` preserving all timestamps and permissions. Verify the timestamps match the original using `stat`.

**B3.** Copy the entire `src/` directory to `backup/src_copy/` using the archive flag. Confirm all files and attributes were preserved.

**B4.** Rename `beta.txt` to `beta_v2.txt` using `mv`. Then move `gamma.txt` into `backup/`. Verify results with `ls -la`.

**B5.** Use `rm` with the interactive flag to delete `alpha.txt` (answer `y`). Then attempt to `rmdir` the now-empty `backup/src_copy/src/` directory (it won't be empty — use the right flag).

**B6.** Create a file called `sensitive.txt` with fake credentials. Use `shred` to securely wipe it with 5 passes, verbose output, and delete it afterwards. Confirm it's gone.

---

## Set C — locate, find {#set-c}

**C1.** Use `locate` to find all files named `nginx.conf` on the system. If `locate` returns no results, run `sudo updatedb` first. Then use `which` and `whereis` on `python3`.

**C2.** Use `find` to list all **directories** under `/etc` that were **modified in the last 1 day**.

**C3.** Use `find` to locate all files in `/var/log` that are **larger than 1MB** and display their sizes with `ls -lh` using `-exec`.

**C4.** Use `find` to find all `.sh` files under your home directory, then use `-exec` to make them all executable in a single command.

**C5.** Find all **empty files** under `/tmp` and delete them using `find` with `-exec rm` (use `{}` and `\;`).

**C6.** Use `find` with `xargs` to search for the word "root" inside all files under `/etc` that end in `.conf`. Compare the syntax to using `-exec grep`.

---

## Set D — tar, ln {#set-d}

**D1.** Create a directory `~/project/` with at least 3 files and 1 subdirectory. Archive it into `project_backup.tar.gz`. List the archive contents to confirm all files are included.

**D2.** Extract `project_backup.tar.gz` into a new directory `~/restored/`. Confirm the structure matches the original.

**D3.** Create a compressed backup of `/etc/ssh/` (the SSH config directory) named `ssh_backup.tar.gz` in your home directory. Exclude any `.log` files.

**D4.** Create a file `original.txt`. Create a **hard link** to it named `hardlink.txt`. Verify they share the same inode. Modify `hardlink.txt` and confirm the change appears in `original.txt`. Delete `original.txt` and confirm `hardlink.txt` still works.

**D5.** Create a **symlink** named `link_to_etc` pointing to `/etc`. Navigate into it, list its contents, and confirm it works. Then delete the symlink (not the target!) and confirm `/etc` is unaffected.

**D6.** Create a symlink to a file, then delete the target file. Confirm the symlink is now dangling. Use `find` to locate all dangling symlinks in your home directory.

---

## 💡 Notes
<!-- Write any observations, tricks you discovered, or things that surprised you -->
