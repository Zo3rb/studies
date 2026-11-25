# 📖 Lesson: Error Handling 3

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/0139. Error Handling 3.mp4`  
> **Module:** 09 — Advanced Python: Error Handling

---

## 🎯 What This Lesson Covers

Organizing related failures into a small custom exception hierarchy so callers can catch a whole family or one precise case. How `raise ... from exc` preserves the original cause while `raise ... from None` deliberately hides it. Inspecting a caught exception with the `traceback` module, and deciding which layer of a program should handle an error.

---

## 📝 Key Concepts

### 1. Custom Exception Hierarchies

Related errors can share a base class. A caller that can recover from any application failure catches the base, while a caller that needs to distinguish cases catches a subclass. Keep the hierarchy small and inherit from `Exception`.

```python
class AppError(Exception):
    """Base class for errors raised by this application."""


class ConfigError(AppError):
    """The configuration is invalid."""


class FetchError(AppError):
    """Remote data could not be fetched."""
```

---

### 2. Preserve or Suppress the Context

`raise NewError(...) from exc` records the original exception in `__cause__` and shows "The above exception was the direct cause" in the traceback. `raise NewError(...) from None` sets `__suppress_context__` so the chained traceback is hidden; use it only when the lower-level error would be misleading to the reader.

```python
def load_number(raw):
    try:
        return int(raw)
    except ValueError as exc:
        raise ConfigError("number must be an integer") from exc


def hide_low_level_detail(raw):
    try:
        return int(raw)
    except ValueError:
        raise ConfigError("number must be an integer") from None
```

---

### 3. Inspecting Exceptions Programmatically

Inside a handler you can format the traceback with `traceback.format_exc()` or read attributes such as `exc.__cause__`. This is useful for logging a full diagnostic while showing the user only a short message.

```python
import traceback

try:
    int("nope")
except ValueError:
    last_line = traceback.format_exc().strip().splitlines()[-1]
    print(last_line)  # ValueError: invalid literal for int() with base 10: 'nope'
```

---

### 4. Handle Errors at the Right Boundary

Handle an exception where you can make a decision: retry, return a default, translate it for a user, or add context and re-raise. Letting an error propagate through layers that cannot help is clearer than swallowing it early, and the outermost boundary can log anything that remains unhandled.

```python
def outer(value):
    try:
        return load_number(value)
    except AppError as exc:
        print(f"handled {type(exc).__name__}: {exc}")
        return None
```

---

## ⚠️ Gotchas & Pro Tips

1. **`from None` deletes useful evidence** — it hides the original failure from the traceback; prefer a chained cause unless the low-level error is genuinely irrelevant.
2. **Catch the base class only at a real boundary** — catching `AppError` deep inside a function defeats the purpose of specific subclasses.
3. **Log the traceback, not just the message** — `str(exc)` omits where the failure happened; `traceback.format_exc()` keeps the full stack.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
