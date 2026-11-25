# 📖 Lesson: Exercise - Lambda Expressions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0125. Exercise - Lambda Expressions.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

Hands-on practice with lambdas: writing key functions for sorting, pairing lambdas with `map` and `filter`, and supplying multiple arguments. Emphasis on choosing readable expressions and avoiding common closure pitfalls.

---

## 📝 Key Concepts

### 1. Sorting with `key`

A lambda lets you sort by a derived value without defining a full function, including descending order via `reverse=True` or by negating a numeric key.

```python
students = [('Ana', 88), ('Ben', 92), ('Cy', 75)]
print(sorted(students, key=lambda s: s[1]))  # by score
```

---

### 2. Lambdas with `map` and `filter`

Short transformations and predicates are the classic use case, especially when the operation is obvious at a glance.

```python
values = [1, 2, 3, 4, 5]
print(list(map(lambda n: n ** 2, filter(lambda n: n % 2, values))))
# [1, 9, 25]
```

---

### 3. Multi-Argument and Captured Values

Lambdas accept multiple parameters and can capture surrounding variables. Default arguments freeze a value at creation time instead of looking it up later.

```python
funcs = [lambda x, n=n: x + n for n in (1, 2, 3)]
print([f(10) for f in funcs])  # [11, 12, 13]
```

---

## ⚠️ Gotchas & Pro Tips

1. **Keep it short** — If a lambda grows past one clear expression, rewrite it as a named function with a descriptive name.
2. **Freeze loop captures** — Without the `n=n` default above, all three lambdas would see the final loop value `3`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
