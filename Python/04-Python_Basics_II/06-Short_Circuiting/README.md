# 📖 Lesson: Short Circuiting

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0056. Short Circuiting.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Python's `and` and `or` operators do not always evaluate both sides: they stop as soon as the answer is determined. This lesson explains the exact short-circuit rules, the value each expression returns, and how to use this behaviour to guard operations that would otherwise raise errors.

---

## 📝 Key Concepts

### 1. How `and` and `or` Short-Circuit

`a and b` evaluates `b` only if `a` is truthy; otherwise it returns `a` immediately. `a or b` evaluates `b` only if `a` is falsey; otherwise it returns `a`. This left-to-right lazy behaviour is guaranteed by the language.

```python
def check(label):
    print(f"  evaluated {label}")
    return True

print("and with a false first operand:")
result = False and check("second")
print("  result:", result)

print("or with a true first operand:")
result = True or check("second")
print("  result:", result)
```

---

### 2. Operands, Not Booleans

Despite being called logical operators, `and` and `or` return one of their *operands*, not necessarily `True`/`False`. `0 or 'fallback'` returns the string, and `1 and 2` returns `2`. `not`, by contrast, always returns a real Boolean.

```python
print(0 or "fallback")          # 'fallback'
print("" or "default")           # 'default'
print(1 and 2)                  # 2
print(not [])                   # True (always a bool)
```

---

### 3. Guarding Risky Operations

Put the cheapest, safest test first to prevent errors in later operands. Classic examples are checking that a divisor is non-zero before dividing, and checking an index exists before using it. This often replaces a nested `if` with one clear line.

```python
numbers = [10, 20, 30]
index = 5

# Safe: the second operand is never evaluated when index is out of range.
value = 0 <= index < len(numbers) and numbers[index] > 15
print(f"index {index}: {value}")

divisor = 0
result = divisor != 0 and 100 / divisor > 1
print(f"division checked safely: {result}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Order matters for cost and safety** — In `a and b`, put the fast or protective check on the left. In `a or b`, put the most likely successful/cheap option first. Side effects in the right operand may never happen.
2. **Do not rely on truthiness when you need a Boolean** — If a value must be exactly `True` or `False` (for example, in a JSON payload), wrap the expression in `bool(...)`. `1 and 2` yields `2`, not `True`.
3. **`and` binds tighter than `or`** — `a or b and c` means `a or (b and c)`. Add parentheses to make mixed expressions self-documenting.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
