# 📖 Lesson: __init__

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0101. __init__.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

`__init__` as the initializer Python calls automatically after creating a new object. How to accept parameters, store them on `self`, set defaults and enforce invariants. Why `__init__` must return `None` and how it differs from the rarely used `__new__` constructor.

---

## 📝 Key Concepts

### 1. Automatic Initialization

When you write `Point(1, 2)`, Python creates the instance and immediately calls `Point.__init__(instance, 1, 2)`. The initializer sets up initial state; it does not create the object itself.

```python
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(1, 2)
print(p.__dict__)  # {'x': 1, 'y': 2}
```

---

### 2. Parameters, Defaults and Validation

Initializer parameters can have default values, and this is the natural place to reject invalid input so no object exists in a broken state. Raise exceptions rather than printing warnings.

```python
class Point:
    def __init__(self, x=0, y=0):
        if not isinstance(x, (int, float)):
            raise ValueError("x must be numeric")
        self.x = x
        self.y = y
```

---

### 3. `__init__` Is an Initializer, Not the Constructor

`__new__` actually allocates the instance and returns it; `__init__` then initializes that returned object. Returning any non-`None` value from `__init__` is a `TypeError`, and forgetting `self` shifts every argument by one position.

```python
class Bad:
    def __init__(self):
        return 5  # TypeError: __init__() should return None
```

---

## ⚠️ Gotchas & Pro Tips

1. **Never return a value from `__init__`** — Python calls it for its side effects only; a returned value is discarded at best and usually raises TypeError.
2. **Include `self` in the signature** — `def __init__(x, y):` makes Python pass the instance into `x`, so your call arguments no longer line up.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
