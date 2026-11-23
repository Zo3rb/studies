# 📖 Lesson: Abstraction

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0106. Abstraction.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Abstraction as hiding implementation complexity behind a simple interface. Building abstract base classes with `abc.ABC` and `@abstractmethod`, why abstract classes cannot be instantiated, and how they let related classes guarantee that certain methods exist.

---

## 📝 Key Concepts

### 1. What vs How

Abstraction exposes *what* an object can do while hiding *how* it does it. Callers rely on a small, stable interface such as `area()` and never need to know which formula or internal representation a concrete class uses.

```python
class Document:
    def render(self):
        """Subclasses implement the actual output format."""
        raise NotImplementedError
```

---

### 2. Abstract Base Classes

Deriving from `abc.ABC` and decorating methods with `@abstractmethod` turns a class into a contract. Concrete subclasses must supply those methods; otherwise they remain abstract themselves.

```python
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14159 * self.radius ** 2
```

---

### 3. Instantiation Is Blocked Until Methods Are Implemented

Python refuses to create instances of a class with unimplemented abstract methods. The check happens at instantiation time, giving an early, clear error instead of an `AttributeError` deep inside unrelated code.

```python
class Incomplete(Shape):
    pass

# Incomplete() -> TypeError: Can't instantiate abstract class ...
```

---

## ⚠️ Gotchas & Pro Tips

1. **An `@abstractmethod` can still have a body** — Subclasses can call that shared implementation with `super().method()` and then extend it.
2. **Abstraction is not always enforcement** — Duck typing is often simpler; use ABC when you want an explicit, checkable contract or shared implementation.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
