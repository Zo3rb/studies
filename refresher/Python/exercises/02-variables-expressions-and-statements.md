# Exercise 2 — Variables, Expressions, and Statements

These exercises follow the PY4E lesson on variables, expressions, and
statements.

Attempt each exercise before looking for a complete solution. You can use the
Python interpreter to check individual expressions, but write the programs
yourself.

## Exercise 2.1 — Name greeting

Write a program that uses `input` to ask for a name and then prints a greeting.

Example:

```text
Enter your name: Ada
Hello Ada
```

Requirements:

- Store the result of `input()` in a variable.
- Print the greeting using the variable.
- Do not hard-code the name.

## Exercise 2.2 — Gross pay

Write a program that asks for hours and rate per hour, then calculates gross
pay.

Example:

```text
Enter Hours: 35
Enter Rate: 2.75
Pay: 96.25
```

Requirements:

- Convert hours to `float`.
- Convert rate to `float`.
- Multiply the two numeric values.
- Do not implement overtime yet.

## Exercise 2.3 — Predict types and values

Without running the code first, predict the value and type of each expression:

```python
width = 17
height = 12.0
```

```python
width // 2
width / 2.0
height / 3
1 + 2 * 5
```

Then verify your answers with Python and record the result.

## Exercise 2.4 — Celsius conversion

Write a program that asks for a Celsius temperature, converts it to Fahrenheit,
and prints the result.

Formula:

```text
Fahrenheit = Celsius * 9 / 5 + 32
```

Example:

```text
Enter Celsius temperature: 0
Fahrenheit: 32.0
```

## Exercise 2.5 — Personal diagnostic

Write a short program that stores:

- your name;
- the year you started learning programming;
- your target weekly study hours.

Print a short sentence containing all three values. Decide which values should
be strings, integers, or floats, and explain why.

## Self-check questions

1. What type does `input()` return?
2. Why does `"10" + "5"` produce `"105"` instead of `15`?
3. What is the difference between `/` and `//`?
4. What does `%` return?
5. Why are parentheses useful in mathematical expressions?
6. What error occurs when `int("hello")` runs?
7. What is the difference between a syntax error and a semantic error?

## Testing checklist

For the calculation exercises, test:

- normal positive values;
- zero;
- a decimal value;
- a negative value;
- input that is not numeric, if you add validation.

Do not add complex error handling until the basic version works. First make the
formula and types correct, then improve the user experience.

## Next lesson

After completing this exercise sheet, continue to conditional execution:

- comparisons;
- Boolean expressions;
- `if`, `elif`, and `else`;
- handling different cases in a program.
