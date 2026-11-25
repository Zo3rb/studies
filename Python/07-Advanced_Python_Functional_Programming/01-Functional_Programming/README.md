# 📖 Lesson: Functional Programming

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0117. Functional Programming.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

An introduction to functional programming as a way of solving problems by composing functions. How Python supports this style with first-class functions and built-in tools such as `map`, `filter`, and `reduce`. When a functional approach makes code shorter and clearer, and when an imperative loop is a better fit.

---

## 📝 Key Concepts

### 1. Functions as Values

In Python a function is an object like any other: you can store it in a variable, pass it to another function, and return it from a function. This makes higher-order functions possible.

```python
def double(x):
    return 2 * x

f = double
print(f(5))  # 10
```

---

### 2. Transforming Data Pipelines

Functional style describes what should be computed rather than step-by-step how to mutate state. A pipeline applies a series of transformations to data, for example filtering values and then squaring them.

```python
numbers = [1, 2, 3, 4, 5]
result = [n * 2 for n in numbers if n % 2 == 1]
print(result)  # [2, 6, 10]
```

---

### 3. Python Is Multi-Paradigm

Python does not force a single style. It lets you mix functional expressions with objects and loops, choosing the clearest tool for each part of a program.

```python
def apply(func, values):
    return [func(value) for value in values]

print(apply(str.upper, ['a', 'b']))  # ['A', 'B']
```

---

## ⚠️ Gotchas & Pro Tips

1. **Higher-order functions accept functions** — A function that takes another function as an argument, such as `sorted(key=...)`, is called higher-order.
2. **Prefer clarity over dogma** — A short comprehension often beats a loop, but a deeply nested expression is harder to read than explicit steps.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
