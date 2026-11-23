# 📖 Lesson: List Slicing

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0034. List Slicing.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson applies string-style slicing to lists and emphasizes the mutability difference.
Slices return new lists, so `items[:]` is a shallow copy while `alias = items` points to the same list.
You see how changing a copied list leaves the original intact, but changing an alias does not.
Negative steps and omitted bounds behave the same way they do for strings.

---

## 📝 Key Concepts

### 1. Slice Syntax on Lists

`items[start:stop:step]` returns a new list from `start` inclusive to `stop` exclusive.
Omitted bounds mean beginning and end; a negative step walks backward.

```python
items = [0, 1, 2, 3, 4, 5]
print(items[1:4])
print(items[:3])
print(items[::2])
print(items[::-1])
```

---

### 2. Copy vs Alias

Assignment does not copy a list; it copies the reference. A full slice (`[:]`) or `list.copy()` creates a new list object.
Mutating the copy changes only the copy.

```python
original = [1, 2, 3]
alias = original
copy = original[:]
copy.append(4)
print(original, alias, copy)
print("alias is original:", alias is original)
print("copy is original:", copy is original)
```

---

### 3. Slices Are New Lists

Because a slice is a list, you can store it, iterate over it, or assign to a slice to replace a segment.
The replacement iterable does not need to have the same length as the slice being replaced.

```python
values = ["a", "b", "c", "d"]
first_two = values[:2]
values[1:3] = ["X", "Y", "Z"]
print(first_two)
print(values)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Shallow copies share nested objects** — `copy = matrix[:]` copies outer references; nested lists inside are still shared.
2. **Slices clip out-of-range bounds** — `items[50:100]` returns `[]` instead of raising `IndexError`.
3. **`list.copy()` is clearer** — It does the same as `[:]` but states the intent, especially for beginners.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
