# 📖 Lesson: Exercises - Error Handling

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/0138. Exercises - Error Handling.mp4`  
> **Module:** 09 — Advanced Python: Error Handling

---

## 🎯 What This Lesson Covers

Applying exception handling to realistic small tasks: validating values at a boundary, converting text to numbers, and reading dictionaries or lists without crashing. Comparing the Pythonic EAFP style with explicit LBYL checks. Translating low-level conversion errors into one clear domain error so callers do not need to know the implementation details.

---

## 📝 Key Concepts

### 1. Validate at the Boundary

Check types and ranges where untrusted values enter a function, then raise a precise error. Convert the fragile operation in a `try` block and chain any conversion failure so both the friendly message and the original cause are available.

```python
def parse_port(raw):
    if not isinstance(raw, str):
        raise TypeError("port must be text")
    try:
        port = int(raw)
    except ValueError as exc:
        raise ValueError(f"invalid port: {raw!r}") from exc
    if not 1 <= port <= 65535:
        raise ValueError("port out of range")
    return port
```

---

### 2. EAFP vs LBYL

"Easier to ask forgiveness than permission" (EAFP) attempts the operation and catches the exception; "look before you leap" (LBYL) checks conditions first. EAFP is usually more idiomatic in Python and avoids race conditions, while explicit checks are useful when validation itself communicates the rule clearly.

```python
def first_eafp(items):
    try:
        return items[0]
    except (IndexError, TypeError):
        return None


def first_lbyl(items):
    if isinstance(items, (list, tuple)) and items:
        return items[0]
    return None
```

---

### 3. Safe Dictionary Access

Indexing a missing dictionary key raises `KeyError`. Use `get()` when a default is a valid answer, and keep `try`/`except KeyError` for cases where a missing key is genuinely exceptional.

```python
config = {"host": "localhost"}
print(config.get("port", 8080))  # 8080
```

---

### 4. One Domain Error per Failure

Callers should catch a meaningful type such as `ValidationError`, not a random mix of `ValueError` and `TypeError` that leaks how you implemented validation. Wrap the low-level failure once, at the point where you understand what it means.

```python
class ValidationError(Exception):
    """Raised when a value fails a domain rule."""


def require_positive(number):
    if number <= 0:
        raise ValidationError(f"expected a positive number, got {number}")
    return number
```

---

## ⚠️ Gotchas & Pro Tips

1. **`dict.get()` never raises `KeyError`** — but omitting its default returns `None`, which may mask a missing value.
2. **Do not use exceptions for routine control flow in hot loops** — a failed `int()` per item is expensive; validate the common case first.
3. **Catch at a meaningful boundary** — a function that can repair or explain an error should handle it; otherwise let it propagate.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
