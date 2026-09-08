# Python Session 3 — Conditional Execution

This session follows the PY4E lesson [Conditional Execution](https://www.py4e.com/lessons/know3) and Chapter 3 material.

---

## 1. Boolean Expressions & Comparison Operators

A **Boolean expression** evaluates to either `True` or `False` (objects of type `bool`).

### Comparison Operators

| Operator | Meaning                               | Example        | Result (`x=5, y=10`) |
| :------- | :------------------------------------ | :------------- | :------------------- |
| `==`     | Equal to                              | `x == y`       | `False`              |
| `!=`     | Not equal to                          | `x != y`       | `True`               |
| `>`      | Greater than                          | `x > y`        | `False`              |
| `<`      | Less than                             | `x < y`        | `True`               |
| `>=`     | Greater than or equal to              | `x >= 5`       | `True`               |
| `<=`     | Less than or equal to                 | `y <= 10`      | `True`               |
| `is`     | Object identity (same memory address) | `x is y`       | `False`              |
| `in`     | Membership check                      | `'a' in 'cat'` | `True`               |

> [!IMPORTANT]
> `==` tests **value equality** (do both objects contain equivalent data?).  
> `is` tests **identity** (do both variable names point to the exact same object in memory?). Always use `==` when comparing numbers, strings, or data values!

---

## 2. Logical Operators & Short-Circuit Evaluation

Python has three logical operators: `and`, `or`, and `not`.

### A. Logical Operators

- `A and B`: Evaluates to `True` if **both** operands are truthy.
- `A or B`: Evaluates to `True` if **at least one** operand is truthy.
- `not A`: Inverts the truth value of `A`.

### B. Short-Circuit Evaluation

Python evaluates logical expressions left-to-right and stops as soon as the outcome is determined:

- In `A and B`, if `A` is `False`, Python immediately returns `False` **without evaluating `B`**.
- In `A or B`, if `A` is `True`, Python immediately returns `True` **without evaluating `B`**.

```python
# Short-circuit guards against division by zero!
x = 0
y = 10
if x != 0 and (y / x) > 2:
    print("Ratio is high")
else:
    print("Safe execution (y / x was skipped)")
```

---

## 3. Conditional Execution Structure (`if`, `elif`, `else`)

### Chained Conditionals (`if`-`elif`-`else`)

```python
score = 85

if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
elif score >= 70:
    grade = 'C'
else:
    grade = 'F'
```

Each branch is checked sequentially. Once a branch condition evaluates to `True`, its block executes and all remaining `elif`/`else` branches are skipped.

---

## 4. Exception Handling (`try` / `except`)

When code can fail at runtime due to external or invalid input (e.g. `float("abc")`), Python raises an Exception. `try`/`except` blocks allow programs to handle errors gracefully without crashing (**EAFP: Easier to Ask for Forgiveness than Permission**).

```python
raw_input = input("Enter a number: ")

try:
    number = float(raw_input)
    print("Square:", number ** 2)
except ValueError:
    print("Error: Input was not a valid number!")
```

---

## 🧠 Maths & DSA Insights

### 1. Boolean Logic & De Morgan's Laws

In discrete mathematics and circuit design, De Morgan's Laws relate `AND`, `OR`, and `NOT` negation:

1. $\neg(A \land B) \equiv \neg A \lor \neg B$
   - `not (x > 0 and y > 0)` is equivalent to `x <= 0 or y <= 0`.
2. $\neg(A \lor B) \equiv \neg A \land \neg B$
   - `not (x == 0 or y == 0)` is equivalent to `x != 0 and y != 0`.

### 2. Decision Tree Complexity & Branching Factor

- Evaluating an `if`-`elif`-`else` chain with $K$ branches takes $\mathcal{O}(1)$ time per comparison and $\mathcal{O}(K)$ worst-case time to traverse to the last branch.
- **DSA Optimization**: Arrange `elif` conditions in descending order of frequency (most common case first) to minimize average-case comparison depth.

### 3. Numerical Guard Clauses & Edge Cases

- When implementing mathematical functions $f(x)$:
  - Check domain boundaries first: $x \ge 0$ for $\sqrt{x}$, $x \neq 0$ for $\frac{1}{x}$.
  - Place guard clauses at the top of functions to return early or raise clear exceptions ($\mathcal{O}(1)$ fail-fast principle).
