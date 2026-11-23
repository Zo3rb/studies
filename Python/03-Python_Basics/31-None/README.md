# 📖 Lesson: None

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0041. None.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

`None` represents the absence of a value and is the only value of type `NoneType`.
The lesson compares it with `NULL` in other languages and shows how to initialize a variable before it has a real value.
A game-style example starts with `weapon = None` until the player picks one up.
It also explains that functions without a `return` statement produce `None`.

---

## 📝 Key Concepts

### 1. `None` Is a Singleton

Python has exactly one `None` object, so the identity check `is None` is the recommended test.
It is not the same as `0`, `False`, or an empty string, even though all of them are falsy.

```python
value = None
print(value, type(value).__name__)
print(value is None)
print(None == 0, None == False, None == "")
```

---

### 2. Placeholders and Initialization

Use `None` when a variable will be filled in later, such as a game character's weapon or a cache that has not been populated.
This makes "not set yet" different from a legitimate empty value.

```python
weapon = None
print("equipped:", weapon)
weapon = "sword"
print("equipped:", weapon)
```

---

### 3. `None` and Falsiness

`bool(None)` is `False`, but `None == False` is `False`; never treat them as interchangeable.
Functions fall off the end and return `None` implicitly, and dictionary `get()` defaults to `None`.

```python
print("bool(None):", bool(None))
print("None == False:", None == False)
sample = {"a": 1}
print("get missing:", sample.get("b"))
print("get default:", sample.get("b", 0))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Use `is None`** — `== None` works for the singleton but `is None` is idiomatic and cannot be overridden by custom equality.
2. **Not `null` or `nil`** — Python spells it `None` with a capital N; `null` is a `NameError`.
3. **Printing shows `None`** — `print(None)` displays the word `None`, which is different from printing an empty string.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
