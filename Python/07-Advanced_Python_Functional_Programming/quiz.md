# 📝 Quiz — Module 07: Functional Programming

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Functional Style, Purity, `map`, `filter`, `zip` & `reduce` (Lessons 01 – 07)

**Q1.** What does it mean for functions to be first-class values in Python? Give one example of a higher-order function from the standard library.

> **My Answer:**

---

**Q2.** Define a pure function. Why are mutating an argument, calling `print`, and reading `datetime.now()` considered side effects or hidden dependencies?

> **My Answer:**

---

**Q3.** You write `result = map(str.upper, words)`. What is the type of `result`, and why does printing `result` not show the transformed words? How would you get a list?

> **My Answer:**

---

**Q4.** How does `filter` decide which items to keep? What does `filter(None, values)` do, and which values does it discard?

> **My Answer:**

---

**Q5.** What does `zip(names, scores)` yield, and what happens when the two iterables have different lengths? How do you detect a mismatch in Python 3.10+?

> **My Answer:**

---

**Q6.** Explain what `functools.reduce(func, items, initializer)` computes. What happens when `items` is empty with and without an initializer, and which built-ins are usually clearer than `reduce`?

> **My Answer:**

---

### Part 2: Lambda Expressions and Practice (Lessons 08 – 09)

**Q7.** Write the general syntax of a lambda expression. What restriction applies to its body, and why is `f = lambda x: x * 2` usually discouraged in favor of `def f(x): return x * 2`?

> **My Answer:**

---

**Q8.** Why are lambdas commonly passed as the `key` argument to `sorted`? Write a lambda that sorts a list of `(name, age)` tuples by age.

> **My Answer:**

---

**Q9.** This code produces the same lambda three times: `funcs = [lambda x: x + n for n in (1, 2, 3)]`. What does `[f(10) for f in funcs]` return, and how would you change the lambda so the result is `[11, 12, 13]`?

> **My Answer:**

---

### Part 3: Comprehensions & Learning Mindset (Lessons 10 – 13)

**Q10.** Translate this comprehension into an explicit `for` loop: `[n * n for n in range(6) if n % 2 == 0]`. When would you prefer a generator expression instead of a list comprehension?

> **My Answer:**

---

**Q11.** What is the difference between `{n for n in values}` and `{n: n * n for n in values}`? What does `{}` create, and what happens when two items produce the same dictionary key?

> **My Answer:**

---

**Q12.** Describe one habit that helps with imposter syndrome when learning programming. Why is comparing yourself with your past self more useful than comparing with other people?

> **My Answer:**

---

## Score

`[ ] / 12 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or concepts to revisit -->
