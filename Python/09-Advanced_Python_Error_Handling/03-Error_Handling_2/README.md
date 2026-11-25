# 📖 Lesson: Error Handling 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/0137. Error Handling 2.mp4`  
> **Module:** 09 — Advanced Python: Error Handling

---

## 🎯 What This Lesson Covers

Completing the full `try`/`except`/`else`/`finally` structure and using `finally` for cleanup that must happen either way. Raising exceptions yourself with `raise`, including a bare `raise` to re-raise the current error. Defining custom exception classes and chaining a new error to the original cause with `raise ... from ...`.

---

## 📝 Key Concepts

### 1. `else` Runs Only on Success

The optional `else` clause runs after the `try` body only if no exception was raised. It keeps success-path code out of the `try` block, so a bug there is not accidentally caught by the handler meant for the risky operation.

```python
def doubled_number(text):
    try:
        value = int(text)
    except ValueError:
        return None
    else:
        return value * 2
```

---

### 2. `finally` Always Runs

`finally` executes whether the `try` body succeeded, raised, or returned. It is the right place for cleanup such as closing a resource, but a `return` inside `finally` replaces any value the `try` body was returning.

```python
def read_with_cleanup(close):
    try:
        return "data"
    finally:
        close()
```

---

### 3. Raising and Re-Raising

Use `raise ErrorType("message")` to signal that your own validation failed. A bare `raise`, valid only inside an `except` block, re-raises the same exception with its original traceback intact instead of starting a new one.

```python
def withdraw(balance, amount):
    if amount > balance:
        raise ValueError("insufficient funds")
    return balance - amount
```

---

### 4. Custom Exceptions and Chaining

A custom class inheriting from `Exception` gives callers a domain-specific type to catch. `raise NewError(...) from exc` sets `__cause__` to the original exception, so the traceback shows both problems while the handler still reports one clear failure.

```python
class ConfigurationError(Exception):
    """Raised when a configuration value is invalid."""


def parse_port(raw):
    try:
        return int(raw)
    except ValueError as exc:
        raise ConfigurationError("port must be an integer") from exc
```

---

## ⚠️ Gotchas & Pro Tips

1. **Do not `return` from `finally`** — it silently discards exceptions and overrides returns from the `try` block.
2. **A bare `raise` needs an active exception** — outside an `except` block it raises `RuntimeError`.
3. **Keep custom exceptions shallow** — inheriting from `Exception` is enough for most domains; reserve `BaseException` for interpreter-level cases.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
