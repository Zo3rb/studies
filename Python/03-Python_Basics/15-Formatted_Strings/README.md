# 📖 Lesson: Formatted Strings

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0025. Formatted Strings.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson builds dynamic messages by inserting values into strings.
It highlights f-strings (`f"...{name}..."`) as the cleanest modern approach, then shows legacy `.format()` and `%` styles.
You see how to control numeric presentation with format specs such as `:.2f`.
Placeholder order and conversion flags are also covered so values land in the right spot.

---

## 📝 Key Concepts

### 1. F-Strings (Python 3.6+)

Prefix a string literal with `f` and place expressions inside braces.
Format specs after a colon control precision, padding, alignment, and thousands separators.

```python
name = "Andrei"
score = 95.5
print(f"Hello, {name}!")
print(f"Score: {score:.1f}")
print(f"Items: {1234567:,}")
print(f"2 + 3 = {2 + 3}")
```

---

### 2. Legacy `.format()` and `%`

Older code uses `"{} {}".format(a, b)` or `"%s %d" % (a, b)`.
Numbered `{0}` and named `{name}` placeholders give more control over ordering.

```python
print("Hello, {}!".format("Andrei"))
print("{0} + {1} = {2}".format(2, 3, 5))
print("Hello, %(name)s" % {"name": "Andrei"})
print("Score: %.1f" % 95.5)
```

---

### 3. Conversions and Placeholder Order

`!r` uses `repr()`, `!s` uses `str()`, and `!a` uses `ascii()` inside an f-string.
A too-few-arguments format string raises `IndexError` or `KeyError`; extra `.format()` arguments are ignored.

```python
text = "hi"
print(f"str: {text!s} | repr: {text!r}")
try:
    "{} {}".format("only one")
except IndexError as error:
    print("IndexError:", error)
print("extra ignored:", "{}".format(1, 2))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Double the literal braces** — To print a literal `{` in an f-string, write `{{`; the same trick applies to `}}`.
2. **F-strings evaluate immediately** — They are not stored templates; the expression is evaluated when the line runs.
3. **Keep braces simple** — Complex logic inside `{}` hurts readability; compute the value first, then interpolate it.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
