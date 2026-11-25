# 📖 Lesson: List Comprehensions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0126. List Comprehensions.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

The anatomy of a list comprehension: an output expression, one or more `for` clauses, and optional `if` filters. How comprehensions map to ordinary loops, when to use nested loops, and how generator expressions differ in memory use.

---

## 📝 Key Concepts

### 1. Syntax and Loop Equivalence

A comprehension `[expression for item in iterable]` builds a new list. It is equivalent to a `for` loop that appends each result, but more compact.

```python
squares = [n * n for n in range(6)]
print(squares)  # [0, 1, 4, 9, 16, 25]
```

---

### 2. Filtering with `if`

One or more `if` clauses keep only items that pass a condition; they appear after the `for` clause they filter.

```python
evens = [n for n in range(10) if n % 2 == 0]
print(evens)  # [0, 2, 4, 6, 8]
```

---

### 3. Nested Loops and Generators

Multiple `for` clauses are evaluated left to right. Replacing the brackets with parentheses creates a lazy generator expression instead of a list.

```python
pairs = [(x, y) for x in (1, 2) for y in 'ab']
print(pairs)  # [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]

gen = (n * n for n in range(3))
print(sum(gen))  # 5
```

---

## ⚠️ Gotchas & Pro Tips

1. **Comprehension variables do not leak** — In Python 3, the loop variable inside a comprehension stays local to it, unlike the variable of a plain `for` loop.
2. **Use a generator for large streams** — A generator expression saves memory by producing values one at a time; use a list only when you need indexing or reuse.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
