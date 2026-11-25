# 📖 Lesson: Error Handling

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/0136. Error Handling.mp4`  
> **Module:** 09 — Advanced Python: Error Handling

---

## 🎯 What This Lesson Covers

Using `try` and `except` to intercept a failure instead of letting it terminate the program. How multiple handlers are matched in order, and how to bind the exception object to inspect its type and message. Why handlers should be narrow and do something useful with the error rather than hiding every problem.

---

## 📝 Key Concepts

### 1. `try` / `except` Basics

Python runs the `try` body; if an exception occurs, the rest of that body is skipped and Python looks for a matching `except` clause. If none matches, the exception propagates to the caller.

```python
def parse_age(text):
    try:
        return int(text)
    except ValueError:
        return None

print(parse_age("42"))        # 42
print(parse_age("forty-two"))  # None
```

---

### 2. Multiple `except` Clauses

Handlers are checked from top to bottom, so put the most specific type first: a subclass matches its parent's handler. Unrelated exception types can share one handler by grouping them in a tuple.

```python
def read_key(mapping, key):
    try:
        return mapping[key]
    except (KeyError, TypeError) as exc:
        return f"unreadable: {exc.__class__.__name__}"
```

---

### 3. The Exception Object

`except SomeError as exc:` binds the raised instance, letting you log its message, inspect its type, or re-raise it with extra context. An empty `except:` catches `BaseException` and is almost always too broad.

```python
try:
    1 / 0
except ZeroDivisionError as exc:
    print(type(exc).__name__, str(exc))  # ZeroDivisionError division by zero
```

---

### 4. Catch Only What You Can Handle

A good handler repairs the problem, supplies a sensible default, or adds context before re-raising. Wrapping a whole program in `except Exception:` hides bugs; prefer the narrowest exception type you actually know how to deal with.

```python
def safe_int(text, default=0):
    try:
        return int(text)
    except (TypeError, ValueError):
        return default
```

---

## ⚠️ Gotchas & Pro Tips

1. **Handler order matters** — a broad handler placed first makes later, more specific handlers unreachable.
2. **Avoid a bare `except:`** — it also catches `KeyboardInterrupt` and `SystemExit`; use a specific type or `except Exception:`.
3. **Do not silently pass** — `except SomeError: pass` erases the failure; return a default, record it, or re-raise.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
