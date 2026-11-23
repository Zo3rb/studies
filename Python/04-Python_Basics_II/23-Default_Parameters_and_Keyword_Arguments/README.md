# 📖 Lesson: Default Parameters and Keyword Arguments

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0073. Default Parameters and Keyword Arguments.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Default parameters make arguments optional, and keyword arguments make calls readable. This lesson explains how defaults are bound, why non-default parameters must come first, and why a mutable object such as `[]` is dangerous as a default value.

---

## 📝 Key Concepts

### 1. Default Parameter Values

A parameter with `= value` in the definition may be omitted at the call site. Defaults are evaluated **once**, when the function is defined, not on each call. Parameters with defaults must come after parameters without them.

```python
def greet(name="world", punctuation="!"):
    return f"Hello, {name}{punctuation}"

print(greet())
print(greet("Ada"))
print(greet("Grace", punctuation="?"))
```

---

### 2. Keyword Arguments Improve Clarity

Keywords allow out-of-order calls and make boolean 'flag' arguments readable at the call site. A common convention is a keyword-only marker (`*`) after which callers must use keywords, preventing confusing positional calls.

```python
def create_user(name, *, active=True, role="viewer"):
    return {"name": name, "active": active, "role": role}

print(create_user("Ada"))
print(create_user("Grace", active=False, role="admin"))
# create_user("Linus", True, "admin")  # TypeError: keyword-only
```

---

### 3. The Mutable Default Trap

Because defaults are created once, using `[]` or `{}` as a default means every call that omits the argument shares the **same** object. The safe pattern is `items=None` followed by `items = [] if items is None else items` inside the function.

```python
def broken(item, items=[]):
    items.append(item)
    return items

print(broken("a"), broken("b"))  # ['a'] ['a', 'b'] -- shared!

def fixed(item, items=None):
    items = [] if items is None else items
    items.append(item)
    return items

print(fixed("a"), fixed("b"))    # ['a'] ['b']
```

---

## ⚠️ Gotchas & Pro Tips

1. **Defaults are captured at definition time** — Using a value that changes later (for example `limit=len(DATA)`) does not update the default. Pass `None` and compute the value inside the function when you need it current.
2. **Never use a mutable object as a default** — `[]`, `{}`, and `set()` are the classic mistake. Immutable defaults (`None`, numbers, strings, tuples) are safe.
3. **Put `*` in the header for keyword-only parameters** — `def f(a, *, b=1):` forces callers to write `f(1, b=2)`. It eliminates a whole class of swapped-argument bugs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
