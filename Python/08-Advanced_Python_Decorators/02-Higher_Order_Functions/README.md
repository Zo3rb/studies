# 📖 Lesson: Higher Order Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/0131. Higher Order Functions.mp4`  
> **Module:** 08 — Advanced Python: Decorators

---

## 🎯 What This Lesson Covers

A higher-order function accepts a function as an argument, returns a function, or both. This lesson connects first-class functions to callbacks, function factories, and closures, and shows why built-ins such as `sorted`, `map`, and `filter` fit the same idea. It also explains how a returned function keeps access to enclosing variables after the outer call has finished.

---

## 📝 Key Concepts

### 1. Functions as Arguments

Because functions are values, you can pass one into another function as a callback. Python's `sorted(..., key=...)` does exactly that: it calls the key function once per item to compute a sort value.

```python
def apply(func, value):
    return func(value)

print(apply(abs, -7))  # 7
print(sorted(["Grace", "Ada", "Linus"], key=len))
# ['Ada', 'Linus', 'Grace']
```

---

### 2. Returning Functions and Closures

A function factory builds and returns another function. The returned function is a closure: it remembers variables from the factory's scope even after that scope has exited.

```python
def make_multiplier(factor):
    def multiply(value):
        return value * factor
    return multiply

double = make_multiplier(2)
print(double(21))  # 42
```

---

### 3. `map` and `filter` Are Higher-Order Built-ins

`map` applies a function to every item, and `filter` keeps items for which a predicate is true. Both return lazy iterators, so wrap them in `list(...)` when you want to see all results at once.

```python
values = [1, 2, 3, 4]
print(list(map(lambda n: n * n, values)))           # [1, 4, 9, 16]
print(list(filter(lambda n: n % 2 == 0, values)))   # [2, 4]
```

---

## ⚠️ Gotchas & Pro Tips

1. **`map` and `filter` return iterators** — they are consumed once; convert to a list if you need to inspect or reuse the values.
2. **Closures capture variables, not snapshots** — a `lambda` in a loop sees the loop's final value; bind the current value with a default argument such as `lambda n=n: n`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
