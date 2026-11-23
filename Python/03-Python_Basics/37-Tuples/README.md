# 📖 Lesson: Tuples

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0047. Tuples.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Tuples are immutable sequences written with parentheses.
The lesson shows that they support indexing and membership tests like lists, but cannot be changed after creation.
Because of immutability, tuples are slightly more efficient and can be dictionary keys when all items are hashable.
Fixed data such as coordinates or RGB colors is the recommended use case.

---

## 📝 Key Concepts

### 1. Creating Tuples

Use `(a, b)` for multiple items, `(x,)` for exactly one, and `()` for the empty tuple. Parentheses are optional in many contexts; the comma is what matters.
`tuple(iterable)` converts another iterable into a tuple.

```python
point = (10, 20)
single = (42,)
empty = ()
from_list = tuple([1, 2, 3])
print(point, single, empty, from_list)
print(type(single).__name__)
```

---

### 2. Immutability and Hashability

Tuple items cannot be reassigned, inserted, or removed. A tuple can be used as a dictionary key only if every item inside it is hashable.
A tuple containing a list is therefore still unhashable.

```python
point = (10, 20)
try:
    point[0] = 5
except TypeError as error:
    print("TypeError:", error)
lookup = {(10, 20): "origin"}
print(lookup[(10, 20)])
try:
    hash((1, [2]))
except TypeError as error:
    print("TypeError:", error)
```

---

### 3. Tuples vs Lists

Both are ordered and indexable, but their mutation rules and typical roles differ.

| Feature | `tuple` | `list` |
| :--- | :--- | :--- |
| Syntax | `(1, 2)` | `[1, 2]` |
| Mutable | No | Yes |
| Hashable (if items are) | Yes | No |
| Typical use | Fixed records, dict keys | Collections that change |

```python
rgb = (255, 128, 0)
print("red:", rgb[0], "green:", rgb[1])
print("fixed record:", rgb)
```

---

## ⚠️ Gotchas & Pro Tips

1. **The trailing comma matters** — `(42)` is just an integer; `(42,)` is a one-item tuple.
2. **Not deeply immutable** — A tuple containing a list still allows that inner list to be mutated.
3. **Efficiency is secondary** — Choose tuples for immutability and intent, not for tiny performance gains.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
