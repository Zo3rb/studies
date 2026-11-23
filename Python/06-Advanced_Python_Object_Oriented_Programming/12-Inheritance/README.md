# 📖 Lesson: Inheritance

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0108. Inheritance.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Inheritance as a way to define a new class that reuses and extends an existing class. Parent and child terminology, `is-a` relationships, inherited attributes and methods, overriding methods, and checking types with `isinstance` and `issubclass`.

---

## 📝 Key Concepts

### 1. Reusing a Parent Class

Putting a class name in parentheses, `class Dog(Animal):`, creates a subclass that inherits the parent's attributes and methods. Shared code is written once in the parent and reused by every child.

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def sleep(self):
        return f"{self.name} is sleeping"

class Dog(Animal):
    pass

dog = Dog("Rex")
print(dog.sleep())  # Rex is sleeping
```

---

### 2. Overriding Methods

A subclass can define a method with the same name as the parent; that definition wins when called on a subclass instance. Overriding lets a child customize behavior while still inheriting everything else.

```python
class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

class Cat(Animal):
    def speak(self):
        return f"{self.name} says Meow!"
```

---

### 3. `is-a` and Type Checks

Inheritance should model an is-a relationship: a `Dog` is an `Animal`. `isinstance(dog, Animal)` and `issubclass(Dog, Animal)` both return `True`, which lets generic code accept any subclass of the expected type.

```python
print(isinstance(dog, Animal))       # True
print(issubclass(Dog, Animal))       # True
print(isinstance(dog, Dog))          # True
```

---

## ⚠️ Gotchas & Pro Tips

1. **Inheritance means is-a, not has-a** — If a `Car` has an `Engine`, use composition (store an `Engine` attribute) instead of subclassing.
2. **Subclasses inherit mutable class attributes too** — A shared list defined on the parent stays shared across all subclasses unless overridden.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
