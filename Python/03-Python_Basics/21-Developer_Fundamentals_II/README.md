# 📖 Lesson: Developer Fundamentals II

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0031. DEVELOPER FUNDAMENTALS - II.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This mindset lesson focuses on commenting with intention.
The advice is to write code that explains itself through clear names and structure, then add comments only where the reason is not obvious.
You see how renaming a variable can remove the need for a redundant comment.
The goal is code that stays understandable without a wall of narration.

---

## 📝 Key Concepts

### 1. Prefer Self-Explanatory Code

A good name answers "what" so a comment does not have to. Compare cryptic and descriptive versions of the same logic.
Small, focused functions and consistent structure also reduce the need for commentary.

```python
# Less helpful
d = 86400  # seconds in a day

# More helpful
SECONDS_PER_DAY = 24 * 60 * 60
print(SECONDS_PER_DAY)
```

---

### 2. Comment the Why, Not the What

Comments earn their place when explaining a non-obvious rule, a workaround, or a business constraint.
Docstrings describe a function's contract and can be read by help() and documentation tools.

```python
def retry_delay(attempt):
    """Return a capped exponential backoff in seconds."""
    # Cap at 60s so a stalled job does not block the queue forever.
    return min(2 ** attempt, 60)

print(retry_delay(3), retry_delay(10))
```

---

### 3. Keep Comments Accurate

A stale comment is worse than no comment because it misleads the reader.
When code changes, update or delete nearby comments; use version control instead of commenting out old code.

```python
items = [4, 2, 7]
items.sort()  # sort() mutates in place; no comment needed for obvious code
print(items)
print("docstring:", retry_delay.__doc__)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Comments do not execute** — They are ignored by Python, so they cannot make incorrect code correct.
2. **`#` vs docstrings** — `#` starts a line comment; a triple-quoted string as the first statement in a function is its docstring.
3. **Don't narrate every line** — `# add one to count` above `count += 1` adds noise, not clarity.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
