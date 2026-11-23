# 📖 Lesson: Developer Fundamentals IV

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0069. DEVELOPER FUNDAMENTALS - IV.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This fundamentals lesson steps back from syntax to the habits that make debugging and learning effective. It covers decomposing a problem into small functions, reading tracebacks from the bottom, changing one thing at a time, and verifying assumptions with print statements and assertions.

---

## 📝 Key Concepts

### 1. Decompose Before You Code

Turn a requirement into a short list of named steps, then give each step its own function with a clear name. Small functions are easier to test in isolation, and their names form a readable outline of the solution.

```python
# Problem: report whether scores contain a passing grade.
# Steps: validate data -> find passes -> report count.
def valid_scores(scores):
    return [s for s in scores if isinstance(s, (int, float))]

def passing(scores):
    return [s for s in scores if s >= 60]

scores = [90, "bad", 45, 72]
clean = valid_scores(scores)
print(f"clean={clean}, passing={passing(clean)}")
```

---

### 2. Read Tracebacks from the Bottom

A Python traceback lists frames oldest-first, so the **last** line contains the exception type and message; the final frame tells you the exact file and line that failed. Fix the first reported error, re-run, and repeat — later errors are often consequences of the first one.

```python
# Example traceback (intentional, shown as text):
# Traceback (most recent call last):
#   File "app.py", line 3, in <module>
#     print(1 / 0)
# ZeroDivisionError: division by zero
print("Read the last line first: ZeroDivisionError at line 3")
```

---

### 3. Iterate and Verify with Assertions

Make one small change at a time and check it immediately. `assert` turns an assumption into an executable check, so regressions surface at the exact point where a value is wrong. Print intermediate values when the logic is unclear, then remove the debug output once fixed.

```python
def average(values):
    assert values, "values must not be empty"
    return sum(values) / len(values)

print(f"average={average([2, 4, 6])}")
assert average([2, 4, 6]) == 4.0
```

---

## ⚠️ Gotchas & Pro Tips

1. **Rubber-duck debugging works** — Explaining a problem line by line — to a colleague or even to an inanimate object — forces you to state assumptions explicitly, which often reveals the bug.
2. **Do not guess at error messages** — Copy the exception type and the last frame into your search query. Reading the actual message is far faster than changing random lines.
3. **Keep a tiny reproducible example** — Reduce a failing program to the smallest input that still fails. That example is easier to reason about, easier to share, and often makes the cause obvious.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
