# 📖 Lesson: Why Do We Need Decorators?

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/0134. Why Do We Need Decorators?.mp4`  
> **Module:** 08 — Advanced Python: Decorators

---

## 🎯 What This Lesson Covers

Decorators keep cross-cutting concerns such as logging, timing, authorization, and caching out of business logic. Instead of copying the same setup and cleanup into many functions, you write one wrapper and apply it with `@name`. This lesson connects that motivation to real framework patterns such as `@app.route`, shows `functools.lru_cache` in action, and identifies when a plain helper function is clearer.

---

## 📝 Key Concepts

### 1. Cross-Cutting Concerns

Logging a call, measuring duration, checking permissions, and memoizing results are behaviors that cut across many unrelated functions. A decorator adds those behaviors around a call while the function body stays focused on its own job.

```python
from functools import wraps

def log_call(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"{func.__name__} called")
        return func(*args, **kwargs)
    return wrapper
```

---

### 2. Reuse Without Repetition

Write the wrapper once and decorate as many functions as need it; frameworks use the same trick to register routes. Decoration happens at import time, so the registry is populated before any request is handled.

```python
routes = {}

def route(path):
    def decorator(func):
        routes[path] = func.__name__
        return func
    return decorator

@route("/home")
def home():
    return "Welcome"
```

---

### 3. Standard Library Trade-offs

`functools.lru_cache` is a ready-made caching decorator that trades memory for speed and requires hashable arguments. Timing decorators usually use `time.perf_counter()`, while authorization decorators check roles before delegating; each adds indirection, so do not reach for a decorator when a single explicit call would be simpler.

```python
from functools import lru_cache

@lru_cache(maxsize=None)
def square(n):
    return n * n

print(square(7), square(7), square.cache_info())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Do not decorate for one-off behavior** — a plain helper call is clearer than a new layer of indirection used only once.
2. **Wrappers can hide real costs** — `@wraps` fixes identity, but caching still needs hashable arguments and a bounded size, and timing adds its own small overhead.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
