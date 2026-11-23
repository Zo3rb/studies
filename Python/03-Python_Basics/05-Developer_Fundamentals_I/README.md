# 📖 Lesson: Developer Fundamentals I

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0015. DEVELOPER FUNDAMENTALS - I.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This short mindset lesson explains the 80/20 rule: a small set of Python concepts covers most day-to-day work.
The advice is to learn by using Python rather than memorizing every syntax detail or built-in function.
Googling and consulting documentation are presented as normal developer tools, not as cheating.
The takeaway is to focus on fundamentals and reinforce them through repeated, deliberate practice.

---

## 📝 Key Concepts

### 1. Focus on the 80% You Actually Use

A handful of ideas appears constantly: values and types, variables, operators, strings, collections, conditions, loops, and functions.
Mastering those deeply beats memorizing obscure built-ins you may never need.
When a task needs a niche tool, learn it in context.

| High-value fundamental | Why it recurs |
| :--- | :--- |
| Types and `type()` | Every value and error message involves them |
| Collections | Most programs store and transform groups of data |
| Operators and expressions | Calculations and decisions are built from them |

```python
# Small, focused experiments beat passive re-reading.
values = [1, 2, 3]
total = 0
for value in values:
    total += value
print(total)  # 6 - types, collections, assignment, operators in one place
```

---

### 2. Learn by Using, Look Up When Stuck

The REPL and scratch scripts let you test assumptions in seconds.
Read the error message, search the exact wording, and verify the fix in your own code.
Understanding a looked-up solution is what turns it into knowledge.

```python
# Predict -> run -> compare -> explain.
expression = "3 * (2 + 4)"
prediction = 18
actual = 3 * (2 + 4)
print(expression, "prediction:", prediction, "actual:", actual)
print("match:", prediction == actual)
```

---

### 3. Build a Repeatable Feedback Loop

A simple loop makes practice efficient: predict the result, run the code, compare, then explain any mismatch.
Keep a personal cheat sheet of syntax you look up often; over time you will need it less.

```python
checklist = {
    "predict": True,
    "run": True,
    "compare": True,
    "explain mismatch": True,
}
for step, done in checklist.items():
    print(f"[{'x' if done else ' '}] {step}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Googling is a skill** — Knowing how to search error messages and read docs is a core developer competency, not a shortcut.
2. **Avoid tutorial hell** — Passively watching many lessons without writing code feels productive but builds little recall.
3. **Don't memorize everything** — Understand concepts and know where to look things up; syntax details solidify through use.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
