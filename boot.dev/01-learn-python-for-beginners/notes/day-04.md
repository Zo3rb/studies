# Day 4: Reliability and Exceptions

## 1. Exceptions Overview
Errors in Python are divided into syntax errors (parsing errors) and exceptions (errors detected during execution). When a Python script encounters a state it cannot handle, it raises an exception. 
Common built-in exceptions:
- `TypeError`: Raised when an operation is applied to an object of inappropriate type.
- `ValueError`: Raised when a built-in operation or function receives an argument that has the right type but an inappropriate value.
- `KeyError`: Raised when a dictionary key is not found.
- `IndexError`: Raised when a sequence subscript is out of range.

## 2. Handling Exceptions (try / except)
The `try` block lets you test a block of code for errors. The `except` block lets you handle the error.
```python
try:
    x = int("not_a_number")
except ValueError:
    print("Oops! That was no valid number.")
```

## 3. Raising Exceptions
You can choose to throw an exception if a condition occurs. To throw (or raise) an exception, use the `raise` keyword.
```python
x = -1
if x < 0:
    raise ValueError("Sorry, no numbers below zero")
```

## 4. The finally Block
The `finally` block, if specified, will be executed regardless if the try block raises an error or not. It's often used for cleanup.

---
## Reflection
- Why is it important to catch specific exceptions rather than using a bare `except:` block?
- Describe a situation where raising a `ValueError` makes sense in a project.
