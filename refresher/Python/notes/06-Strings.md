# notes/06-Strings.md

## 🎯 Learning Objectives

- Manipulate strings using slicing, indexing, and built‑in methods.
- Apply `strip`, `split`, `join`, and `replace` for cleaning and tokenising text.
- Use case conversion (`lower`, `upper`, `title`, `capitalize`).
- Format strings with **f‑strings**, `%`‑formatting, and `str.format`.
- Search within strings using `find`, `index`, `startswith`, `endswith`.
- Write simple helper functions with proper type hints and Google‑style docstrings.

## 📖 Theory & Examples

Strings are immutable sequences of Unicode characters. Python provides a rich API for common text operations.

### Basic operations

```python
s = "Hello, World!"
first_char = s[0]          # 'H'
last_char = s[-1]          # '!'
slice = s[7:12]            # 'World'
```

### Whitespace handling

```python
raw = "   lots of space   \n"
clean = raw.strip()        # 'lots of space'
lines = raw.splitlines()  # ['   lots of space   ']
```

### Splitting & joining

```python
sentence = "Python is fun"
words = sentence.split()                # ['Python', 'is', 'fun']
joined = "-".join(words)               # 'Python-is-fun'
```

### Replacement & case conversion

```python
modified = sentence.replace("fun", "awesome")   # 'Python is awesome'
upper = sentence.upper()                         # 'PYTHON IS FUN'
```

### Formatting strings

```python
name = "Alice"
age = 30
# f‑string (recommended)
msg = f"{name} is {age} years old."
# %-formatting
msg2 = "%s is %d years old." % (name, age)
# str.format
msg3 = "{0} is {1} years old.".format(name, age)
```

### Searching

```python
msg.find("is")      # returns index of first occurrence or -1
msg.startswith("Python")
msg.endswith("old.")
```

## 💡 Hints & Tricks

- Remember **strings are immutable** – every operation returns a new string.
- Use **list comprehensions** when you need to transform characters (`[c.upper() for c in s]`).
- For large text processing, consider the `re` module (regular expressions), but start with the simple string methods.
- When concatenating many pieces, prefer `''.join(list_of_parts)` for performance.

## ✅ Test Cases (to be placed in `tests/test_06_strings.py`)

```python
self.assertEqual(reverse_string('abcd'), 'dcba')
self.assertTrue(is_palindrome('Madam'))
self.assertEqual(count_vowels('Hello'), 2)
self.assertEqual(remove_whitespace(' a b c '), 'abc')
```

---

_All files follow the same premium layout used throughout the refresher project._
