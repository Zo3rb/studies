# 📖 Lesson: List Methods

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0036. List Methods.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson introduces the core list methods using a shopping-basket example.
`append()`, `insert()`, and `extend()` add items; `pop()`, `remove()`, and `clear()` take them away.
All of these methods modify the list in place rather than returning a new list.
You also learn which methods return a useful value, especially `pop()`.

---

## 📝 Key Concepts

### 1. Adding Items

`append(x)` adds one item at the end, `insert(i, x)` places one item before index `i`, and `extend(iterable)` adds each item from another iterable.

| Method | Effect | Return value |
| :--- | :--- | :--- |
| `append(x)` | Add one element | `None` |
| `insert(i, x)` | Insert before index `i` | `None` |
| `extend(iterable)` | Add all elements | `None` |

```python
basket = ["apple", "banana"]
basket.append("orange")
basket.insert(1, "pear")
basket.extend(["grape", "kiwi"])
print(basket)
```

---

### 2. Removing Items

`pop()` removes and returns the last item (or the item at a chosen index).
`remove(x)` deletes the first matching value and raises `ValueError` if it is missing; `clear()` empties the list.

```python
basket = ["apple", "banana", "apple"]
last = basket.pop()
first_apple = basket.remove("apple")
print("last:", last)
print("remove returned:", first_apple)
print("basket:", basket)
basket.clear()
print("cleared:", basket)
```

---

### 3. In-Place Mutation and Return Values

Mutating methods change the original list, so you usually do not assign their result.
Assigning `items = items.append(x)` replaces the list with `None`, a classic beginner bug.

```python
items = [1, 2]
result = items.append(3)
print("append result:", result)
print("items:", items)
del items[0]
print("after del items[0]:", items)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`append` vs `extend`** — `append([1, 2])` adds one nested list; `extend([1, 2])` adds two separate elements.
2. **`remove` can fail** — It deletes only the first match and raises `ValueError` if the value is absent.
3. **`pop()` returns a value** — Capture it when you need the removed item; otherwise calling `pop()` alone is fine.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
