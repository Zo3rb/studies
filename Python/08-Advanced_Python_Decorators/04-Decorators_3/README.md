# 📖 Lesson: Decorators 3

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/0133. Decorators 3.mp4`  
> **Module:** 08 — Advanced Python: Decorators

---

## 🎯 What This Lesson Covers

This lesson goes deeper into composition and state: stacked decorators, the difference between application order and call order, and closures that retain mutable state between calls. It also shows how decorators can cache results or enforce permissions without changing the decorated function's body.

---

## 📝 Key Concepts

### 1. Stacking Decorators and Order

Decorators are applied bottom-up when the function is defined, but calls flow top-down through the resulting wrappers. With `@a` above `@b`, the definition is equivalent to `f = a(b(f))`, so `a` runs first on every call.

```python
from functools import wraps

def tag(name):
    def decorator(func):
        @wraps(func)
        def wrapper():
            return f"[{name}] {func()}"
        return wrapper
    return decorator

@tag("outer")
@tag("inner")
def base():
    return "body"

print(base())  # [outer] [inner] body
```

---

### 2. Closure State Between Calls

A variable defined in the decorator lives in the wrapper's closure, so it persists across calls without a global. Use `nonlocal` to rebind an integer or other immutable value from inside the wrapper.

```python
def call_counter(func):
    count = 0

    def wrapper():
        nonlocal count
        count += 1
        print(f"call {count}")
        return func()

    return wrapper
```

---

### 3. Practical Wrappers: Caching and Authorization

A caching decorator such as `functools.lru_cache` stores results by argument tuple, avoiding repeated work for pure functions. An authorization wrapper can check a user's role before delegating, keeping policy outside business logic.

```python
from functools import lru_cache

@lru_cache(maxsize=128)
def fib(n):
    return n if n < 2 else fib(n - 1) + fib(n - 2)

print(fib(10), fib.cache_info())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Read stacks from the bottom when predicting application** — `@a` above `@b` means `a(b(func))`; `a` wraps the already-wrapped `b`.
2. **Create state inside the decorator** — each decorated function then gets its own closure; a module-level counter would be shared by every function you decorate.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
