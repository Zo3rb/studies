# 📝 Quiz — Module 04: Python Basics II

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Conditionals, Truthiness & Identity (Lessons 01 – 09)

**Q1.** Explain how an `if` / `elif` / `else` chain differs from two independent `if` statements. Write a small chain that assigns a letter grade from a numeric score, and state why branch order matters.

> **My Answer:**

---

**Q2.** How does Python use indentation to define blocks? Name two indentation errors beginners hit, state the conventional number of spaces per level, and explain why `pass` exists.

> **My Answer:**

---

**Q3.** List at least six falsey values. Why is `if value:` preferred over `if value == True:`, and why should you write `if value is None:` instead of `if value == None:`? Explain the difference between `is` and `==` in one sentence.

> **My Answer:**

---

**Q4.** Rewrite `label = "pass" if score >= 60 else "fail"` with a normal `if`. Then state how many times `work()` runs in `flag and work()` when `flag = False`, what `0 or "fallback"` evaluates to, and what `not (a or b)` equals by De Morgan's law.

> **My Answer:**

---

### Part 2: Loops, Iterables & Loop Control (Lessons 10 – 20)

**Q5.** What does `range(2, 10, 3)` produce, and why is `range` lazy? How does `enumerate(items, start=5)` improve on `for i in range(len(items))` when you need both index and value?

> **My Answer:**

---

**Q6.** Explain the difference between an iterable and an iterator. Show how `iter()` and `next()` work on a list, name the exception `next()` raises when items run out, and give three built-in iterable types.

> **My Answer:**

---

**Q7.** Describe `break`, `continue`, and `pass`. When does a loop's `else` clause run, and how can `break` prevent it from running? Explain one pitfall with `continue` inside a `while` loop.

> **My Answer:**

---

**Q8.** Give two algorithms for finding duplicates in a list — one with a `set`, one with a dict/Counter. Which preserves first-seen order, what is the time complexity of the set approach, and why must values be hashable?

> **My Answer:**

---

### Part 3: Functions, Arguments & Scope (Lessons 21 – 35)

**Q9.** What does DRY mean and how do functions support it? Explain parameter vs argument, what a function returns without an explicit `return`, and the difference between a function and a method (including what `self` is).

> **My Answer:**

---

**Q10.** Why is `def add(item, items=[])` dangerous and how do you fix it? Explain how `*args` and `**kwargs` behave in a definition versus a call, and state the required parameter order in `def f(a, *args, key=1, **kwargs)`.

> **My Answer:**

---

**Q11.** What is the walrus operator `:=`? Rewrite `n = len(data); if n > 10: print(n)` using one, explaining the parentheses. Also name three clean-code habits from the course (naming, function size, constants, or comments).

> **My Answer:**

---

**Q12.** State the LEGB rule in order. Why does assigning to a name inside a function make it local, and what error appears if you read it first? When do you need `global` versus `nonlocal`, and give two reasons scope is necessary in larger programs?

> **My Answer:**

---

## Score

`[ ] / 12 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or tricky code to revisit -->
