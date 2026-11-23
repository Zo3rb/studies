# 📖 Lesson: Docstrings

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0076. Docstrings.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Docstrings are the first string literal in a module, class, or function and serve as built-in documentation. This lesson covers their syntax, the recommended one-line summary body format (PEP 257), how `help()` and `__doc__` expose them, and why docstrings beat comments for documenting reusable code.

---

## 📝 Key Concepts

### 1. What a Docstring Is

A docstring is a string literal placed as the very first statement of a module, class, or function. Python stores it in the object's `__doc__` attribute. Unlike a comment, it is a real runtime object that tools such as `help()`, IDEs, and documentation generators can read.

```python
def greet(name):
    """Return a friendly greeting for name."""
    return f"Hello, {name}!"

print(greet.__doc__)
help(greet)
```

---

### 2. PEP 257 Conventions

Use triple double quotes (`"""`). The first line is a short imperative summary ending with a period. If more detail is needed, leave a blank line, then describe arguments, return value, and exceptions. Keep the closing quotes on their own line for multi-line docstrings.

```python
def divide(a, b):
    """Divide a by b.

    Args:
        a: The numerator.
        b: The denominator; must not be zero.

    Returns:
        The quotient as a float.

    Raises:
        ValueError: If b is zero.
    """
    if b == 0:
        raise ValueError("b must not be zero")
    return a / b
```

---

### 3. Docstrings vs Comments

Comments explain a specific line or implementation detail to future maintainers; docstrings describe *what a callable does* and how to use it without reading its body. Well-named functions still benefit from a one-line docstring, especially in shared code and libraries.

```python
# A comment: why this particular formula is used.
def celsius_to_fahrenheit(celsius):
    """Convert a Celsius temperature to Fahrenheit.

    Uses F = C * 9/5 + 32.
    """
    return celsius * 9 / 5 + 32  # 9/5 first keeps floats in play
```

---

## ⚠️ Gotchas & Pro Tips

1. **The docstring must be the first statement** — A comment before it is fine, but any other statement (even a variable assignment) means the string is no longer a docstring and `__doc__` will be `None`.
2. **Raw strings help with backslashes** — Prefix with `r` (`r"""..."""`) when the docstring contains backslashes such as regex patterns, so Python does not interpret them as escapes.
3. **Single-line form stays on one line** — `"""Return the square of n."""` is perfectly valid; reserve multiline docstrings for functions whose contract needs explanation.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
