# 📖 Lesson: Multiple Inheritance

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0115. Multiple Inheritance.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Multiple inheritance: a class with more than one base class, mixin classes that contribute a single behavior, attribute lookup across bases, and the diamond problem. How cooperative `super()` and a consistent method resolution order make multiple inheritance manageable.

---

## 📝 Key Concepts

### 1. A Class With Several Bases

Listing several parent classes, `class C(A, B):`, lets a subclass reuse behavior from all of them. Lookup proceeds through a computed MRO, so bases listed earlier take precedence when names collide.

```python
class Flyer:
    def move(self):
        return "flying"

class Swimmer:
    def swim(self):
        return "swimming"

class Duck(Flyer, Swimmer):
    pass

print(Duck().move(), Duck().swim())
```

---

### 2. Mixins as Reusable Behavior

A mixin is a small class that provides one focused capability, such as JSON serialization, and is intended to be combined with other classes rather than instantiated alone. Mixins usually call `super()` to cooperate with the rest of the hierarchy.

```python
class JsonMixin:
    def to_json(self):
        import json
        return json.dumps(self.__dict__)

class Person:
    def __init__(self, name):
        self.name = name

class Employee(JsonMixin, Person):
    pass
```

---

### 3. The Diamond Problem and Cooperation

If `D` inherits from `B` and `C`, which both inherit from `A`, a call to an `A` method could be reached twice. When every class calls `super()` cooperatively, the MRO visits each class exactly once and initialization happens once too.

```python
class A:
    def who(self):
        return "A"

class B(A):
    def who(self):
        return "B -> " + super().who()

class C(A):
    def who(self):
        return "C -> " + super().who()

class D(B, C):
    pass

print(D().who())  # B -> C -> A
```

---

## ⚠️ Gotchas & Pro Tips

1. **Base order matters** — In `class D(B, C)`, a method defined on B wins over the same-named method on C.
2. **Inconsistent hierarchies fail early** — Python raises `TypeError: Cannot create a consistent method resolution order` at class creation time.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
