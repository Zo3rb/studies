# 📖 Lesson: Decorators

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/0130. Decorators.mp4`  
> **Module:** 08 — Advanced Python: Decorators

---

## 🎯 What This Lesson Covers

A decorator is a callable that receives a function and returns a replacement function. Python's `@decorator` syntax applies that replacement at definition time, so the name afterwards refers to the wrapper. This lesson builds the smallest possible decorator and traces what happens when the decorated function is called.

---

## 📝 Key Concepts

### 1. Functions Are First-Class Objects

In Python a function is a value: you can bind it to a name, pass it to another function, store it in a container, and inspect attributes such as `__name__`. This is the foundation that makes decorators possible.

```python
def greet(name):
    return f"Hello, {name}!"

alias = greet
print(alias("Ada"))       # Hello, Ada!
print(greet.__name__)     # greet
```

---

### 2. A Decorator Wraps a Function

A decorator takes the original function, defines a new function around it, and returns that new function. The wrapper usually accepts `*args` and `**kwargs` so it can call the original with any signature.

```python
def shout(func):
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs).upper()
    return wrapper

@shout
def greet(name):
    return f"hello, {name}"

print(greet("Ada"))  # HELLO, ADA
```

---

### 3. `@decorator` Is Syntactic Sugar

Writing `@shout` above a function is exactly the same as assigning `greet = shout(greet)` after the definition. The transformation happens once, when the `def` statement executes, not on every call.

```python
def announce(func):
    print(f"decorating {func.__name__}")
    return func

@announce
def ping():
    return "pong"

# Equivalent: ping = announce(ping)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Call the original function inside the wrapper** — `return func` hands back a function object; `return func(*args, **kwargs)` actually runs it and returns its result.
2. **Decoration happens at definition time** — any work done directly in the decorator runs when the module loads, while work inside the wrapper runs on each call.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
