# Python Session 1 — Objects, Lists, and Functions

## What was skipped

The first PY4E setup lesson about using Replit was skipped because Ubuntu,
Linux shell usage, and running Python programs are already familiar.

## Question 1 — Creating a new list

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

The function creates a new list called `result`. It reads from `numbers` but
does not mutate `numbers`.

To square the positive values:

```python
result.append(value ** 2)
```

This returns `[9, 25]` for the same input.

## How function arguments work

The initial idea was that Python passes a copy of the values. The more precise
model is **call-by-sharing**:

- a parameter is a local name;
- it initially refers to the same object supplied by the caller;
- mutating that object is visible to the caller;
- rebinding the local name is not visible to the caller.

```python
def add_item(items):
    items.append(99)


numbers = [1, 2]
add_item(numbers)
print(numbers)  # [1, 2, 99]
```

`append` mutates the existing list.

### Mutation versus rebinding

```python
items.append(99)       # mutates the existing list
items[0] = 99          # mutates the existing list
items = [99]           # rebinds only the local name
items = items + [99]   # creates a new list and rebinds
```

`is` checks object identity. `==` compares values.

## Question 2 — Direct mutation

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

The function mutates the same list and returns it. Therefore both names refer
to the same object.

## Question 3 — New list and rebinding

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

`items + [4]` creates a new list. The local parameter is then rebound to that
new list, and `append(5)` mutates the new list. The caller's original list is
unchanged.

## Question 4 — Augmented assignment

```python
def change(items):
    items += [4]
    items.append(5)
    return items
```

For a list, `+=` normally performs an in-place operation similar to
`items.extend([4])`.

The output is therefore:

```text
[1, 2, 3, 4, 5]
[1, 2, 3, 4, 5]
True
```

This differs from `items = items + [4]`. For immutable types such as integers
and strings, `+=` creates a new object because the original cannot be changed
in place.

## Question 5 — Summary function

The task was to return the count, total, and average of positive numbers:

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

Examples:

```python
summarize([-2, 4, 6, 0])  # (2, 10, 5.0)
summarize([-3, 0, -1])    # (0, 0, 0)
summarize([])             # (0, 0, 0)
```

The first attempt was logically correct for a normal list. The improved
version avoids calling `all(...)` and then iterating a second time. That is
more efficient and also works with one-use generators.

## Tests

```python
assert summarize([-2, 4, 6, 0]) == (2, 10, 5.0)
assert summarize([-3, 0, -1]) == (0, 0, 0)
assert summarize([]) == (0, 0, 0)
assert summarize([2.5, 7.5]) == (2, 10.0, 5.0)
```

## Key takeaways

- A parameter refers to an object; it is not automatically a copied object.
- Mutation changes the shared object.
- Rebinding changes only the local name.
- Lists are mutable; integers and strings are immutable.
- `+` can create a new list while `+=` usually mutates a list.
- `is` checks identity; `==` checks values.
- Edge cases such as empty input should be handled deliberately.
- One-pass solutions are often clearer and more general.

## 🧠 Maths & DSA Insights

### 1. Complexity Analysis ($O$ Notation)
- **Time Complexity**:
  - `transform_positive_scale`: $\mathcal{O}(N)$ linear time where $N$ is the number of elements in `values`.
  - `in_place_pad_vector`: $\mathcal{O}(K)$ where $K = \text{target\_len} - \text{len}(vec)$ appends. Overall list allocation is amortized $\mathcal{O}(1)$ per `append()`.
  - `summarize_series`: $\mathcal{O}(N)$ single-pass linear time.
- **Space Complexity**:
  - **In-Place Mutation** (`in_place_pad_vector`): $\mathcal{O}(1)$ auxiliary space (mutates memory array in place).
  - **Out-of-Place Allocation** (`transform_positive_scale`, `vector_add_constant`): $\mathcal{O}(N)$ auxiliary space (allocates a new array in heap memory).
  - **Generator Streams** (`validated_numbers`): $\mathcal{O}(1)$ auxiliary space because elements are evaluated lazily one at a time.

### 2. Memory Model & Pointer References
- In Python, list variables store **references (pointers)** to objects, not raw values inline.
- Mutating a list (`list.append()`, `list += [...]`) modifies the underlying contiguous pointer array without changing the variable's memory address (`id()`).
- Rebinding (`items = items + [...]`) creates a brand-new list object in RAM and reassigns the local variable name pointer.

### 3. Numerical & Boundary Edge Cases
- **Booleans in Python are Subclasses of Integers**: `isinstance(True, int)` returns `True`! To prevent `True` or `False` from masquerading as numeric `1` or `0`, always check `if isinstance(val, bool): raise TypeError(...)` before checking `isinstance(val, (int, float))`.
- **IEEE 754 Floating-Point Infinities & NaNs**: Values like `float('nan')` or `float('inf')` pass `isinstance(val, float)`! Use `math.isfinite(val)` to validate boundaries in numeric/DSA algorithms.
