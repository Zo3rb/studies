# 📖 Lesson: For Loops

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0060. For Loops.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

The `for` loop lets you repeat a block once per item in a collection. This lesson covers the `for item in iterable:` syntax, how the loop variable is rebound each pass, how accumulators collect results across iterations, and how nested loops handle grids and combinations.

---

## 📝 Key Concepts

### 1. The `for ... in ...` Syntax

The loop header names a target variable and an iterable. On each pass Python fetches the next element from the iterable, assigns it to the target, and runs the indented body. The loop ends automatically when the iterable is exhausted; you do not manage an index yourself.

```python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(f"I like {fruit}")

print("Loop finished; loop variable still holds:", fruit)
```

---

### 2. Accumulators and Counters

A variable initialized *before* the loop can be updated each pass to produce a total, count, or combined string. This 'initialize, update, return' pattern is one of the most common shapes in programming.

```python
numbers = [3, 5, 8]
total = 0
count = 0
for number in numbers:
    total += number
    count += 1
print(f"total={total}, count={count}, average={total / count:.2f}")
```

---

### 3. Nested Loops

A loop inside another loop runs its full cycle for every outer iteration. Use nested loops for tables, pairs, grids, or processing a list of lists. Remember that the inner loop variable changes fastest.

```python
for row in range(1, 4):
    for column in range(1, 4):
        print(f"{row * column:>3}", end=" ")
    print()  # newline after each row
```

---

## ⚠️ Gotchas & Pro Tips

1. **The loop variable survives the loop** — Python does not create a new scope for a `for` loop; after the loop the target variable still refers to the last item. Do not rely on that detail for program logic.
2. **Do not modify a list while iterating over it** — Removing or inserting items during iteration skips elements or produces surprising results. Iterate over a copy (`for item in items[:]`) or build a new list instead.
3. **Use an accumulator for strings too** — `result += item` works for strings, but heavy concatenation inside a large loop is inefficient; collect pieces in a list and use `''.join(pieces)` for bigger jobs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
