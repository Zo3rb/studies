# 📖 Lesson: Exercise - Logical Operators

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0058. Exercise - Logical Operators.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This exercise lesson applies `and`, `or`, and `not` to practical validation problems instead of isolated truth tables. You will translate several rules into Boolean expressions, test the boundary cases that most often break logic, and verify your answers with assertions.

---

## 📝 Key Concepts

### 1. Decompose a Rule into Named Tests

Start by naming each condition separately (`is_adult`, `has_permission`, `in_stock`) and only then combine them. Named tests make the final expression read like the original requirement and make boundary mistakes easier to spot.

```python
age = 17
has_parent_permission = True

is_adult = age >= 18
may_enter = is_adult or has_parent_permission
print(f"adult={is_adult}, may_enter={may_enter}")
```

---

### 2. Test Boundaries Explicitly

Logical bugs cluster at limits: `17` vs `18`, an empty string vs a filled one, exactly zero vs a positive number. Build a small table of inputs and expected results, then assert that your expression matches every row.

```python
def can_buy(age, balance, price):
    return age >= 18 and balance >= price

cases = [(17, 50, 20), (18, 50, 20), (25, 19, 20), (25, 20, 20)]
for age, balance, price in cases:
    print(f"age={age}, balance={balance}, price={price} -> {can_buy(age, balance, price)}")
```

---

### 3. Combine Operators Without Changing Meaning

The same rule can be written in several equivalent ways. `not (a or b)` and `not a and not b` are identical, so pick the form that reads most naturally. Keep the positive form as the primary name for a flag.

```python
is_open = True
has_items = False

# 'Closed or empty' expressed two equivalent ways:
blocked_1 = not is_open or not has_items
blocked_2 = not (is_open and has_items)
assert blocked_1 == blocked_2
print(f"blocked={blocked_1}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Assertions make an exercise self-checking** — `assert condition, "message"` raises `AssertionError` when the condition is false. It gives instant feedback while you try different logical expressions.
2. **Guard strings before indexing or converting** — Combine a truthiness check with an operation: `text and text[0].isupper()` prevents an `IndexError` on an empty string thanks to short-circuiting.
3. **Verify the exact requirement (inclusive vs exclusive)** — 'At least 18' means `>= 18`; 'older than 18' means `> 18`. Most exercise failures come from off-by-one comparisons, not from the operators themselves.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
