# 📖 Lesson: Walrus Operator

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0080. Walrus Operator.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

The walrus operator `:=` assigns a value and evaluates to that value in one expression. This lesson covers its introduction in Python 3.8, the parentheses rules, common uses in `while` loops and comprehensions, and when a plain assignment is clearer.

---

## 📝 Key Concepts

### 1. Assignment and Value in One Expression

`x := expr` assigns to `x` and produces the assigned value. Unlike a normal assignment statement, it can appear inside another expression, which removes duplicate calls to expensive functions such as `len()` or `re.match()`.

```python
data = [1, 2, 3, 4]
if (n := len(data)) > 3:
    print(f"large list: {n} items")
print(f"n after the if: {n}")
```

---

### 2. Parentheses Are Usually Required

Because `:=` has very low precedence, wrap it in parentheses inside conditions and comparisons: `while (line := next(lines, None)) is not None:`. Without parentheses, `if n := len(data) > 3` would assign a Boolean instead of the length.

```python
lines = iter(["first", "second", None])
while (line := next(lines, None)) is not None:
    print(line)
print(f"final value of line: {line}")
```

---

### 3. Use in Comprehensions — Carefully

A walrus target inside a comprehension is bound in the *containing* scope, not a private comprehension scope. It can avoid computing a value twice, but overusing it makes comprehension logic hard to follow. Prefer a normal loop when the expression gets complex.

```python
values = [y for x in range(6) if (y := x * x) > 5]
print(values)   # [9, 16, 25]
print(f"y leaked into the enclosing scope: {y}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Requires Python 3.8 or newer** — Older interpreters raise `SyntaxError`. Check `python3 --version` if a walrus expression fails unexpectedly.
2. **Assignment expressions are not assignments** — You cannot write `obj.attr := value` or `items[0] := value`; the left side must be a simple name.
3. **Readability beats cleverness** — If `n = len(data)` followed by `if n > 3:` is clearer, use it. The walrus operator shines when the value is needed *in* the condition and later in the body.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
