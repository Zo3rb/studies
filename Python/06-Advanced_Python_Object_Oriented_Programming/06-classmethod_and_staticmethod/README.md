# 📖 Lesson: @classmethod and @staticmethod

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0102. @classmethod and @staticmethod.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Two alternative ways to define behavior on a class: `@classmethod`, which receives the class (`cls`) and can be called on the class itself, and `@staticmethod`, which receives no implicit first argument and behaves like a namespaced plain function. When each is appropriate, including alternative constructors and utility helpers.

---

## 📝 Key Concepts

### 1. `@classmethod` Receives `cls`

A classmethod is bound to the class rather than an instance, so its first argument is the class object. This makes it ideal for alternative constructors that build instances from other formats, and it respects subclasses because `cls` is the class that was actually used.

```python
class Date:
    def __init__(self, year, month, day):
        self.year, self.month, self.day = year, month, day

    @classmethod
    def from_iso(cls, text):
        return cls(*(int(part) for part in text.split("-")))

d = Date.from_iso("2026-11-22")
```

---

### 2. `@staticmethod` Has No Implicit Argument

A staticmethod is a plain function stored in a class namespace. It gets neither `self` nor `cls`, so it can be called on the class or an instance. Use it for helper logic related to the class that does not need object state.

```python
class Date:
    @staticmethod
    def is_leap(year):
        return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

print(Date.is_leap(2024))  # True
```

---

### 3. Choosing Between Them

Use an instance method when behavior depends on an object's state, a classmethod when it needs the class (alternative constructors, factories), and a staticmethod for a pure utility that merely belongs with the class conceptually.

```python
d = Date(2024, 2, 29)
print(d.is_leap(d.year))          # static via instance
print(Date.from_iso("2024-02-29").year)  # classmethod via class
```

---

## ⚠️ Gotchas & Pro Tips

1. **`cls` is the actual class used, including subclasses** — A classmethod called as `Sub.from_iso(...)` receives `Sub`, so `cls(...)` creates a `Sub` instance.
2. **Don't use `@staticmethod` out of habit** — If the helper needs to build objects of the current class, it should be a classmethod instead.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
