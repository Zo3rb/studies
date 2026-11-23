# 📖 Lesson: Expressions vs Statements

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0019. Expressions vs Statements.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This brief lesson draws the line between expressions and statements.
An expression such as `100 / 5` evaluates to a value; a statement such as `x = 20` performs an action.
You can embed expressions inside assignments, print calls, and formatted strings.
The distinction explains why the REPL echoes some lines but not others.

---

## 📝 Key Concepts

### 1. Expressions Evaluate to a Value

An expression is a combination of values, variables, operators, and calls that produces a result.
`2 + 3`, `len("abc")`, and a bare variable name are all expressions.
You can use that result immediately or store it.

```python
result = 100 / 5        # the expression 100 / 5 evaluates to 20.0
print(2 + 3 * 4)        # expression inside a call
print(len("Python"))    # function call expression
```

---

### 2. Statements Perform an Action

A statement is a complete instruction: assignment, `import`, `print()`, `return`, or `pass`.
Some statements contain expressions, but the statement itself is about doing something rather than yielding a value you can pass around.

```python
import math                 # import statement
radius = 5                  # assignment statement
area = math.pi * radius ** 2
print(area)                 # expression statement (calls print)
```

---

### 3. Expression Statements in Scripts vs REPL

A bare expression written on a line in a script is an expression statement: Python evaluates it, then discards the value.
In the REPL, the interpreter displays that discarded value for you.
`print()` is a call expression whose return value is `None`.

```python
value = 7
value + 1       # in a script: computed, then discarded (no output)
print(value)    # 7 - explicit output is required
print(print("hi"))  # prints hi, then None
```

---

## ⚠️ Gotchas & Pro Tips

1. **Assignments are not expressions** — Unlike some languages, `y = (x = 3)` is a syntax error in Python; assignment is a statement.
2. **`print()` returns `None`** — Do not assign `result = print(...)` expecting the printed text; capture the string before printing.
3. **No output does not mean no work** — A bare expression in a script still runs; it simply does not display anything.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
