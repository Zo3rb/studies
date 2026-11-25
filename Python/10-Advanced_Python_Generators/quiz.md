# 📝 Quiz — Module 10: Generators

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Generators and `yield` (Lessons 01 – 02)

**Q1.** What is the difference between a generator function and a generator object? What actually happens when you call a function that contains `yield`?

> **My Answer:**

---

**Q2.** Distinguish an iterable, an iterator and a generator. Is every generator an iterator? Is every iterator a generator? Give one example of each category.

> **My Answer:**

---

**Q3.** Write a generator that yields the squares of `0` through `4`. Show how to get the first value with `next()`, how a `for` loop consumes the rest, and what happens if you call `next()` once more after the generator is exhausted.

> **My Answer:**

---

**Q4.** Compare a list comprehension `[n * 2 for n in values]` with a generator expression `(n * 2 for n in values)`. When is each value computed, what object is returned, and how does `yield from` differ from writing `for item in source: yield item`?

> **My Answer:**

---

### Part 2: Performance and Internals (Lessons 03 – 04)

**Q5.** Why can a generator use much less memory than a list of the same values? Why is it not automatically faster, and when can it still finish sooner than a list-based approach?

> **My Answer:**

---

**Q6.** What does `gen.gi_frame` reveal before and after the first `next()`? Which fields of the frame help explain how local variables survive between yields, and what happens to `gi_frame` when the generator is closed?

> **My Answer:**

---

**Q7.** Explain the roles of `send()`, `throw()` and `close()`. Why must the first `send()` use `None`, what exception does `close()` raise at the suspension point, and what happens if you try to yield again after catching `GeneratorExit`?

> **My Answer:**

---

### Part 3: Fibonacci Practice (Lesson 05)

**Q8.** Write an infinite `fibonacci()` generator that yields `0, 1, 1, 2, 3, 5, ...`. Why is the simultaneous assignment `a, b = b, a + b` important?

> **My Answer:**

---

**Q9.** How would you get exactly the first eight Fibonacci numbers from an infinite generator? Show two different approaches, and explain why `list(fibonacci())` is a mistake.

> **My Answer:**

---

**Q10.** Your teammate wrote a recursive Fibonacci function that recomputes earlier values many times. How does an iterative generator avoid that cost, and how could you use `itertools.islice` or `itertools.takewhile` to select a bounded portion of the sequence?

> **My Answer:**

---

## Score

`[ ] / 10 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or concepts to revisit -->
