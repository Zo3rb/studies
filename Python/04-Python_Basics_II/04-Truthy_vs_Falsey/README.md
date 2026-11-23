# 📖 Lesson: Truthy vs Falsey

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0054. Truthy vs Falsey.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Python decides every `if` condition by asking whether an object is *truthy* or *falsey*, not by requiring a literal `True` or `False`. This lesson catalogues the values Python treats as false, shows how `bool()` reveals that decision, and explains why `if name:` is the idiomatic way to test for an empty string or missing value.

---

## 📝 Key Concepts

### 1. The Falsey Values

Only a small, fixed set of values is falsey: `False`, `None`, numeric zero (`0`, `0.0`, `0j`), empty sequences (`''`, `[]`, `()`, `range(0)`), empty mappings (`{}`), and empty sets (`set()`). Almost everything else is truthy, including non-zero numbers, non-empty containers, and functions.

```python
for value in (False, None, 0, 0.0, "", [], {}, set(), 1, "x", [0]):
    print(f"{value!r:<8} -> {bool(value)}")
```

---

### 2. Implicit Boolean Context

An `if` statement, a `while` condition, and the operands of `and` / `or` all evaluate objects in a Boolean context. That is why `if items:` means 'run this block if the collection is not empty'. Writing `if items == True:` is both wrong for non-empty lists and unnecessary.

```python
name = ""
items = [1, 2, 3]

if name:
    print("name provided")
else:
    print("name is empty")

if items:
    print(f"found {len(items)} items")
```

---

### 3. Truthiness of Custom Objects

For your own classes, Python calls `__bool__()` if it exists; otherwise it falls back to `__len__()` (zero means falsey). This lets a collection-like object decide its own emptiness. Be explicit in your classes so their truthiness is obvious to readers.

```python
class Basket:
    def __init__(self, items):
        self.items = items

    def __len__(self):
        return len(self.items)

print(bool(Basket([])))    # False: __len__ returns 0
print(bool(Basket(["apple"])))  # True
```

---

## ⚠️ Gotchas & Pro Tips

1. **`bool` is a class, not just a keyword** — `bool(x)` always returns exactly `True` or `False`, even when `x` is a list, string, or custom object. `True` and `False` are singletons, and `bool` is a subclass of `int` (`True == 1`).
2. **An empty container is falsey, but a container of falsey values is truthy** — `bool([])` is `False`, yet `bool([0, '', None])` is `True` because the list has three elements. Check the container itself, not its contents.
3. **Use `is None` for missing values** — `if value is None:` distinguishes `None` from other falsey values such as `0` and `''`. A plain `if value:` treats all of them the same, which may be exactly what you want when validating user input.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
