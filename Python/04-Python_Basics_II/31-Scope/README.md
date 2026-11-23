# 📖 Lesson: Scope

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0081. Scope.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Scope determines where a name is visible and how long it lives. This lesson introduces local (function) scope versus global (module) scope, shows that assignment inside a function creates a local name, and explains how name lookup proceeds from the innermost scope outward.

---

## 📝 Key Concepts

### 1. Global and Local Scope

Names assigned at module level are global: visible throughout the file. Names assigned inside a function are local: they exist only during that call and are invisible outside. Each call gets its own set of local names.

```python
app_name = "Demo"   # global

def show():
    local_value = 42
    print(f"inside: {app_name}, {local_value}")

show()
print(f"outside: {app_name}")
# print(local_value)  # NameError
```

---

### 2. Assignment Creates a Local Name

Python decides whether a name is local at *compile time*: if a function assigns to a name anywhere in its body, that name is local throughout the function. Reading it before the assignment therefore raises `UnboundLocalError`, even if a global with the same name exists.

```python
count = 10

def broken():
    print(count)   # looks local because of the assignment below
    count = 5

try:
    broken()
except UnboundLocalError as exc:
    print(f"Expected: {type(exc).__name__}: {exc}")
```

---

### 3. Lookups Search Outward

When Python sees a name, it searches the current local scope, then any enclosing function scopes, then globals, then built-ins. The first match wins; a local name can therefore *shadow* a global or built-in with the same spelling.

```python
value = "global"

def read_global():
    return value           # no local 'value', so global is used

def shadow():
    value = "local"
    return value

print(read_global(), shadow(), value)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Blocks do not create scope** — `if`, `for`, and `while` blocks do not introduce a new scope in Python; variables assigned there belong to the surrounding function or module.
2. **Parameters are local too** — A parameter is a local name bound at the start of each call. Reassigning it never changes the caller's variable.
3. **`UnboundLocalError` is a subclass of `NameError`** — Seeing it means 'this name is local but has not been assigned yet'. Use a different name, pass the value in as a parameter, or declare `global`/`nonlocal` when mutation is truly intended.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
