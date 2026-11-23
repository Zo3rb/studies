# 📖 Lesson: What is OOP? Part 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0098. What is OOP? Part 2.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Why OOP pays off as programs grow: mapping real-world concepts to classes, keeping data and behavior together, and controlling complexity through encapsulation, abstraction, inheritance and polymorphism. How multiple independent instances share structure but not state, plus the vocabulary used throughout this module.

---

## 📝 Key Concepts

### 1. Modeling a Domain With Objects

Start by naming the nouns of the problem domain (customer, invoice, product) and the verbs that act on them (pay, add, ship). A class captures the nouns' data and the verbs become methods. Good object models keep changes localized: modifying invoice logic happens in one class, not scattered across a script.

```python
class Invoice:
    def __init__(self, amount):
        self.amount = amount

    def summary(self):
        return f"Invoice total: {self.amount}"
```

---

### 2. The Four Pillars at a Glance

Encapsulation bundles data with its methods and limits direct access. Abstraction exposes a simple interface while hiding implementation. Inheritance reuses and extends existing classes. Polymorphism lets different objects answer the same method call in their own way. The next lessons unpack each one.

```python
class Circle:
    def area(self):
        return 3.14159  # simplified for illustration

class Square:
    def area(self):
        return 4

for shape in (Circle(), Square()):
    print(shape.area())
```

---

### 3. Instances Share Behavior, Not State

All instances of a class use the same method definitions stored on the class, but each instance has its own attribute namespace. Changing one object's data does not change another object's data unless the attribute is deliberately shared at class level.

```python
a = Invoice(100)
b = Invoice(200)
a.amount = 150
print(a.amount, b.amount)  # 150 200
```

---

## ⚠️ Gotchas & Pro Tips

1. **Don't create a class for every single value** — A plain `dict`, tuple or namedtuple is often clearer for a small record with no behavior.
2. **Behavior belongs where the data lives** — If a function constantly manipulates one object's fields, it probably belongs as a method on that object.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
