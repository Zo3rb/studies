# 🧠 Module 05 Knowledge Assessment: The Linux File System

Test your understanding of the Linux File System across the lessons in Module 05. Fill in your answers under `> **My Answer:**` for each question, then review your answers against the lesson notes.

---

## 📊 Score Tracker

| Section | Topic | Total Questions | My Score |
| :--- | :--- | :---: | :---: |
| **Section 1** | Filesystem Hierarchy & Paths (Lessons 00–02) | 3 | `/ 3` |
| **Section 2** | `ls`, File Types & Timestamps (Lessons 04–07) | 4 | `/ 4` |
| **Section 3** | Viewing Files (`cat`, `less`, `head`, `tail`) (Lessons 08–10) | 4 | `/ 4` |
| **Section 4** | File Operations (`touch`, `mkdir`, `cp`, `mv`, `rm`, `shred`) (Lessons 12–15) | 4 | `/ 4` |
| **Total** | **Part 1 (Lessons 00–16)** | **15** | **/ 15** |

---

## Part 1 (Lessons 00–16)

### Section 1: Filesystem Hierarchy & Paths (Lessons 00–02)

#### Question 1
Under the Linux Filesystem Hierarchy Standard (FHS), which standard directory is designated specifically for host-wide, human-readable configuration files?
- A) `/var`
- B) `/etc`
- C) `/usr`
- D) `/opt`

> **My Answer:**  

---

#### Question 2
What is the fundamental difference between an **absolute path** and a **relative path**? Provide an example of how you would reference your current user's home directory using both.

> **My Answer:**  

---

#### Question 3
What does the single dot (`.`) and double dot (`..`) represent in every Linux directory listing, and why does an empty directory always have a hard link count of 2?

> **My Answer:**  

---

### Section 2: `ls`, File Types & Timestamps (Lessons 04–07)

#### Question 4
Explain the difference between `atime`, `mtime`, and `ctime`. Which of these three timestamps **cannot** be forged or backdated to an arbitrary historical time using the `touch` command, and why?

> **My Answer:**  

---

#### Question 5
You are troubleshooting an active server crash and need to identify which log files in `/var/log` were updated in the last 2 minutes. Why is `ls -ltr` strongly preferred by DevOps engineers over `ls -lt`?

> **My Answer:**  

---

#### Question 6
Match the first character of the permission string in `ls -l` with the corresponding Linux file type:
- `-`
- `d`
- `l`
- `c`
- `b`
- `p`
- `s`

> **My Answer:**  

---

#### Question 7
How does the `file` utility determine what kind of data a file contains, and why does renaming a shell script to `script.png` fail to fool Linux?

> **My Answer:**  

---

### Section 3: Viewing Files (Lessons 08–10)

#### Question 8
What does `cat` stand for, and why is `cat file.txt | grep pattern` considered a "Useless Use of Cat" (UUOC)? What is the optimal command syntax?

> **My Answer:**  

---

#### Question 9
In the `less` pager:
1. How do you jump directly to the beginning of the file?
2. How do you jump directly to the end of the file?
3. How do you search forward for an error?
4. How do you safely quit?

> **My Answer:**  

---

#### Question 10
In production log monitoring, why should an engineer use `tail -F` rather than `tail -f` when monitoring active application logs rotated by `logrotate`?

> **My Answer:**  

---

#### Question 11
Write a single bash command pipeline combining `head` and `tail` that extracts **only lines 25 through 30** from a 100-line file named `access.log`.

> **My Answer:**  

---

### Section 4: File Operations (Lessons 12–15)

#### Question 12
Write a single `mkdir` command using bash brace expansion and necessary flags to create the entire directory tree:
`project/` with subdirectories `src/`, `config/`, and `logs/`, ensuring the command succeeds even if `project/` already exists.

> **My Answer:**  

---

#### Question 13
Why is `cp -a` strongly recommended over `cp -r` when making full system backups or copying directory structures for container images? List at least three specific attributes `cp -a` preserves that `cp -r` does not.

> **My Answer:**  

