# 📖 Lesson: nonlocal Keyword

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0084. nonlocal Keyword.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

When a nested function needs to change a variable owned by an *enclosing* function, `global` is not enough — that is what `nonlocal` does. This lesson explains the rule, contrasts it with `global`, and builds stateful closures such as counters and accumulators.

---

## 📝 Key Concepts

### 1. The Problem: Reading Works, Rebinding Doesn't

An inner function can read an enclosing variable through LEGB lookup. But assigning to that name creates a *new local* in the inner function, leaving the outer value unchanged and often raising `UnboundLocalError` if you read before assigning.

```python
def outer():
    count = 0

    def inner():
        count += 1      # UnboundLocalError: count is local here
        return count

    return inner()
```

---

### 2. `nonlocal` Rebinds the Nearest Enclosing Name

Declaring `nonlocal count` inside the inner function tells Python to use the nearest enclosing function's `count`. The name must already exist in an enclosing *function* scope; it cannot be a global (use `global` for that) and cannot be created by `nonlocal` itself.

```python
def make_counter():
    count = 0

    def next_value():
        nonlocal count
        count += 1
        return count

    return next_value

counter = make_counter()
print(counter(), counter(), counter())   # 1 2 3
```

---

### 3. Closures as Small State Machines

A returned inner function with `nonlocal` state acts like a tiny object: each call to the factory creates an independent hidden counter. This is useful for generators of IDs, running totals, or toggles without defining a full class.

```python
def make_toggle(initial=True):
    state = initial

    def toggle():
        nonlocal state
        state = not state
        return state

    return toggle

flip = make_toggle()
print(flip(), flip(), flip())   # False True False
```

---

## ⚠️ Gotchas & Pro Tips

1. **`nonlocal` searches function scopes only** — It skips the global scope entirely. `nonlocal x` with no matching enclosing variable raises `NameError` at definition time.
2. **Each factory call creates independent state** — Two counters from `make_counter()` do not share their `count`; each closure owns its own cell.
3. **A class is often clearer for complex state** — If several functions need to mutate the same state, a class with methods and `self.value` is usually easier to follow than deeply nested `nonlocal` declarations.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
