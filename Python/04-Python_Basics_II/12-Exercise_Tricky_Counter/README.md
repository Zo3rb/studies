# 📖 Lesson: Exercise - Tricky Counter

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0062. Exercise - Tricky Counter.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This exercise tests your understanding of counter variables: when to initialize them, where to increment them, and how a loop's termination condition interacts with them. You will work through off-by-one traps, count items that satisfy a condition, and track state that changes across iterations.

---

## 📝 Key Concepts

### 1. Initialize Before, Update Inside

A counter must start at the correct value before the loop begins. Count from `0` when asking 'how many?', and from `1` when the counter itself is the value to display. Updating it inside the body (rather than in the header) is what makes each pass advance the state.

```python
count = 0
for item in ["a", "b", "c", "d"]:
    count += 1
print(f"Items counted: {count}")
```

---

### 2. Off-by-One with `range`

`range(n)` produces `n` values from `0` to `n - 1`; the stop value is excluded. Use `range(1, n + 1)` when you want to display `1` through `n`. Forgetting the `+ 1` is the classic 'tricky counter' mistake.

```python
for i in range(5):
    print(i, end=" ")   # 0 1 2 3 4
print()
for i in range(1, 6):
    print(i, end=" ")   # 1 2 3 4 5
print()
```

---

### 3. Conditional and Cumulative Counting

A counter can increase only when a condition holds, or it can be part of a larger accumulator that resets when an event occurs. Always trace the first and last iteration by hand to confirm that the final value has the meaning you intended.

```python
words = ["cat", "", "dog", "bird", ""]
non_empty = 0
streak = 0
longest = 0
for word in words:
    if word:
        non_empty += 1
        streak += 1
        longest = max(longest, streak)
    else:
        streak = 0
print(f"non_empty={non_empty}, longest_streak={longest}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Trace the last iteration explicitly** — Ask: what is the counter's value when the loop stops, and is that the answer you want? A loop that counts up to `n` but stops at `n - 1` is usually an exclusive-stop mistake.
2. **Increment exactly once per logical event** — Putting `counter += 1` in both an `if` and after it double-counts the matching items. Keep a single increment point when possible.
3. **Do not use the loop variable as a count** — The loop variable holds the current *item*; a counter holds *how many times* something happened. When the iterable is not a range of integers, they have no relationship at all.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
