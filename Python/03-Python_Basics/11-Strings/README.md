# 📖 Lesson: Strings

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0021. Strings.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Strings represent text and can be written with single, double, or triple quotes.
The lesson prints strings, checks them with `type()`, and shows how triple quotes preserve line breaks.
A login-style example builds a greeting by joining a name with spaces and other text.
You also see that strings are ordered sequences, which sets up indexing and slicing later.

---

## 📝 Key Concepts

### 1. Creating Strings

Python accepts `'single'`, `"double"`, and `'''triple'''` or `"""triple"""` quotes.
Use the opposite quote style to include a quote character without escaping, and triple quotes for multiline text.

| Literal | Result |
| :--- | :--- |
| `'hello'` | Simple single-quoted string |
| `"it's fine"` | Apostrophe needs no escape |
| `'''line 1\nline 2'''` | Multiline string with a real newline |
| `""` | Empty string, length 0 |

```python
single = 'hello'
double = "it's fine"
multiline = '''line 1
line 2'''
print(single, double, multiline, sep=" | ")
```

---

### 2. Strings Are Ordered Sequences

Each character has a position, starting at 0. `len()` counts characters and `for` loops over them one at a time.
Python strings are Unicode, so characters from many languages work out of the box.

```python
word = "Python"
print(len(word))
print(word[0], word[-1])
for char in word:
    print(char, end=" ")
print()
```

---

### 3. Building a Login Greeting

Concatenation with `+` joins strings in order, but it does not add spacing for you.
In the video's login example, a name is combined with literal spaces to produce a friendly message.

```python
username = "Andrei"
greeting = "Welcome, " + username + "!"
print(greeting)
print(greeting.upper())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Quote consistency** — Opening and closing quotes must match; `"hello'` is a `SyntaxError`.
2. **Triple quotes keep whitespace** — Indentation inside a triple-quoted literal becomes part of the string.
3. **Digits in quotes are text** — `"100"` is a `str`, not a number; convert with `int()` before arithmetic.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
