# 📖 Lesson: is vs ==

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0059. is vs ==.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

At first glance `is` and `==` both seem to ask 'are these the same?', but they answer different questions. This lesson explains that `==` compares *values* while `is` compares *object identity* (memory addresses), demonstrates CPython's small-integer/string interning, and establishes the rule that `None`, `True`, and `False` should be compared with `is`.

---

## 📝 Key Concepts

### 1. Equality: `==` compares values

`a == b` asks whether the two objects have the same content. For built-in containers it compares element by element, recursively. Two separately created lists with identical elements are equal even though they are different objects.

```python
a = [1, 2, 3]
b = [1, 2, 3]

print(a == b)   # True: same contents
print(a is b)   # False: two distinct list objects
b.append(4)
print(a == b)   # now False
```

---

### 2. Identity: `is` compares objects

`a is b` is true only when both names refer to the **same object** in memory; it is effectively `id(a) == id(b)`. Use it for singletons — `None`, `True`, `False`, and `NotImplemented` — and nowhere else in ordinary application code.

```python
x = None
y = None
print(x is y)       # True: None is a singleton
print(x == y)       # also True, but 'is' is the idiomatic check

value = 0
if value is None:
    print("missing")
else:
    print("present (even zero counts)")
```

---

### 3. Interning Makes `is` Unreliable for Values

CPython caches small integers (-5 to 256) and may reuse identical string literals, so `1000 is 1000` can be false while `100 is 100` is true. These are implementation optimizations, not language guarantees — never use `is` to compare numbers or strings.

```python
a = 100
b = 100
print(a is b)       # True in CPython (small-int cache)

x = 1000
y = 1000
print(x is y)       # may be False in a script/REPL

s1 = "hello"
s2 = "".join(["h", "ello"])
print(s1 == s2, s1 is s2)  # True, False
```

---

## ⚠️ Gotchas & Pro Tips

1. **Always use `is None`, not `== None`** — `is None` is faster, unambiguous, and cannot be tricked by a custom `__eq__` method returning something surprising. Linters such as flake8 enforce this with rule E711.
2. **Never use `is` for numbers, strings, or containers** — Interning and literal reuse are implementation details that differ across Python versions and execution contexts. `is` answers identity, not equality.
3. **Beware `is not` vs `!=`** — `x is not None` checks for a missing value; `x != None` compares values. Use the same identity rule for negation.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
