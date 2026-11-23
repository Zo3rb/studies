# 📖 Lesson: Exercise: Type Conversion

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0030. Exercise - Type Conversion.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This exercise asks you to treat user input as text, convert it to integers, and calculate an age from a birth year.
The video uses `input()`; these notes use fixed sample values so the practice script runs deterministically without stdin.
You print the result with an f-string and verify that the converted value is really an `int`.
The lesson also highlights bad input, where `int()` raises a `ValueError`.

---

## 📝 Key Concepts

### 1. Input Arrives as a String

`input()` always returns a `str`, even when the user types digits. Arithmetic requires conversion with `int()` or `float()`.
For a deterministic demo, start with string variables instead of reading stdin.

```python
name = "Andrei"
birth_year_text = "1990"   # stands in for input()
print(type(birth_year_text).__name__)
birth_year = int(birth_year_text)
print(type(birth_year).__name__)
```

---

### 2. Calculate and Format

Subtract the birth year from the current year, then build a readable message with an f-string.
Keep numbers as numbers for the calculation and convert them to text only in the output.

```python
current_year = 2026
birth_year = 1990
age = current_year - birth_year
print(f"Hello {name}, you are {age} years old in {current_year}.")
```

---

### 3. Validate Before Converting

`int('')` and `int('abc')` raise `ValueError`. A simple `try`/`except` block keeps the program from crashing and lets you report the problem.
Also reject impossible values such as a future birth year.

```python
def parse_year(text, current=2026):
    try:
        year = int(text)
    except ValueError:
        return None
    if year < 1900 or year > current:
        return None
    return year

print(parse_year("1990"), parse_year("abc"))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`input()` never returns an int** — Always convert before arithmetic: `age = 2026 - int(birth_year_text)`.
2. **Whitespace is tolerated by `int()`** — `int(' 1990 ')` works, but empty text still fails.
3. **F-strings do not do math** — `{current_year - birth_year}` does math inside the braces; a plain variable name just displays it.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
