# 📖 Lesson: Parameters and Arguments

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0072. Parameters and Arguments.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Parameters let a function receive data from its caller. This lesson distinguishes parameters (names in the definition) from arguments (values at the call site), demonstrates positional and keyword passing, and shows what happens when the number of arguments does not match.

---

## 📝 Key Concepts

### 1. Parameters vs Arguments

A **parameter** is the variable listed in the `def` header; an **argument** is the actual value supplied in a call. `def add(a, b):` declares two parameters; `add(2, 3)` passes two arguments that are bound to `a` and `b` for that call.

```python
def add(a, b):
    return a + b

print(add(2, 3))            # positional arguments
print(add(a=10, b=20))      # keyword arguments
```

---

### 2. Positional and Keyword Arguments

Positional arguments are matched in order. Keyword arguments are matched by name, so their order does not matter. You may mix them, but once a keyword argument is used, all following arguments must also be keywords (`f(1, y=2)` is fine; `f(x=1, 2)` is a `SyntaxError`).

```python
def describe(name, age, city):
    return f"{name}, {age}, from {city}"

print(describe("Ada", 36, "London"))
print(describe(city="Paris", name="Grace", age=45))
print(describe("Linus", age=55, city="Helsinki"))
```

---

### 3. Arity and Argument Errors

Python checks the number of arguments at call time. Too few, too many, or an unknown keyword raises `TypeError`. Reading that message carefully is the fastest way to fix function-call bugs.

```python
def connect(host, port):
    return f"{host}:{port}"

print(connect("localhost", 5432))
try:
    connect("localhost")                    # missing 'port'
except TypeError as exc:
    print(f"Expected error: {exc}")
try:
    connect("localhost", 5432, retry=True)  # unexpected argument
except TypeError as exc:
    print(f"Expected error: {exc}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Arguments are bound to new local names** — Reassigning a parameter inside the function does not change the caller's variable (for immutable values like numbers and strings).
2. **Keywords document intent** — `create_user(name='Ada', active=True)` is self-explanatory; `create_user('Ada', True)` makes the reader check the definition.
3. **Mutable arguments are shared objects** — Passing a list gives the function the same object. Mutating it inside the function is visible to the caller — often surprising to beginners.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
