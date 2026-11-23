# 📖 Lesson: Lists

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0033. Lists.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Lists are ordered collections written with square brackets.
The lesson shows that a list can hold mixed types, including other lists, and that items are accessed by index.
It compares Python lists with arrays from other languages and explains why lists store references to objects.
A shopping-basket example makes indexing and length concrete.

---

## 📝 Key Concepts

### 1. Creating Lists

Use `[]` for an empty list or `[a, b, c]` for a populated one. `list(iterable)` builds one from another iterable.
Lists keep insertion order and allow duplicate values.

```python
empty = []
basket = ["apple", "banana", 2, ["extra", "item"]]
from_string = list("abc")
print(empty, basket, from_string)
```

---

### 2. Indexing, Length, and Membership

Indexes start at 0; negative indexes count from the end. `len()` returns the number of top-level items.
The `in` operator checks membership and returns a boolean.

```python
basket = ["apple", "banana", "apple"]
print(len(basket))
print(basket[0], basket[-1])
print("apple" in basket, "pear" in basket)
```

---

### 3. Lists vs Arrays

A Python list can mix types because it stores references, not a fixed-size block of identical values.
Specialized arrays (for example `array.array` or NumPy arrays) are homogeneous and can be faster and more memory-efficient.

| Feature | `list` | Homogeneous array |
| :--- | :--- | :--- |
| Element types | Mixed allowed | One type |
| Resizing | Dynamic | Often fixed / managed |
| Typical use | General-purpose Python code | Numeric or low-level work |

```python
mixed = [1, "two", 3.0, True]
print([type(item).__name__ for item in mixed])
```

---

## ⚠️ Gotchas & Pro Tips

1. **Don't name a variable `list`** — That hides the built-in `list()` constructor and causes confusing errors later.
2. **Out-of-range access fails** — `basket[10]` raises `IndexError` on a short list, while a slice would clip safely.
3. **Assignment creates aliases** — `b = basket` makes both names refer to the same list; mutating through one is visible through the other.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
