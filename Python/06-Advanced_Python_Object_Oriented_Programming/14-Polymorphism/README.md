# 📖 Lesson: Polymorphism

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0110. Polymorphism.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Polymorphism: writing code that works with objects of different types as long as they provide the expected behavior. Inheritance-based polymorphism versus duck typing, and how the same call can produce different results depending on the concrete object.

---

## 📝 Key Concepts

### 1. One Interface, Many Implementations

Polymorphism means one call site can work with many concrete types. A loop that calls `shape.area()` does not care whether `shape` is a `Circle` or a `Rectangle`; each object supplies its own implementation.

```python
for shape in (Circle(2), Rectangle(3, 4)):
    print(shape.area())  # each object decides how to respond
```

---

### 2. Duck Typing

Python usually relies on duck typing rather than a shared base class: if an object has the required method and behaves correctly, it can be used. 'If it quacks like a duck...' means the interface matters more than the declared type.

```python
def make_it_speak(obj):
    print(obj.speak())

make_it_speak(Dog())   # Woof!
make_it_speak(Robot()) # Beep!
```

---

### 3. Polymorphism Through Dunders

Operators are polymorphic too: `+` concatenates strings, adds numbers and can be defined for your own classes with `__add__`. The same syntax dispatches to different implementations based on operand types.

```python
class Vector:
    def __init__(self, x):
        self.x = x

    def __add__(self, other):
        return Vector(self.x + other.x)

print((Vector(1) + Vector(2)).x)  # 3
```

---

## ⚠️ Gotchas & Pro Tips

1. **No common base class is required** — Duck-typed objects only need matching behavior; an abstract base class is optional.
2. **Missing methods fail at runtime** — If an object lacks the expected method you get `AttributeError`, so use `hasattr` or try/except when input is untrusted.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
