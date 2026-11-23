# 📝 Quiz — Module 06: Object-Oriented Programming

> Fill in your answers after watching the videos and running the practice scripts. Use this for revision and self-assessment.

---

## Questions

### Part 1: Classes, Objects, `__init__`, Class & Static Methods (Lessons 01 – 07)

**Q1.** What is the difference between a class and an instance? If two instances are created from the same class, what do they share and what is independent?

> **My Answer:**

---

**Q2.** Why does an instance method such as `def greet(self):` declare `self`, even though callers write `obj.greet()`? What would go wrong if `self` were omitted?

> **My Answer:**

---

**Q3.** Explain the difference between an instance attribute and a class attribute. Why is `members = []` in a class body usually a bug, and how would you fix it?

> **My Answer:**

---

**Q4.** Compare `@classmethod` and `@staticmethod`: what implicit first argument does each receive, and which would you use for an alternative constructor such as `Date.from_iso("2026-11-22")`? What happens when a subclass calls that classmethod?

> **My Answer:**

---

### Part 2: Encapsulation, Abstraction, Inheritance, Polymorphism & `super()` (Lessons 08 – 15)

**Q5.** How do encapsulation and abstraction differ? Give one concrete example of each in Python.

> **My Answer:**

---

**Q6.** What is the practical difference between `balance`, `_balance`, and `__balance` inside a class? How does name mangling work, and what role does a `@property` play in protecting a class invariant?

> **My Answer:**

---

**Q7.** What does `abc.ABC` plus `@abstractmethod` guarantee? What happens if you instantiate a class that still has an unimplemented abstract method, and can an abstract method have a body?

> **My Answer:**

---

**Q8.** Explain `is-a` versus `has-a` with an example. When a subclass overrides `__init__`, why must it usually call `super().__init__(...)`?

> **My Answer:**

---

**Q9.** What is duck typing, and how does it enable polymorphism without a common base class? Write a tiny function that works with any object providing `.speak()`.

> **My Answer:**

---

### Part 3: Dunders, Introspection, Multiple Inheritance & MRO (Lessons 16 – 20)

**Q10.** Distinguish `__str__` from `__repr__`. Name three other dunder methods and state which built-in operation each one enables. What happens to hashing when you define `__eq__` without `__hash__`?

> **My Answer:**

---

**Q11.** You are handed an unfamiliar object. Which tools would you use to discover its type, its own stored fields, all available attribute names, and a callable's parameter list? How does `dir()` differ from `vars()`?

> **My Answer:**

---

**Q12.** For `class D(B, C)` where both `B` and `C` inherit from `A`, describe the C3 MRO. Which class does `super()` inside `D` delegate to, why can an inconsistent base order cause a `TypeError`, and how can you inspect the MRO directly?

> **My Answer:**

---

## Score

`[ ] / 12 correct`

## Notes / Mistakes to Remember

<!-- Write down anything you got wrong, misconceptions corrected, or concepts to revisit -->
