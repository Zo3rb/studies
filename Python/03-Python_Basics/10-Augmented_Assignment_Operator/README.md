# 📖 Lesson: Augmented Assignment Operator

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0020. Augmented Assignment Operator.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

The lesson introduces shorthand operators for updating a variable with a calculation.
`x = x + 2` becomes `x += 2`, and the same pattern works for other arithmetic operators.
Examples show a value starting at 5 and being turned into 7 with `+=`.
You also see which operators exist for division, floor division, modulo, and powers.

---

## 📝 Key Concepts

### 1. The `x = x + n` Pattern

An augmented assignment combines an operation with reassignment. It is shorter and usually clearer.
The left operand must already exist because Python still needs to read it before rebinding.

| Long form | Short form | Meaning |
| :--- | :--- | :--- |
| `x = x + 2` | `x += 2` | Add and rebind |
| `x = x - 2` | `x -= 2` | Subtract and rebind |
| `x = x * 2` | `x *= 2` | Multiply and rebind |

```python
score = 5
score += 2
print(score)  # 7
score *= 3
print(score)  # 21
```

---

### 2. The Full Numeric Set

Python provides augmented forms for every arithmetic operator. The result type still follows the operation.
`/=` always produces a float, even if the starting value was an integer.

```python
value = 20
value /= 4      # 5.0 (float)
value //= 2     # 2.0 (float floor division)
value %= 2      # 0.0
value **= 3     # 0.0
print(value, type(value).__name__)
```

---

### 3. Strings and Lists Use the Same Syntax

`+=` also works for strings (concatenation) and lists (extension). For immutable strings it rebinds a new object; for lists it mutates in place.
The two forms `items += [x]` and `items = items + [x]` differ for mutable lists.

```python
text = "Hi"
text += "!"
items = [1]
alias = items
items += [2]      # mutates the shared list
print(text, items, alias)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Initialize first** — `count += 1` raises `NameError` if `count` was never defined. Start with `count = 0`.
2. **No `++` or `--`** — Python does not have C-style increment/decrement operators; use `+= 1` and `-= 1`.
3. **`+=` can change type** — `x /= 2` turns an `int` into a `float`; be mindful if a later step requires an integer.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
