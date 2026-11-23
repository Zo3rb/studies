# 📖 Lesson: Ternary Operator

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0055. Ternary Operator.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

The ternary operator (officially the *conditional expression*) lets you choose a value in a single line: `A if condition else B`. This lesson covers its exact syntax, when it improves readability, and how it can replace small `if`/`else` blocks that only assign a value.

---

## 📝 Key Concepts

### 1. Syntax and Evaluation Order

The form is `<true-value> if <condition> else <false-value>`. Python evaluates the condition first, then **only one** of the two value expressions. It never evaluates both branches, so expensive or unsafe work can be placed in the branch that may not run.

```python
score = 73
result = "pass" if score >= 60 else "fail"
print(f"Score {score}: {result}")

# Equivalent full statement:
if score >= 60:
    result2 = "pass"
else:
    result2 = "fail"
assert result == result2
```

---

### 2. Where a Conditional Expression Shines

Use it for a simple value choice: labels, default strings, small calculations, formatting inside an f-string, or filtering values in a comprehension. It is an *expression*, so it can appear anywhere a value is allowed — including function arguments and assignments.

```python
price = 120
final = price * 0.9 if price > 100 else price
message = f"You save {price - final:.0f}" if final < price else "No discount"

names = ["Ada", "", "Grace"]
cleaned = [name if name else "unknown" for name in names]
print(final, message, cleaned)
```

---

### 3. Readability Limits

A conditional expression should fit comfortably on one line. Chaining several of them (`a if c1 else b if c2 else d`) or nesting them inside one another quickly becomes harder to read than an `elif` chain. Prefer a regular `if` when the branches contain multiple statements or side effects.

```python
# Prefer an elif chain for multi-way decisions:
def grade(score):
    if score >= 90:
        return "A"
    if score >= 80:
        return "B"
    return "C"

print(grade(84))
```

---

## ⚠️ Gotchas & Pro Tips

1. **The word order is unusual** — English says 'if condition then A else B'; Python writes `A if condition else B`. Read it out loud as 'A when the condition holds, otherwise B' until it feels natural.
2. **Parentheses help in larger expressions** — `x = (a if flag else b) + offset` is clearer than relying on precedence rules. Add parentheses whenever the conditional expression is one part of a bigger calculation.
3. **Only one branch is evaluated** — Like `if` statements, the ternary operator is lazy: `safe if ok else risky()` will not call `risky()` when `ok` is truthy. This is useful for guarding operations such as division by zero.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
