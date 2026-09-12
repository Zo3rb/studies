# notes/05-Loops_and_Iterations.md

## 🎯 Learning Objectives

- Iterate over sequences using `for` and `while` loops.
- Apply `enumerate`, `zip`, and `range` for advanced looping patterns.
- Use loop control statements: `break`, `continue`, and the optional `else` clause.
- Write list, set, and dict comprehensions.
- Annotate loop‑related functions with type hints from the standard library (`typing`).
- Follow PEP‑8 and Google‑style docstrings for any helper functions.

## 📖 Theory

Loops let you repeat a block of code until a condition is satisfied.

### `for` loops

Iterate over any **iterable** (lists, strings, generators, etc.).

```python
for item in iterable:
    # process item
```

### `while` loops

Repeatedly execute while a boolean expression remains `True`.

```python
while condition:
    # body
    # must modify something that eventually makes condition False
```

### Built‑ins that make loops powerful

| Function                       | Purpose                                              |
| ------------------------------ | ---------------------------------------------------- |
| `enumerate(iterable, start=0)` | Gives `(index, item)` pairs.                         |
| `zip(*iterables)`              | Iterate over multiple iterables in parallel.         |
| `range(start, stop, step)`     | Generates a sequence of integers.                    |
| Comprehensions                 | Concise one‑liner creation of lists, sets, or dicts. |

### Loop control

- `break` – exit the nearest loop immediately.
- `continue` – skip to the next iteration.
- `else` – executes only if the loop finished **without** a `break`.

## 💡 Hints & Tricks

- **Avoid infinite `while` loops**: always ensure the loop variable changes.
- Prefer **list comprehensions** for simple transformations – they are faster and more readable.
- Use **generator expressions** when you only need to iterate once and want to save memory.
- Remember that mutable default arguments (e.g., `def foo(lst=[])`) retain state across calls – avoid them.

## ✅ Test Cases (to be placed in `tests/test_05_loops.py`)

```python
self.assertEqual(sum_range(1, 5), 15)               # 1+2+3+4+5
self.assertListEqual(even_numbers([1,2,3,4,5]), [2,4])
self.assertTrue(find_target([10,20,30], 20))
self.assertFalse(find_target([10,20,30], 40))
```

---

_All files follow the same premium layout used throughout the refresher project._
