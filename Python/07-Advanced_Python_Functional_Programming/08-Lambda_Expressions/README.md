# 📖 Lesson: Lambda Expressions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0124. Lambda Expressions.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

The syntax and purpose of anonymous `lambda` functions in Python. Where short lambdas are idiomatic, what restrictions apply to their bodies, and why a named `def` is usually better for anything beyond a one-line expression.

---

## 📝 Key Concepts

### 1. Anonymous Function Syntax

`lambda parameters: expression` creates a function object without giving it a name. The expression is evaluated and returned automatically.

```python
double = lambda x: x * 2
print(double(7))  # 14
```

---

### 2. Lambdas as Arguments

Lambdas shine when a function needs small custom behavior for one call, such as a `key` function for sorting.

```python
words = ['pear', 'apple', 'fig']
print(sorted(words, key=lambda w: len(w)))  # ['fig', 'pear', 'apple']
```

---

### 3. Restrictions and Conditional Expressions

A lambda body must be a single expression: no statements such as `if`, `for`, or `return`, though conditional expressions are allowed. Annotations are not allowed either.

```python
grade = lambda score: 'pass' if score >= 60 else 'fail'
print(grade(75))  # pass
```

---

## ⚠️ Gotchas & Pro Tips

1. **Do not assign a lambda to a name** — `f = lambda x: ...` defeats the point of anonymity and gives worse tracebacks than `def f(x): ...`.
2. **Beware of late binding in closures** — A lambda capturing a loop variable sees its final value; bind it with a default argument such as `lambda x, i=i: i`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
