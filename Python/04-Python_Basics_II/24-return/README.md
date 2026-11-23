# 📖 Lesson: return

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0074. return.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

`return` sends a value back from a function and ends that call immediately. This lesson covers explicit vs implicit returns, early-return guard clauses, returning several values as a tuple, and the difference between returning a result and merely printing it.

---

## 📝 Key Concepts

### 1. Returning a Value Ends the Function

When Python reaches `return`, it evaluates the expression, hands the result back to the caller, and exits the function. Any statements after that `return` in the same path never run. Without a `return`, a function returns `None` automatically.

```python
def double(value):
    return value * 2
    print("unreachable")  # never executed

result = double(4)
print(f"result={result}, type={type(result).__name__}")

def silent():
    pass

print(f"silent() -> {silent()}")
```

---

### 2. Early Return and Guard Clauses

Checking invalid inputs first and returning immediately keeps the main logic flat instead of nesting it inside `if` blocks. This 'guard clause' style is easier to read as the function grows.

```python
def divide(a, b):
    if b == 0:
        return None          # guard clause: exit early
    return a / b

for divisor in (0, 4):
    print(f"10 / {divisor} -> {divide(10, divisor)}")
```

---

### 3. Multiple Values, `return` vs `print`

Returning several comma-separated values packs them into a tuple, which the caller can unpack. A printed value is only side-effect output; it cannot be used in a calculation. Prefer `return` for results and reserve `print` for communication with the user.

```python
def min_max(values):
    return min(values), max(values)

low, high = min_max([4, 1, 9])
print(f"low={low}, high={high}")

def noisy_sum(values):
    print(sum(values))       # prints but returns None

print(f"noisy_sum result: {noisy_sum([1, 2])}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`return None` and no `return` are equivalent** — Both produce `None`, so you can omit `return` for procedures that only perform an action. Be explicit when `None` is a meaningful sentinel.
2. **You cannot return two separate objects** — `return a, b` returns one tuple. Unpack it at the call site, or return a dict/dataclass when the fields need names.
3. **Return, don't print, for reusable logic** — A function that prints its answer forces the caller to capture stdout to reuse the result. Return the value and let the caller decide how to display it.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
