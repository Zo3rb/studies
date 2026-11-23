# 📖 Lesson: Scope Rules

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0082. Scope Rules.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Python's name resolution follows the LEGB rule: Local, Enclosing, Global, Builtin. This lesson walks through each level, shows nested functions capturing variables from an enclosing scope (closures), and warns about shadowing built-ins such as `list` or `sum`.

---

## 📝 Key Concepts

### 1. The LEGB Rule

For every bare name, Python searches in order: **L**ocal (current function), **E**nclosing (any outer function), **G**lobal (module), **B**uiltin (`len`, `print`, `sum`, ...). The first match wins, and only the first match — the search stops immediately.

```python
message = "global"

def outer():
    message = "enclosing"

    def inner():
        return message      # finds the enclosing value

    return inner()

print(outer(), message)     # 'enclosing' 'global'
```

---

### 2. Closures Capture Enclosing Names

A nested function can refer to a variable from an outer function even after the outer call has returned; the function together with its remembered environment is a *closure*. Reading works automatically, but rebinding the captured name requires `nonlocal` (covered later).

```python
def make_greeter(greeting):
    def greet(name):
        return f"{greeting}, {name}!"
    return greet

hello = make_greeter("Hello")
print(hello("Ada"))
print(f"captured value: {hello.__closure__[0].cell_contents}")
```

---

### 3. Shadowing Builtins

Because built-ins are last in LEGB, assigning a global or local named `list`, `dict`, `sum`, or `max` hides the built-in. Calling it then fails with `TypeError`. Never name variables after built-ins; add a suffix such as `values_list` instead.

```python
values = [1, 2, 3]
print(sum(values))          # built-in sum

sum = 99                    # shadows the built-in in this module
try:
    sum(values)
except TypeError as exc:
    print(f"shadowed sum fails: {type(exc).__name__}")
finally:
    del sum                 # remove the shadowing name
print(sum(values))          # built-in available again
```

---

## ⚠️ Gotchas & Pro Tips

1. **Enclosing scopes are function scopes only** — A plain `if` or `for` block is not an enclosing LEGB level. Only `def` (and `class`, with special rules) creates a nested scope.
2. **The global namespace is per module** — Each imported module has its own globals; `from module import name` copies the reference into your namespace rather than sharing the variable.
3. **Use `globals()` and `locals()` to inspect** — These built-ins return dictionaries of the current global and local namespaces. They are great for learning, but avoid mutating them in application code.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
