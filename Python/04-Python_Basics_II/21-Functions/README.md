# 📖 Lesson: Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0071. Functions.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Functions are named, reusable blocks of code. This lesson covers defining a function with `def`, calling it, why functions eliminate duplication (DRY), and how they create a local workspace for their variables.

---

## 📝 Key Concepts

### 1. Definition and Call

`def name():` introduces a function; the indented body holds its statements. Defining a function does not run the body — calling it with `name()` does. You can call the same function as many times as needed, and each call starts fresh.

```python
def greet():
    print("Hello from a function!")

print("Before the call")
greet()
greet()
print("After the calls")
```

---

### 2. Don't Repeat Yourself (DRY)

When the same logic appears in several places, move it into one function and give it a meaningful name. If the logic changes later, you edit one location instead of hunting through the program. Functions also name a concept, making the calling code read like a description of the task.

```python
# Without a function (repetition):
print("*" * 10)
print("Title")
print("*" * 10)

# With a function (reusable):
def banner(title):
    print("*" * len(title))
    print(title)
    print("*" * len(title))

banner("Summary")
```

---

### 3. Functions as Values and Local Scope

A function is an object: you can store it in a variable or pass it to another function. Its parameters and assignments live in a local scope, isolated from the rest of the program, which prevents accidental name clashes.

```python
def square(value):
    result = value * value
    return result

operation = square
print(operation(5))
try:
    print(result)          # 'result' is local to square
except NameError as exc:
    print(f"NameError expected: {exc}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Definition order matters at call time, not at parse time** — A function body can call another function defined later in the file, as long as both are defined before the call actually happens.
2. **Calling without parentheses does not run it** — `print(greet)` shows the function object; `print(greet())` runs it and prints whatever it returns (often `None`).
3. **Keep one function focused on one job** — Short functions with verb-based names (`calculate_total`, `load_users`) are easier to test and reuse than long multi-purpose blocks.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
