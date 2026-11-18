# 📖 Lesson: Searching String Patterns in Text Files (`grep`)

> **Course Video:** `23 - Searching for String Patterns in Text Files (grep)/Searching for String Patterns in Text Files (grep).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The origin and power of `grep` (Global Regular Expression Print).
- The complete `grep` options reference table (`-i`, `-r`, `-l`, `-n`, `-v`, `-c`, `-w`, `-A`, `-B`, `-C`, `-E`, etc.).
- Basic Regular Expressions (BRE) vs Extended Regular Expressions (ERE) with `-E`.
- Exact fixed-string searching with `-F` (formerly `fgrep`).
- Perl-compatible regex with `-P` (PCRE).
- Extracting only matched portions with `-o`.
- Context extraction around matches (`-A`, `-B`, `-C`).
- Piping commands into `grep` for log analysis and system inspection.

---

## 📝 Key Concepts

### 1. What is `grep`?

`grep` stands for **g/re/p** (*Globally search a Regular Expression and Print*). It searches input files or streams line-by-line, matching against a pattern or regular expression, and prints lines containing matches.

```bash
grep [options] "pattern" [file...]
```

---

### 2. Comprehensive `grep` Flags Reference

| Flag | Meaning | Description | Example |
| :--- | :--- | :--- | :--- |
| `-i` | Ignore case | Case-insensitive matching | `grep -i "error" app.log` |
| `-r` | Recursive | Recursively search directories | `grep -r "bind-address" /etc` |
| `-R` | Recursive dereference | Recursive search following symbolic links | `grep -R "DB_PASS" /var/www` |
| `-l` | Files with match | Print only the names of matching files, not the lines | `grep -rl "127.0.0.1" /etc/` |
| `-L` | Files without match | Print only names of files that do *not* contain the pattern | `grep -rL "Copyright" ./src` |
| `-n` | Line numbers | Prefix each line of output with its 1-based line number | `grep -n "root" /etc/passwd` |
| `-v` | Invert match | Select non-matching lines (exclude lines matching pattern) | `grep -v "^#" /etc/ssh/sshd_config` |
| `-c` | Count | Print only a count of matching lines per file | `grep -c "404" access.log` |
| `-w` | Whole word | Match only whole words (bounded by non-word chars) | `grep -w "is" file.txt` |
| `-x` | Exact whole line | Match only lines that match the pattern from start to end | `grep -x "admin" users.txt` |
| `-A N` | After context | Print `N` lines of trailing context after each match | `grep -A 3 "Traceback" app.log` |
| `-B N` | Before context | Print `N` lines of leading context before each match | `grep -B 2 "Exception" app.log` |
| `-C N` | Surrounding context | Print `N` lines of both leading and trailing context | `grep -C 2 "FATAL" system.log` |
| `-E` | Extended Regex | Interpret pattern as ERE (enables `+`, `?`, `|`, `()`) | `grep -E "(warning|error)" app.log` |
| `-F` | Fixed strings | Treat pattern as plain text (no regex parsing; ultra-fast) | `grep -F "192.168.1.1" access.log` |
| `-P` | Perl Regex | Interpret pattern as PCRE (enables `\d`, `\w`, lookaheads) | `grep -P "\d{1,3}\.\d{1,3}" ip.txt` |
| `-o` | Only matching | Print only the matching parts of lines, each on its own line | `grep -oE "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"` |
| `-h` | Suppress filename | Suppress filename prefix in multi-file output | `grep -h "status" *.json` |
| `-H` | Force filename | Always print filename prefix (even with single file) | `grep -H "root" /etc/passwd` |
| `--color` | Highlight match | Highlight matching strings with terminal colors (auto/always/never) | `grep --color=auto "pattern" file` |

---

### 3. Basic vs Extended Regular Expressions (BRE vs ERE)

In **Basic Regular Expressions (BRE)** (standard `grep`), characters like `+`, `?`, `|`, `(`, and `)` are treated as literal characters unless escaped with a backslash (`\+`, `\?`, `\|`, `\(`).

In **Extended Regular Expressions (ERE)** (`grep -E` or historically `egrep`):
- `+`: 1 or more occurrences of the preceding element.
- `?`: 0 or 1 occurrence of the preceding element.
- `|`: Alternation (OR operator).
- `( ... )`: Grouping.

```bash
# Basic regex (requires backslash escaping):
grep "\(GET\|POST\)" access.log

# Extended regex (clean, readable):
grep -E "(GET|POST)" access.log
```

---

### 4. Anchors and Character Classes

| Anchor / Pattern | Meaning | Example |
| :--- | :--- | :--- |
| `^` | Beginning of line | `grep "^root" /etc/passwd` |
| `$` | End of line | `grep "nologin$" /etc/passwd` |
| `^$` | Empty blank line | `grep -v "^$" file.txt` (strip blank lines) |
| `.` | Any single character | `grep "c.t" animals.txt` (matches cat, cot, cut) |
| `[abc]` | Any character in set | `grep "[0-9]" data.txt` |
| `[^abc]` | Any character NOT in set | `grep "[^0-9]" data.txt` |

#### The "Clean Config" Idiom:
When reading production config files full of comments and blank lines:
```bash
# Strip out both comments (starting with #) AND blank lines:
grep -vE "^\s*#|^\s*$" /etc/ssh/sshd_config
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **`egrep` and `fgrep` are deprecated:** Modern GNU systems display warnings when using `egrep` or `fgrep`. Always use `grep -E` and `grep -F`.
- 🚨 **Special characters without quotes:** Running `grep * pattern` tries to match against shell glob expansion. Always place the search pattern in single quotes: `grep 'pattern' file`.
- 💡 **IP Address search with `-F`:** When searching for an IP like `192.168.1.1`, the dots `.` act as "any character" in regex. Using `grep -F '192.168.1.1'` treats the dots literally and executes significantly faster!
- 💡 **Extracting tokens with `-o`:** Combining `-o` with `-P` or `-E` turns `grep` into an extraction utility (e.g., pulling URLs, emails, or UUIDs from dirty logs).

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
