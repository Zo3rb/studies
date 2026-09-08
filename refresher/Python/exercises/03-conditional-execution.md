# Exercise 3 — Conditional Execution

These exercises follow the PY4E lesson on **Conditional Execution**, augmented with mathematical logic, decision tree branching, and exception handling.

Attempt each exercise before looking for a complete solution. Write unit tests under `Python/tests/test_03_conditionals.py` to verify your implementation.

---

## Exercise 3.1 — Number Sign Classification

Implement `categorize_number_sign(val: int | float) -> str` to classify numeric values into `'positive'`, `'negative'`, or `'zero'`.

## Exercise 3.2 — Safe Overtime Calculation with Parsing

Implement `calculate_overtime_pay_safe(hours_str: str, rate_str: str) -> float` to convert string inputs into numbers using `try`/`except ValueError` blocks and calculate gross pay with 1.5x overtime for hours over 40.

## Exercise 3.3 — Score Grade Evaluator

Implement `evaluate_score_grade(score: int | float) -> str` to map numeric scores between 0.0 and 1.0 into letter grades ('A', 'B', 'C', 'D', 'F') with strict domain range validation.

## Exercise 3.4 — Safe Inverse & Square Root (Guard Clauses)

Implement `safe_inverse_and_sqrt(x: int | float) -> tuple[float, float]` to calculate $(\frac{1}{x}, \sqrt{x})$ for $x > 0$. Use early guard clauses to raise `ValueError` for non-positive or non-finite numbers.

## Exercise 3.5 — Interval Containment & Short-Circuit Evaluation

Implement `check_range_containment(val: int | float, low: int | float, high: int | float, inclusive: bool = True) -> bool` using short-circuit boolean expressions.

---

## 🧪 Testing Checklist & Standard `unittest`

Run standard unit tests via:

```bash
python3 -m unittest discover -s Python/tests
```

For all conditional exercises, verify:

- Standard expected inputs (happy path).
- Boundary conditions (e.g., `score = 0.9`, `hours = 40.0`).
- Exception handling for non-numeric strings, negative numbers, and `NaN`/`infinity`.

---

## 🧠 Questions for Discussion

1. Why does placing guard clauses at the beginning of a function ($\mathcal{O}(1)$ early return) improve readability and maintainability compared to deeply nested `if`/`else` blocks?
2. How does short-circuit evaluation in `A and B` prevent runtime errors like division by zero (`x != 0 and (y / x) > 2`)?
3. How do De Morgan's Laws ($\neg(A \land B) \equiv \neg A \lor \neg B$) simplify boolean expression refactoring?
