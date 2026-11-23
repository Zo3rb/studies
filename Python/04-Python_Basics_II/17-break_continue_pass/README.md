# 📖 Lesson: break, continue, pass

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0067. break, continue, pass.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Sometimes a loop needs to stop early, skip just the current pass, or simply hold a place for code you will write later. This lesson covers `break`, `continue`, and `pass`, plus the surprising `else` clause that belongs to loops in Python.

---

## 📝 Key Concepts

### 1. `break` Leaves the Loop

`break` immediately exits the innermost enclosing loop, skipping the rest of its body and its `else` clause. It is the standard way to stop a search once the answer is found, and it is often paired with `while True`.

```python
for number in range(1, 20):
    if number % 7 == 0:
        print(f"First multiple of 7: {number}")
        break
```

---

### 2. `continue` Skips This Pass

`continue` jumps straight to the next iteration: the rest of the current body is skipped, but the loop itself keeps running. Use it to filter out cases early instead of wrapping the whole body in an `if`.

```python
for number in range(1, 8):
    if number % 2 == 0:
        continue
    print(number, end=" ")
print("  # odd numbers only")
```

---

### 3. `pass` Is an Explicit No-op

`pass` does nothing at runtime. Its purpose is syntactic: Python requires a non-empty block after a colon, so `pass` is a placeholder for classes, functions, or branches you have not implemented yet. Unlike a comment, it is a real statement.

```python
class Todo:
    pass  # block intentionally empty for now

def not_yet(value):
    pass  # valid function body

for number in (1, 2):
    if number == 2:
        pass  # explicitly do nothing
    print(number)
```

---

### 4. The `else` Clause on Loops

A loop's `else` block runs after all iterations complete normally. It is **skipped by `break`**. This makes 'search, then report failure' clean: put the found/break path in the loop and the not-found message in `else`.

```python
for candidate in [2, 4, 7]:
    if candidate % 3 == 0:
        print("found divisible by 3:", candidate)
        break
else:
    print("no divisible-by-3 value found")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`break` affects only the innermost loop** — Inside nested loops, `break` exits the inner loop only. Use a flag or a helper function if you need to leave several levels.
2. **`continue` still runs loop bookkeeping** — In a `while` loop, make sure the state update happens **before** any `continue`; otherwise the condition never changes and the loop runs forever.
3. **Loop `else` is not the same as `if/else`** — It runs when the loop was not interrupted. If you find yourself confused, a simple flag (`found = True`) followed by `if not found:` is equally clear.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
