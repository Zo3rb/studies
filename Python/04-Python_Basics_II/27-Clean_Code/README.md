# 📖 Lesson: Clean Code

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0077. Clean Code.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Clean code is code that another developer can understand quickly and change safely. This lesson covers meaningful naming, keeping functions short and focused, following PEP 8 style, removing duplication, and replacing unexplained literal values with named constants.

---

## 📝 Key Concepts

### 1. Names Carry Meaning

Choose descriptive names that reveal intent: `total_price` over `x`, `is_active` over `flag`. PEP 8 recommends `snake_case` for variables and functions, `UPPER_CASE` for constants, and `PascalCase` for classes. A name should make comments about *what* the code does unnecessary.

```python
# Vague
def calc(a, b):
    return a * b

# Clear
def calculate_area(width, height):
    return width * height

print(calculate_area(4, 5))
```

---

### 2. Small Functions and No Magic Numbers

A function should do one thing and be small enough to understand at a glance. Unexplained literals ('magic numbers') hide meaning; promote them to named constants. If a function needs a paragraph to describe it, split it into helpers.

```python
MAX_RETRIES = 3
MINIMUM_AGE = 18

def eligible(age, retries):
    return age >= MINIMUM_AGE and retries < MAX_RETRIES

for age, retries in [(17, 0), (20, 2), (20, 3)]:
    print(age, retries, eligible(age, retries))
```

---

### 3. DRY and Consistent Style

Duplicated logic must be edited in several places, which invites inconsistency. Extract it into one function. Consistency matters too: PEP 8's four-space indentation, spaces around operators, blank lines between functions, and a line length near 79–88 characters make code predictable.

```python
# Repeated formatting logic -> one named helper
def format_price(amount):
    return f"${amount:.2f}"

for value in (5, 12.5, 99):
    print(format_price(value))

# Consistent style makes the structure obvious at a glance.
def greet(name):
    message = f"Hello, {name}"
    return message
```

---

## ⚠️ Gotchas & Pro Tips

1. **Comment on 'why', not 'what'** — Good code explains what it does through names. Reserve comments for non-obvious reasons, tricky algorithms, or references to external requirements.
2. **Use tools to enforce style** — `python -m py_compile` catches syntax errors; formatters and linters such as `black` and `ruff` automate PEP 8 compliance once installed.
3. **Be consistent with existing code** — When joining a project, match its conventions even if you prefer something else. Uniformity beats personal taste in shared codebases.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
