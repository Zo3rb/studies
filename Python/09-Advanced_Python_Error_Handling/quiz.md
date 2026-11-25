# 📝 Quiz — Module 09: Error Handling

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Errors and Basic Handling (Lessons 01 – 02)

**Q1.** What is the difference between a `SyntaxError` and a runtime exception? Can a `try` block in the same file catch a syntax error, and why or why not?

> **My Answer:**

---

**Q2.** Draw the top of Python's exception hierarchy: where do `BaseException`, `Exception`, `KeyboardInterrupt`, and `SystemExit` sit? Why should normal application code catch `Exception` (or a narrower type) instead of `BaseException`?

> **My Answer:**

---

**Q3.** Name a situation that raises each of these: `ValueError`, `TypeError`, `KeyError`, `IndexError`, `ZeroDivisionError`, and `FileNotFoundError`. Which of these would `dict.get(key, default)` avoid?

> **My Answer:**

---

**Q4.** Describe the roles of `try` and `except`, including what happens to the remaining statements in the `try` body after an exception. Why must more specific handlers come before broader ones, and what does `except SomeError as exc:` give you?

> **My Answer:**

---

### Part 2: `else`, `finally`, `raise` and Exercises (Lessons 03 – 04)

**Q5.** When does an `else` clause run, and how is it different from putting the same code at the end of the `try` block? When does `finally` run, and can its code override a value returned from `try`?

> **My Answer:**

---

**Q6.** You validate an amount and decide it is invalid. Show how to raise a `ValueError` with a helpful message, and explain what a bare `raise` inside an `except` block does. Why is re-raising better than `except SomeError: pass`?

> **My Answer:**

---

**Q7.** Define a custom exception class and explain why it should inherit from `Exception` rather than `BaseException`. What does `raise MyError("bad") from exc` add to the resulting traceback?

> **My Answer:**

---

**Q8.** Compare EAFP ("easier to ask forgiveness than permission") with LBYL ("look before you leap") for reading the first item of a list. Which approach is more idiomatic in Python, and when would you still validate explicitly at a program boundary?

> **My Answer:**

---

### Part 3: Chaining, Tracebacks and Boundaries (Lesson 05)

**Q9.** How do `raise MyError(...) from exc` and `raise MyError(...) from None` differ? Which attributes on the new exception reveal the cause, and why should you use `from None` only deliberately?

> **My Answer:**

---

**Q10.** Where in a program should exceptions usually be handled, and what should a handler do if it cannot repair the problem? How can the `traceback` module help you inspect a caught exception, and why do you read a traceback from the bottom up?

> **My Answer:**

---

## Score

`[ ] / 10 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or concepts to revisit -->
