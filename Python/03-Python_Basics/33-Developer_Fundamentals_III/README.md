# 📖 Lesson: Developer Fundamentals III

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0043. DEVELOPER FUNDAMENTALS - III.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This mindset lesson asks when to use a list and when to use a dictionary.
It weighs order, data capacity, and the flexibility of key-value access.
The advice is to match the data structure to the question you need to answer: "what is at position 2?" versus "what is Andrei's score?".
Practising this choice builds better design habits than memorizing method names.

---

## 📝 Key Concepts

### 1. Use a List When Order Matters

Lists shine for sequences: a to-do list, frames in an animation, or scores in ranking order.
Duplicates are allowed and access by position is direct (`items[0]`).
Finding an item by value is a linear scan, which is fine for small collections.

```python
queue = ["first", "second", "third"]
print(queue[0])
print("position of second:", queue.index("second"))
```

---

### 2. Use a Dictionary When You Have Labels

Dictionaries shine when each value has a meaningful key: names, IDs, or configuration names.
Lookup by key is fast on average and keys must be unique, so duplicates are resolved by overwriting.

```python
scores = {"Andrei": 95, "Bob": 82}
print(scores["Andrei"])
scores["Bob"] = 88
print(scores)
```

---

### 3. Tradeoffs at a Glance

Clarity usually beats micro-optimization, but the shapes of these structures signal intent to readers.

| Question | Prefer | Reason |
| :--- | :--- | :--- |
| What comes first / next? | `list` | Ordered, indexable |
| What is the value for this label? | `dict` | Keyed lookup |
| Do I need duplicates? | `list` | Dict keys are unique |
| Is membership tested repeatedly? | `dict` / `set` | Average O(1) lookup |

```python
# Same data, two shapes:
as_list = [("Andrei", 95), ("Bob", 82)]
as_dict = {"Andrei": 95, "Bob": 82}
print(as_list[0])
print(as_dict["Andrei"])
```

---

## ⚠️ Gotchas & Pro Tips

1. **Dict order is insertion order** — Python 3.7+ preserves it, but choose a dict for key semantics, not because you want positional logic.
2. **List lookup by value is O(n)** — For frequent membership checks, a set or dict is the better tool.
3. **Consider records later** — For fixed field names, `namedtuple` or `dataclass` may communicate intent better than a raw dict.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
