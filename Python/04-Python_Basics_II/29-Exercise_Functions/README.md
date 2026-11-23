# 📖 Lesson: Exercise - Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0079. Exercise - Functions.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This exercise brings together everything about functions: choosing parameters, providing sensible defaults, returning results, validating input, and documenting behaviour. You will build a small toolkit of helpers and check each one against expected outputs.

---

## 📝 Key Concepts

### 1. Design the Interface First

Before writing the body, decide what the function should receive and what it should give back. A clear name, a short parameter list, and a single well-defined return value make the function easy to call and test. Defaults should represent the common case.

```python
def normalise(name, *, strip=True):
    """Return a title-cased name, optionally stripping surrounding whitespace."""
    cleaned = name.strip() if strip else name
    return cleaned.title()

print(normalise("  ada lovelace  "))
```

---

### 2. Validate and Return, Don't Print

Guard clauses check invalid inputs early; the rest of the function computes a result. Return that result so callers can combine functions. A docstring states the contract, including what happens for invalid input.

```python
def safe_divide(a, b):
    """Return a / b, or None when b is zero."""
    if b == 0:
        return None
    return a / b

print(safe_divide(9, 3), safe_divide(9, 0))
```

---

### 3. Compose Small Helpers

Solving a larger exercise by chaining short helpers keeps each piece testable. For example, filter valid values with one function, transform them with another, and summarise with a third; the final function just wires them together.

```python
def valid(values):
    return [v for v in values if isinstance(v, (int, float))]

def doubled(values):
    return [v * 2 for v in values]

def summary(values):
    cleaned = doubled(valid(values))
    return sum(cleaned), len(cleaned)

print(summary([1, "x", 3]))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Self-check with assertions** — Write expected results beside each call using `assert`. This turns the exercise into an executable answer key and catches regressions immediately.
2. **Prefer explicit over clever** — A readable three-line function beats a compressed one-liner. Clean code matters more here than demonstrating exotic syntax.
3. **Keyword-only parameters clarify flags** — Placing `*` before boolean options (`*, strip=True`) forces descriptive keyword arguments and prevents swapped-argument bugs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
