# 📖 Lesson: While Loops 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0066. While Loops 2.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This second `while` lesson goes deeper: nested loops, boolean flags that control when a loop stops, and the common pattern of repeatedly asking for input until a valid value arrives. Here the practice simulates incoming values so every script stays deterministic and needs no keyboard input.

---

## 📝 Key Concepts

### 1. Flags for Loop Control

A boolean flag (often named `running` or `found`) records whether the loop should keep going. Setting the flag to `False` in the body stops the loop at the next condition check — useful when the exit depends on a decision made deep inside the body.

```python
running = True
attempts = 0
while running:
    attempts += 1
    if attempts == 4:
        running = False
print(f"Stopped after {attempts} passes")
```

---

### 2. Nested `while` Loops

An inner `while` restarts for every pass of the outer loop. Be sure each loop has its *own* counter and that the inner loop can terminate. Nested loops are useful for row/column work and for comparing each element of one collection against another.

```python
row = 1
while row <= 3:
    column = 1
    while column <= 3:
        print(f"{row * column:>2}", end=" ")
        column += 1
    print()
    row += 1
```

---

### 3. Simulating a Read-Validate-Repeat Cycle

The 'ask until valid' pattern normally uses `input()`. To keep practice scripts non-interactive, we feed a predefined list of answers through `next()`. The loop structure is identical: keep asking while the current answer is invalid.

```python
answers = iter(["nope", "42", "7"])
answer = next(answers)
while not answer.isdigit():
    print(f"  rejecting {answer!r}")
    answer = next(answers)
print(f"Accepted numeric answer: {answer}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Reset the inner counter in the outer loop** — Forgetting `column = 1` before the inner loop means the inner loop runs only on the first outer pass. Each loop needs independent state.
2. **Avoid duplicate exit logic** — Choose either a `while True` + `break` or a `while flag` + flag update. Mixing both styles in one loop makes it hard to see why it stopped.
3. **Guard simulated input against exhaustion** — When using a predefined iterator, always supply a final valid value; otherwise `next()` will raise `StopIteration` and the script will fail.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
