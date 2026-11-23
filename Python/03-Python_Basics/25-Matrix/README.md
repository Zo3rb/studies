# 📖 Lesson: Matrix

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0035. Matrix.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

A matrix is modeled as a list of lists, where each inner list is a row.
The lesson uses `matrix[row][column]` to read and change individual elements.
A simple black-and-white image represented by zeros and ones shows how pixel-level computation works.
You also see how to build grids without accidentally sharing row objects.

---

## 📝 Key Concepts

### 1. Rows, Columns, and Nested Indexes

In `matrix[row][col]`, the first index selects a row and the second selects an item inside that row.
Dimensions are `len(matrix)` rows and `len(matrix[0])` columns for a rectangular matrix.

```python
matrix = [
    [1, 0, 1],
    [0, 1, 0],
]
print("rows:", len(matrix), "cols:", len(matrix[0]))
print("matrix[0][2]:", matrix[0][2])
print("matrix[1][0]:", matrix[1][0])
```

---

### 2. Building a Grid Safely

A list comprehension creates a fresh inner list for every row.
Multiplying a row (`[[0] * 3] * 2`) repeats the same reference, so changing one row changes all of them.

```python
grid = [[0 for _ in range(3)] for _ in range(2)]
grid[0][1] = 1
print(grid)

bad = [[0] * 3] * 2
bad[0][1] = 1
print(bad)
```

---

### 3. Pixel-Style Operations

Treat 0 as black and 1 as white, then iterate with `enumerate` to count lit pixels or flip a value.
These small operations are the foundation of image processing and numeric grid work.

```python
image = [[0, 1, 0], [1, 1, 0]]
lit = sum(pixel for row in image for pixel in row)
image[0][0] = 1 - image[0][0]  # flip a pixel
print("lit before flip:", lit)
print("image:", image)
```

---

## ⚠️ Gotchas & Pro Tips

1. **The shared-row trap** — `[[0] * n] * m` creates `m` references to one row; always use a comprehension for independent rows.
2. **Index order matters** — `matrix[row][col]` is not the same as `matrix[col][row]` unless the matrix is square and symmetric.
3. **Ragged lists are legal** — Rows may have different lengths; `len(matrix[0])` then does not describe every row.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
