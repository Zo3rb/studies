# 📖 Lesson: Escape Sequences

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0024. Escape Sequences.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Escape sequences let you place characters in a string that would otherwise end it or change its layout.
The lesson uses backslashes to include apostrophes and quotation marks inside text.
It also prints tabs and newlines to format output across multiple lines.
Raw strings are a practical follow-up when you want backslashes treated literally, such as in Windows paths.

---

## 📝 Key Concepts

### 1. Common Escape Sequences

A backslash introduces a special character inside a string literal.

| Sequence | Meaning | Example result |
| :--- | :--- | :--- |
| `\'` | Single quote | `'` |
| `\"` | Double quote | `"` |
| `\\` | Backslash | `\` |
| `\n` | Newline | Line break |
| `\t` | Tab | Horizontal space |

```python
print('It\'s working')
print("She said, \"hello\"")
print("C:\\Users\\Andrei")
print("one\ntwo")
print("col1\tcol2")
```

---

### 2. Choosing Quotes vs Escaping

You can often avoid an escape by using the other quote character: `"it's"` needs no backslash.
Escape both when you need the same quote inside the same delimiter, or use a triple-quoted string.

```python
print("It's easy")
print('He said "hi"')
print('It\'s quoted')
print("She said, 'It is fine'.")
```

---

### 3. Newlines, Tabs, and `print()`

`\n` inserts a line break inside the literal; `print()` adds its own trailing newline unless you set `end`.
`\t` is useful for simple columns, though f-string width formatting is more precise.

```python
print("Line 1\nLine 2")
print("Name\tScore", end="\n")
print(f"{'Andrei':<10}{95:>3}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Raw strings keep backslashes** — `r'C:\Users'` prints the backslashes literally; raw strings cannot end with a single backslash.
2. **Unknown escapes** — `\d` is not a Python escape; it stays as two characters and may emit a `DeprecationWarning`.
3. **`repr()` reveals escapes** — `repr('a\nb')` shows `'a\nb'`, which helps debug invisible characters.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
