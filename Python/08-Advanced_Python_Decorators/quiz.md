# 📝 Quiz — Module 08: Decorators

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: First-Class Functions and Higher-Order Functions (Lessons 01 – 02)

**Q1.** What does it mean that functions are first-class objects in Python? Name three things you can do with a function that you can also do with an integer or string.

> **My Answer:**

---

**Q2.** Rewrite `greet = shout(greet)` using `@` syntax. When is the decorator applied — when the module is loaded or when the function is called — and what does the name `greet` refer to afterwards?

> **My Answer:**

---

**Q3.** Define a higher-order function. How do `sorted(..., key=...)`, `map`, and `filter` fit that definition, and why might `list(map(...))` be needed when printing a result?

> **My Answer:**

---

**Q4.** What is a closure? In `make_multiplier(factor)`, why can the returned function still use `factor` after the outer call ends? What goes wrong when functions created in a loop capture the loop variable, and how does a default argument such as `lambda n=n: n` fix it?

> **My Answer:**

---

### Part 2: Writing Decorators (Lessons 03 – 04)

**Q5.** A wrapper is named `wrapper`, so `decorated.__name__` reports `"wrapper"`. What does `@wraps(func)` from `functools` fix, and what extra attribute does it set so you can reach the original function?

> **My Answer:**

---

**Q6.** Why does a decorator that accepts its own arguments need three nested functions? Expand `@repeat(3)` into an equivalent explicit assignment and explain which inner function actually receives the decorated function.

> **My Answer:**

---

**Q7.** Given `@a` written above `@b` above `def f(): ...`, write the equivalent assignment. In what order are `a` and `b` applied, and in what order do their wrappers run when `f()` is called?

> **My Answer:**

---

### Part 3: Why Decorators Matter (Lesson 05)

**Q8.** Name four cross-cutting concerns that decorators handle well. Explain how a decorator can add timing or authorization without editing a function's body, and why `@lru_cache` can be both helpful and surprising. Give one case where a plain helper function would be clearer than a decorator.

> **My Answer:**

---

## Score

`[ ] / 8 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or concepts to revisit -->
