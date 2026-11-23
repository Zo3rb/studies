# 📝 Quiz — Module 03: Python Basics

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Numbers, Operators & Strings (Lessons 01 – 16)

**Q1.** Explain the difference between `int` and `float`. What do `7 / 2`, `7 // 2`, and `-7 // 2` return, and why is the last one not `-3`?

> **My Answer:**

---

**Q2.** Evaluate `2 + 3 ** 2 * 4` step by step using Python's precedence rules. Then explain why `-2 ** 2` evaluates to `-4` and how you would write `4` using parentheses.

> **My Answer:**

---

**Q3.** What does `bin(10)` return — a number or a string? How do you convert `"1010"` back to the integer `10`? Write a `complex` literal with real part 3 and imaginary part 4, and name its attributes.

> **My Answer:**

---

**Q4.** Why does `"Age: " + 36` raise a `TypeError`? Give two different fixes. Then explain what `"line 1\nline 2"` prints and what a raw string `r"C:\Users"` does with backslashes.

> **My Answer:**

---

### Part 2: Lists & Dictionaries (Lessons 23 – 29, 32 – 36)

**Q5.** Given `a = [1, 2, 3]`, explain the difference between `b = a` and `c = a[:]`. Which one is a shallow copy, and why does changing `c[0]` not affect `a` while changing `b[0]` does? What caveat remains if `a` contains nested lists?

> **My Answer:**

---

**Q6.** What is the difference between `append()` and `extend()`? What do `pop()` and `remove()` return, and what happens when `remove()` is given a value that is not in the list?

> **My Answer:**

---

**Q7.** Contrast `list.sort()` with `sorted(list)`. Which mutates the original and which returns a new list? Do the same for `reverse()` versus `[::-1]`, and state what value `sort()` returns.

> **My Answer:**

---

**Q8.** Create the same dictionary three ways: a literal, `dict()` with keyword arguments, and `dict()` with a list of pairs. Then explain why `data["missing"]` is risky but `data.get("missing", 0)` is not, and what `setdefault()` adds to the picture.

> **My Answer:**

---

### Part 3: Tuples, Sets, None & Common Patterns (Lessons 17 – 22, 30 – 31, 37 – 40)

**Q9.** Unpack `numbers = [1, 2, 3, 4, 5]` with `first, *rest = numbers` and with `head, *middle, tail = numbers`. State the type and value of each new name. Why is only one starred target allowed?

> **My Answer:**

---

**Q10.** How does a tuple differ from a list? Why is `(42)` not a tuple but `(42,)` is? Can a tuple be a dictionary key, and what condition must its contents satisfy?

> **My Answer:**

---

**Q11.** Given `a = {1, 2, 3}` and `b = {3, 4}`, give the results of `a | b`, `a & b`, `a - b`, and `a ^ b`. Explain how `discard()` differs from `remove()`, and why you should `sorted(a)` when printing a set in a deterministic script.

> **My Answer:**

---

**Q12.** Is `None` equal to `0`, `False`, or `""`? Which operator should you use to test for `None` and why? Name three falsy values, then show how you would turn `["Python", "is", "fun"]` into one string with spaces and how `range(3)` becomes `[0, 1, 2]`.

> **My Answer:**

---

## Score

`[ ] / 12 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or tricky syntax to revisit -->
