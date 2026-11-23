# 📖 Lesson: Conditional Logic

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0052. Conditional Logic.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This lesson focuses on the expressions that control an `if`: comparisons such as `<`, `>=`, and `==`, and how to join them into larger Boolean expressions. You will practice translating real-world rules ("at least 18 **and** has a ticket") into Python code, understand why `=` is assignment while `==` is comparison, and see how arithmetic can be used to build conditions.

---

## 📝 Key Concepts

### 1. Comparison Operators

Comparison operators take two operands and return a `bool`. They work on numbers, strings (lexicographic order), and many other types. Chain them naturally in Python: `1 < x <= 10` means the same as `1 < x and x <= 10` and evaluates `x` only once.

```python
x = 7

print(x == 7)    # equal to
print(x != 3)    # not equal to
print(x >= 7)    # greater than or equal to
print(1 < x <= 10)  # chained comparison
```

---

### 2. Building Boolean Expressions

Conditions can contain arithmetic as well as comparisons. For instance, `number % 2 == 0` tests evenness and `year % 400 == 0 or (year % 4 == 0 and year % 100 != 0)` tests for a leap year. Parentheses are free and make complex logic easier to verify; they never hurt.

```python
number = 12
is_even = number % 2 == 0

year = 2024
is_leap = year % 400 == 0 or (year % 4 == 0 and year % 100 != 0)

print(f"{number} even? {is_even}; {year} leap year? {is_leap}")
```

---

### 3. From Plain-English Rules to Code

Conditional logic is mostly translation work. Identify the inputs, name each test as a Boolean variable, then combine the tests with `and` / `or` / `not`. Naming intermediate Booleans (for example `has_access`) documents the rule and makes a long condition readable.

```python
age = 21
has_ticket = True
is_vip = False

can_enter = age >= 18 and (has_ticket or is_vip)
if can_enter:
    print("Entry allowed")
else:
    print("Entry denied")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`=` assigns, `==` compares** — Writing `if age = 18:` is a `SyntaxError` in Python. If you accidentally use assignment where you meant comparison, the interpreter refuses to run the program rather than silently changing a value.
2. **String comparisons are lexicographic** — The comparison "Zebra" < "apple" is True because uppercase letters have lower Unicode code points than lowercase ones. Normalize case first with s.lower() when doing case-insensitive comparisons.
3. **Use parentheses for mixed `and` / `or`** — `and` binds tighter than `or`, but explicit parentheses document your intent and prevent subtle logic bugs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