---

#### Question 14
Explain the physical difference between running `mv file.txt /newdir/` when `/newdir/` is on the **same filesystem partition** vs. when `/newdir/` is on a **different mounted disk/partition**.

> **My Answer:**  

---

#### Question 15
Explain why standard `rm file.txt` does not truly erase sensitive data from disk sectors, and write the complete `shred` command to securely overwrite a file named `credentials.key` 3 times with random data, finish with a zero-byte pass, and delete the file.

> **My Answer:**  

---

## Part 2 (Lessons 17–33)

### Section 5: Pipes & Redirection (Lessons 17–18)

**Q16.** What does the `|` (pipe) operator do? How is it fundamentally different from `>` (redirection)?

> **My Answer:**

---

**Q17.** What are the three standard streams in Linux? Give their file descriptor numbers.

> **My Answer:**

---

**Q18.** Write a command that runs `ls /fakedir` and sends **both** stdout and stderr into a file called `output.log`, discarding nothing.

> **My Answer:**

---

**Q19.** What does `/dev/null` represent and why would you redirect stderr to it?

> **My Answer:**

---

**Q20.** What does `tee` do? Write a pipeline that searches `/var/log/syslog` for "error", displays results on screen, AND saves them to `errors.txt`.

> **My Answer:**

---

### Section 6: Finding Files (Lessons 20–22)

**Q21.** What is the difference between `locate` and `find`? When would you use each?

> **My Answer:**

---

**Q22.** Write a `find` command that finds all files in `/home` that are larger than 100MB, owned by user `ali`, and were modified in the last 7 days.

> **My Answer:**

---

**Q23.** What is the difference between `find -exec command {} \;` and `find -exec command {} +`? Which is more efficient for large results?

> **My Answer:**

---

### Section 7: grep & strings (Lessons 23–24)

**Q24.** Write a `grep` command that recursively searches all `.conf` files under `/etc` for the word "timeout" (case-insensitive), showing line numbers and the filename.

> **My Answer:**

---

**Q25.** What does the `strings` command do and why is it useful for binary files? Give a real-world security use case.

> **My Answer:**

---

### Section 8: Comparing Files (Lesson 26)

**Q26.** What is the difference between `cmp` and `diff`? Which would you use to generate a patch file?

> **My Answer:**

---

**Q27.** You downloaded a Linux ISO. How do you verify it hasn't been corrupted or tampered with using `sha256sum`? Write the exact commands.

> **My Answer:**

---

### Section 9: VIM (Lessons 27–29)

**Q28.** Name the 4 main VIM modes and how to enter each one.

> **My Answer:**

---

**Q29.** Write the VIM command-line substitution to replace ALL occurrences of "localhost" with "0.0.0.0" in an entire file, with confirmation for each replacement.

> **My Answer:**

---

**Q30.** What does the VIM dot command (`.`) do? Give a practical example of when it saves time.

> **My Answer:**

---

### Section 10: Archiving & Links (Lessons 31–33)

**Q31.** Write the `tar` command to create a gzip-compressed archive of `/var/www/html/` named `webbackup.tar.gz`, excluding all `.log` files.

> **My Answer:**

---

**Q32.** What is an inode? List 4 things stored in an inode and 2 things NOT stored in an inode.

> **My Answer:**

---

**Q33.** You create a hard link to `config.txt`. Then you delete `config.txt`. What happens to the data? What is the link count before and after?

> **My Answer:**

---

**Q34.** What is a dangling symlink? How do you find all broken symlinks under a directory?

> **My Answer:**

---

**Q35.** Fill in the comparison table:

| Property | Hard Link | Symlink |
| :--- | :--- | :--- |
| Own inode? | | |
| Cross filesystem? | | |
| Works on directories? | | |
| Survives target deletion? | | |
| `ls -l` indicator | | |

> **My Answer:** *(fill table above)*

---

## 📊 Part 2 Score
`[ ] / 20 correct`

## Notes / Mistakes to Remember
<!-- Write anything you got wrong or found tricky -->
