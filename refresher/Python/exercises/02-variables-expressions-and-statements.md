# Exercise 2 — Variables, Expressions, and Statements

These exercises follow the PY4E lesson on variables, expressions, and statements, augmented with mathematical precision and edge-case boundary testing.

Attempt each exercise before looking for a complete solution. Write unit tests under `Python/tests/test_02_variables.py` to verify your implementation.

## Exercise 2.1 — Type Analysis

Implement `analyze_numeric_types(values: list[Any]) -> list[tuple[str, str]]` to inspect heterogeneous lists of objects.

## Exercise 2.2 — Safe Division and Modulo

Implement `safe_divide_and_modulo(a: int | float, b: int | float) -> tuple[float, int, float]` calculating:
- Exact quotient ($a / b$)
- Floor quotient ($a \mathbin{//} b$)
- Modulo remainder ($a \bmod b$)

Raise `ZeroDivisionError` when $b = 0$, and `TypeError` when non-numeric inputs are provided.

## Exercise 2.3 — String Parsing and Scaling

Implement `parse_and_scale_inputs(val1_str: str, val2_str: str, scale: int | float = 1.0) -> tuple[float, float]` to convert numeric text inputs to float representations and apply a multiplicative scaling factor $v \cdot s$.

## Exercise 2.4 — Gross Pay with Piecewise Overtime

Implement `calculate_gross_pay(hours: int | float, rate: int | float, overtime_threshold: int | float = 40.0, overtime_multiplier: int | float = 1.5) -> float` implementing the piecewise linear pay function:

$$f(h, r) = \begin{cases} h \cdot r & \text{if } 0 \le h \le 40 \\ 40 \cdot r + (h - 40) \cdot 1.5r & \text{if } h > 40 \end{cases}$$

## Exercise 2.5 — Celsius to Fahrenheit Formula

Implement `celsius_to_fahrenheit(celsius: int | float) -> float` converting temperature using the linear formula $F = (C \cdot \frac{9}{5}) + 32$.

## Testing Checklist & Standard `unittest`

Run standard unit tests via:
```bash
python3 -m unittest discover -s Python/tests
```

For all calculation exercises, verify:
- Normal positive inputs (happy path).
- Boundary inputs (e.g. $h = 40.0$).
- Decimal floating-point precision (`math.isclose` or `assertAlmostEqual`).
- Invalid inputs (negative values, strings, `NaN`, `infinity`, zero divisor).
