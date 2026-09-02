# Python Refresher — Session 1

This document records the first Python refresher session while working through
[Python for Everybody (PY4E)](https://www.py4e.com/).

The setup lesson about using Replit was skipped because the environment,
Ubuntu/Linux shell basics, and running Python programs are already familiar.
The session instead focused on Python's object model, lists, functions, loops,
conditions, and return values.

An executable version of the examples is available in
`examples/session_01.py`.

## Learning approach

The refresher is structured as follows:

1. Study a short section or concept.
2. Attempt an exercise without immediately looking for the answer.
3. Discuss the reasoning, code, or error.
4. Review the underlying concept and improve the implementation.
5. Finish with a variation, test, or small challenge.

Because the goal is to return to software engineering and later prepare for
AI/ML work, the exercises also emphasize code quality, edge cases, and testing
rather than only getting one output.

## 1. Creating a new list inside a function

### Question

Predict the output:

```python
def transform(values):
    result = []

    for value in values:
        if value > 0:
            result.append(value * 2)

    return result


numbers = [-2, 3, 0, 5]
new_numbers = transform(numbers)

print(new_numbers)
print(numbers)
```

### Answer

```text
[6, 10]
[-2, 3, 0, 5]
```

`result` is a new list. The function reads values from `numbers`, but it does
not modify `numbers` itself. It appends the transformed values to `result` and
returns that separate list.

The same transformation can square positive values instead:

```python
def transform(values):
    result = []

    for value in values:
        if value > 0:
            result.append(value ** 2)

    return result
```

For `[-2, 3, 0, 5]`, this returns `[9, 25]`.

## 2. How Python passes objects to functions

The initial explanation was that Python passes values rather than references.
That is not quite precise for lists.

Python is commonly described as using **call-by-sharing** or
**pass-by-object-reference**:

- A function parameter becomes a local name.
- Initially, that local name refers to the same object supplied by the caller.
- If the object is mutated, the caller sees the mutation.
- If the local name is rebound to a new object, the caller's name is unaffected.

For example:

```python
def add_item(items):
    items.append(99)


numbers = [1, 2]
add_item(numbers)

print(numbers)
```

Output:

```text
[1, 2, 99]
```

`items.append(99)` mutates the existing list, so `numbers` reflects the
change.

### Mutation versus rebinding

| Operation              | What happens                     | Does the caller's list change? |
| ---------------------- | -------------------------------- | ------------------------------ |
| `items.append(99)`     | Mutates the existing list        | Yes                            |
| `items[0] = 99`        | Mutates the existing list        | Yes                            |
| `items = [99]`         | Rebinds the local name           | No                             |
| `items = items + [99]` | Creates a new list, then rebinds | No                             |
| `items += [99]`        | Usually mutates a list in place  | Yes                            |

The word “usually” matters because behavior depends on the type. Lists are
mutable, while integers and strings are immutable.

The term **object identity** is more precise than relying on a literal memory
address. Python's `is` operator checks whether two names refer to the same
object:

```python
first = [1, 2]
second = first

print(first is second)  # True
```

Use `==` to compare values and `is` mainly for identity checks such as
`value is None`.

## 3. Diagnostic 2: direct mutation

### Question

```python
def add_bonus(scores):
    scores.append(100)
    return scores


marks = [70, 80]
updated = add_bonus(marks)

print(updated)
print(marks)
print(updated is marks)
```

### Answer

```text
[70, 80, 100]
[70, 80, 100]
True
```

`updated` and `marks` refer to the same list. The function mutates the list
with `append` and returns that same object.

## 4. Diagnostic 3: creating a new list

### Question

```python
def change(items):
    items = items + [4]
    items.append(5)
    return items


numbers = [1, 2, 3]
result = change(numbers)

print(numbers)
print(result)
print(result is numbers)
```

### Answer

```text
[1, 2, 3]
[1, 2, 3, 4, 5]
False
```

The sequence is:

1. `items` and `numbers` initially refer to the same list.
2. `items + [4]` creates a new list.
3. `items = ...` rebinds the local parameter to that new list.
4. `items.append(5)` mutates the new list.
5. The new list is returned and assigned to `result`.
6. `numbers` still refers to the original list.

The original list is not copied into a separate local list at the start. The
same object is initially shared; the later assignment creates a new list and
changes what the local name refers to.

## 5. Diagnostic 4: augmented assignment

### Question

```python
def change(items):
    items += [4]
    items.append(5)
    return items


numbers = [1, 2, 3]
result = change(numbers)

print(numbers)
print(result)
print(result is numbers)
```

### Answer

```text
[1, 2, 3, 4, 5]
[1, 2, 3, 4, 5]
True
```

`+=` is called **augmented assignment**. For a list, it normally performs an
in-place addition, similar to:

```python
items.extend([4])
```

That is different from:

```python
items = items + [4]
```

The second expression creates a new list and rebinds `items`.

For immutable values, augmented assignment creates a new object instead:

```python
number = 10
number += 5

text = "Hello"
text += " world"
```

The names are rebound to new integer and string objects because those types
cannot be changed in place.

## 6. Writing a summary function

### Exercise

Write a function that returns the count, total, and average of positive
numbers. If there are no positive numbers, return `(0, 0, 0)`.

Examples:

```python
summarize([-2, 4, 6, 0])  # (2, 10, 5.0)
summarize([-3, 0, -1])    # (0, 0, 0)
```

### Submitted solution

```python
def summarize(numbers):
    count = 0
    total = 0

    if all(x <= 0 for x in numbers):
        return (0, 0, 0)
    else:
        for num in numbers:
            if num > 0:
                count += 1
                total += num

    return (count, total, (total / count))
```

### Review

The submitted solution is logically correct for a normal list. It correctly:

- initializes counters;
- ignores zero and negative values;
- counts positive values;
- accumulates their total;
- handles the no-positive-values case;
- returns a floating-point average.

There are three improvements:

1. `all(...)` scans the input once and the `for` loop scans it again.
2. If `numbers` is a generator or another one-use iterator, `all(...)` consumes
   it, so the later loop may have nothing left to process.
3. The `else` is unnecessary because the `if` branch returns immediately.

### Improved solution

```python
def summarize(numbers):
    count = 0
    total = 0

    for num in numbers:
        if num > 0:
            count += 1
            total += num

    if count == 0:
        return (0, 0, 0)

    return (count, total, total / count)
```

This version makes one pass and works with lists, tuples, and generators.

### Tests

```python
assert summarize([-2, 4, 6, 0]) == (2, 10, 5.0)
assert summarize([-3, 0, -1]) == (0, 0, 0)
assert summarize([]) == (0, 0, 0)
assert summarize([2.5, 7.5]) == (2, 10.0, 5.0)
```

## Key takeaways

- A function parameter initially refers to the object passed by the caller.
- Mutating a shared mutable object affects every name referring to it.
- Rebinding a local parameter does not rebind the caller's variable.
- `items + other` usually creates a new list.
- `items += other` usually mutates a list in place.
- `==` compares values; `is` compares object identity.
- A single-pass algorithm is often clearer and safer for general iterables.
- Explicit handling of empty input and other edge cases is part of good
  function design.

## Optional practice

Implement this without `sum`, `filter`, or a list comprehension:

```python
def summarize_even(numbers):
    # Return the count, total, and average of positive even numbers.
    # Return (0, 0, 0) if there are none.
    pass
```

Example:

```python
summarize_even([-2, 3, 4, 6, 7])  # (2, 10, 5.0)
```
