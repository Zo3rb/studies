# 📖 Lesson: Logical Operators

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0057. Logical Operators.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This lesson consolidates `and`, `or`, and `not` as the tools for composing conditions. You will read full truth tables, learn the precedence hierarchy (`not` > `and` > `or`), and use De Morgan's laws to rewrite negative conditions into clearer positive ones.

---

## 📝 Key Concepts

### 1. The Three Operators and Their Truth Tables

`and` is true only when both operands are truthy; `or` is true when at least one is truthy; `not` flips truthiness. Remember that `and`/`or` return operands while `not` always returns a Boolean.

| a | b | `a and b` | `a or b` | `not a` |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | True |
| 0 | 1 | 0 | 1 | True |
| 1 | 0 | 0 | 1 | False |
| 1 | 1 | 1 | 1 | False |

```python
print(True and False)  # False
print(True or False)   # True
print(not True)        # False
```

---

### 2. Precedence and Parentheses

Python evaluates `not` first, then `and`, then `or`, and comparisons before all of them. `not age < 18` therefore means `not (age < 18)`. Parentheses do not cost anything at runtime and remove ambiguity for readers.

```python
age = 20
has_id = True

allowed = (age >= 18) and (has_id or age > 21)
denied = not allowed
print(f"allowed={allowed}, denied={denied}")
```

---

### 3. De Morgan's Laws

`not (A and B)` is equivalent to `(not A) or (not B)`, and `not (A or B)` is equivalent to `(not A) and (not B)`. These rewrites turn awkward negative guards into positive conditions that mirror how we describe rules in plain language.

```python
is_weekend = True
is_holiday = False

# Equivalent formulations:
a = not (is_weekend or is_holiday)
b = (not is_weekend) and (not is_holiday)
assert a == b
print(f"a regular workday? {a}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`not` has lower precedence than comparisons** — `not x == 3` means `not (x == 3)`, i.e. `x != 3`. Writing the parentheses explicitly avoids confusion.
2. **Chained operators can be misleading** — `True or False and False` is `True` because `and` binds tighter. In real code, spell out groups with parentheses rather than making readers parse precedence tables.
3. **Avoid double negatives** — `if not denied:` is harder to parse than `if allowed:`. Name your Boolean variables in the positive form.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
