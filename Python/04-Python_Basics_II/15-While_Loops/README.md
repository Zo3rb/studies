# 📖 Lesson: While Loops

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0065. While Loops.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

A `while` loop repeats as long as a condition remains true, which makes it ideal when you do not know in advance how many passes you need. This lesson covers the loop structure, the requirement to change state inside the body, and the danger of accidental infinite loops.

---

## 📝 Key Concepts

### 1. Condition-Controlled Repetition

Python evaluates the `while` condition before each pass. If it is truthy, the indented body runs; then the condition is checked again. Unlike a `for` loop, there is no built-in iterator — you manage the state yourself.

```python
countdown = 3
while countdown > 0:
    print(countdown)
    countdown -= 1
print("Liftoff!")
```

---

### 2. State Must Change

Every `while` loop must do something inside its body that eventually makes the condition false. Typically that means incrementing/decrementing a counter, consuming an item from a collection, or updating a flag. Without that change the loop never stops.

```python
total = 0
number = 1
while total < 20:
    total += number
    number += 1
print(f"Reached {total} after adding up to {number - 1}")
```

---

### 3. `while` vs `for`

Use `for` when you know the collection or number of iterations in advance. Use `while` when the stopping point depends on a condition discovered during the loop (a simulation, retry logic, or reading until a sentinel). A `while True:` loop with an explicit `break` is a common pattern.

```python
attempts = 0
while True:
    attempts += 1
    success = attempts >= 3   # simulated success on the third try
    if success:
        break
print(f"Succeeded after {attempts} attempts")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Infinite loops are silent, not errors** — A `while True` with no reachable `break` will hang the program. Stop it with `Ctrl+C` in the terminal, then inspect how the condition changes.
2. **Use a safety counter while learning** — Adding `iterations += 1` and a guard such as `if iterations > 1000: break` prevents a runaway script during experiments.
3. **`while` has an optional `else`** — The `else` clause runs when the loop finishes because the condition became false, but not when it ends with `break`. It is useful for 'search succeeded/failed' logic.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
