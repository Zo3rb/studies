# 📖 Lesson: Decorators 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/0132. Decorators 2.mp4`  
> **Module:** 08 — Advanced Python: Decorators

---

## 🎯 What This Lesson Covers

This lesson makes decorators reusable and transparent. It covers `@wraps` from `functools`, argument-forwarding wrappers, and decorator factories that accept configuration before decorating a function. The result is a decorator that preserves the original function's metadata and works across many signatures.

---

## 📝 Key Concepts

### 1. Preserve Metadata with `@wraps`

Without help, a wrapper reports its own `__name__` and `__doc__`, so debugging, documentation tools, and `inspect.signature` see the wrong function. Applying `@wraps(func)` to the wrapper copies that metadata and sets `__wrapped__` back to the original.

```python
from functools import wraps

def logged(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"calling {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@logged
def add(a, b):
    """Return the sum of two numbers."""
    return a + b

print(add.__name__, add.__doc__)
```

---

### 2. Forward `*args` and `**kwargs`

A reusable wrapper should not hard-code the decorated function's parameters. Accepting `*args` and `**kwargs` lets it work with positional, keyword, and default arguments, then pass them through unchanged.

```python
from functools import wraps

def trace(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        print(f"{func.__name__}{args}{kwargs} -> {result}")
        return result
    return wrapper

@trace
def describe(a, b=2, *, flag=False):
    return (a, b, flag)
```

---

### 3. Decorator Factories Accept Arguments

When a decorator needs configuration, write a factory that returns the actual decorator. `@repeat(3)` first calls `repeat(3)`, then applies the returned decorator to the function: `greet = repeat(3)(greet)`.

```python
from functools import wraps

def repeat(times):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = func(*args, **kwargs)
            return result
        return wrapper
    return decorator

@repeat(3)
def greet(name):
    return f"Hi, {name}!"
```

---

## ⚠️ Gotchas & Pro Tips

1. **Apply `@wraps(func)` to the innermost wrapper** — that is the function returned to callers; skipping it hides the original name, docstring, and signature.
2. **A configured decorator has three layers** — factory, decorator, and wrapper; the decorator layer is the one that receives the function object.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
