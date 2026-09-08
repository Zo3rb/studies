# Python Session 2 — Variables, Expressions, and Statements

## Source lesson

This session follows the PY4E lesson
[Variables, expressions, and statements](https://www.py4e.com/lessons/memory)
and the related Chapter 2 material.

The goal is to understand how Python stores values, evaluates expressions, and
executes statements.

## 1. Values and types

A **value** is data that a program works with. Common basic values include:

```python
42              # int
3.14            # float
"Hello"         # str
True            # bool
None            # NoneType
```

Use `type` to inspect a value:

```python
print(type(42))       # <class 'int'>
print(type(3.14))     # <class 'float'>
print(type("Hello"))  # <class 'str'>
print(type(True))     # <class 'bool'>
```

Quotes make a value a string, even when the characters look like a number:

```python
print(type(17))    # int
print(type("17"))  # str
```

The string `"17"` is not numerically equal to the integer `17` until it is
converted:

```python
number = int("17")
print(number + 1)  # 18
```

## 2. Variables are names that refer to values

A variable is a name bound to an object:

```python
message = "Hello"
count = 3
price = 12.50
```

The assignment operator is `=`. It does not mean mathematical equality. It
means “bind the name on the left to the result on the right.”

```python
score = 10
score = score + 5
print(score)  # 15
```

Python is dynamically typed. A name can later refer to an object of another
type:

```python
value = 10
print(type(value))  # int

value = "ten"
print(type(value))  # str
```

Although this is legal, changing the meaning of a variable during a function
usually makes code harder to understand. Prefer stable, descriptive names.

## 3. Good variable names

Valid names:

```python
student_name = "Ada"
number_of_attempts = 3
total2 = 10
```

Invalid names:

```python
# 2total = 10       # cannot start with a number
# student-name = "" # '-' is subtraction, not part of a name
# class = "Python"  # class is a reserved keyword
```

Python names are case-sensitive:

```python
name = "Ada"
Name = "Grace"

print(name)  # Ada
print(Name)  # Grace
```

Use `snake_case` for ordinary variable and function names. Avoid shadowing
built-in names:

```python
# Avoid:
list = [1, 2, 3]
str = "text"
```

If you use those names, you can no longer easily call the built-in `list` or
`str` functions in the same scope.

Python keywords such as `if`, `for`, `class`, `def`, and `return` have special
meaning and cannot be used as ordinary variable names.

## 4. Expressions and operators

An **expression** combines values, variables, and operators to produce a
result:

```python
2 + 3
width * height
temperature * 9 / 5 + 32
```

Common arithmetic operators:

| Operator | Meaning           |  Example | Result |
| -------- | ----------------- | -------: | -----: |
| `+`      | addition          |  `7 + 2` |    `9` |
| `-`      | subtraction       |  `7 - 2` |    `5` |
| `*`      | multiplication    |  `7 * 2` |   `14` |
| `/`      | true division     |  `7 / 2` |  `3.5` |
| `//`     | floor division    | `7 // 2` |    `3` |
| `%`      | remainder/modulus |  `7 % 2` |    `1` |
| `**`     | exponentiation    | `7 ** 2` |   `49` |

The `+` operator also concatenates strings:

```python
first_name = "Ada"
last_name = "Lovelace"
full_name = first_name + " " + last_name
print(full_name)  # Ada Lovelace
```

Do not mix strings and numbers without an explicit conversion:

```python
age = 36
# print("Age: " + age)  # TypeError
print("Age: " + str(age))
```

## 5. Operator precedence

When an expression has multiple operators, Python follows precedence rules.
Parentheses make the intended order explicit:

```python
result = (1 + 2) * 5
print(result)  # 15
```

Without parentheses:

```python
result = 1 + 2 * 5
print(result)  # 11
```

For the arithmetic used here, the useful simplified order is:

1. Parentheses
2. Exponentiation
3. Multiplication, division, floor division, and modulus
4. Addition and subtraction

Operators at the same level are generally evaluated from left to right.
Instead of relying on a complicated expression, use parentheses or
intermediate variables:

```python
fahrenheit = (celsius * 9 / 5) + 32
```

## 6. Input and conversion

`input` displays a prompt and returns the user's response as a string:

```python
name = input("Enter your name: ")
print("Hello", name)
```

Even if the user types digits, the result is still a string:

```python
age_text = input("Enter your age: ")
age = int(age_text)
```

For decimal input, use `float`:

```python
rate_text = input("Enter the hourly rate: ")
rate = float(rate_text)
```

The compact form is common:

```python
hours = float(input("Enter hours: "))
```

Conversion can fail if the input is not valid:

```python
# int("abc")    # ValueError
# float("many") # ValueError
```

Handling invalid input with `try`/`except` is useful in a real program, but
the first PY4E exercise can remain simple.

## 7. A worked example: gross pay

The basic formula is:

```text
pay = hours * rate
```

An implementation is:

```python
hours = float(input("Enter Hours: "))
rate = float(input("Enter Rate: "))
pay = hours * rate
print("Pay:", pay)
```

If the input is `35` and `2.75`, the result is:

```text
Pay: 96.25
```

This first version assumes valid input and does not yet handle overtime.
Handling overtime is a later variation after conditional execution.

## 8. Celsius to Fahrenheit

The conversion formula is:

```text
Fahrenheit = Celsius * 9 / 5 + 32
```

```python
celsius = float(input("Enter Celsius temperature: "))
fahrenheit = celsius * 9 / 5 + 32
print("Fahrenheit:", fahrenheit)
```

Use parentheses when they make the formula easier to read:

```python
fahrenheit = (celsius * 9 / 5) + 32
```

## 9. Statements and comments

A **statement** is an instruction that performs an action:

```python
total = 10 + 5
print(total)
```

A comment begins with `#` and is ignored by Python:

```python
# Convert the user's temperature to Fahrenheit.
fahrenheit = (celsius * 9 / 5) + 32
```

Comments should explain intent or a non-obvious decision, not repeat obvious
syntax.

## 10. Common error categories

### Syntax error

Python cannot parse the program:

```python
# print("Hello"  # missing closing parenthesis
```

### NameError

The code refers to a name that has not been defined:

```python
# print(total)  # total does not exist yet
```

### TypeError

An operation is not valid for the given types:

```python
# "Age: " + 36
```

Use `str(36)` when concatenating with a string, or let `print` handle separate
arguments.

### ValueError

A value has the right general type but cannot be converted:

```python
# int("hello")
```

### Semantic error

The program runs but produces the wrong result:

```python
pi = 3.14159
wrong = 1 / 2 * pi
right = 1 / (2 * pi)
```

Both expressions are valid Python, but they represent different mathematics.
The programmer must make the intended grouping explicit.

## 11. Best practices for this lesson

- Give variables meaningful names.
- Use `snake_case`.
- Keep one conceptual operation per line when it improves readability.
- Use parentheses for formulas whose precedence is not immediately obvious.
- Convert input at the boundary of the program.
- Do not shadow built-in names such as `list`, `str`, `input`, or `sum`.
- Use `float` for simple educational calculations, but remember that floating
  point is not exact for every decimal value.
- Keep the first implementation simple; add validation and error handling in a
  deliberate later pass.
- Test with normal values, zero, negative values, and decimal values.

## 12. Diagnostic questions

Try to answer these before running the examples:

1. What are the types of `17`, `17.0`, `"17"`, and `True`?
2. What is the result and type of `17 / 2`?
3. What is the result of `17 // 2` and `17 % 2`?
4. Why does `input()` need to be combined with `int()` or `float()` in numeric
   programs?
5. What is the result of `1 + 2 * 5`?
6. Why is `1 / 2 * pi` different from `1 / (2 * pi)`?
7. What happens if a variable name is used before assignment?

### Self-check answers

1. `17` is `int`, `17.0` is `float`, `"17"` is `str`, and `True` is `bool`.
2. `17 / 2` produces `8.5`, a `float`.
3. `17 // 2` produces `8`; `17 % 2` produces `1`.
4. `input()` always returns text, so numeric conversion is required before
   arithmetic.
5. `1 + 2 * 5` is `11` because multiplication happens before addition.
6. The first expression divides by `2` and then multiplies by `pi`; the second
   divides by the entire quantity `2 * pi`.
7. Python raises a `NameError`.

## Next step

Attempt the exercises in
`Python/exercises/02-variables-expressions-and-statements.md`.
The next lesson after this one is conditional execution.

## 🧠 Maths & DSA Insights

### 1. Integer vs Floating-Point Arithmetic

- **Integer Division ($\mathbin{//}$) & Remainder ($\bmod$)**:
  - $a = b \cdot (a \mathbin{//} b) + (a \bmod b)$ holds universally in modular arithmetic.
  - In Python, $a \bmod b$ takes the sign of the divisor $b$ (unlike C/C++/Java where it takes the sign of dividend $a$).
- **Floating-Point Representation (IEEE 754)**:
  - Binary floating-point cannot accurately represent decimal fractions like `0.1` or `0.2` in finite bits.
  - `0.1 + 0.2 == 0.3` evaluates to `False` (`0.30000000000000004`).
  - **DSA / Math Best Practice**: When comparing floats, never use `==`. Use `math.isclose(a, b, rel_tol=1e-9)` or `abs(a - b) < 1e-9`.

### 2. Time & Space Complexity ($O$)

- **Arithmetic Operations**: Basic operators (`+`, `-`, `*`, `/`, `//`, `%`) on standard 64-bit integers and floats run in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.
- **Arbitrary-Precision Integers**: Python automatically handles arbitrarily large integers (bignums). However, operations on numbers with $D$ digits have non-constant costs: addition is $\mathcal{O}(D)$ and multiplication is $\mathcal{O}(D^{\log_2 3}) \approx \mathcal{O}(D^{1.58})$ (Karatsuba algorithm).

### 3. Piecewise Functions & Boundary Conditions

- **Overtime Pay Formula ($f(h, r)$)**:
  $$f(h, r) = \begin{cases} h \cdot r & \text{if } 0 \le h \le 40 \\ 40 \cdot r + (h - 40) \cdot 1.5r & \text{if } h > 40 \end{cases}$$
- In algorithm design, piece-wise transitions (like thresholds or boundary checks) require explicit unit tests at $h = 40$ (boundary point), $h = 39.9$, and $h = 40.1$.
