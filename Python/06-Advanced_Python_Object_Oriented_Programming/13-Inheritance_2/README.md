# 📖 Lesson: Inheritance 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0109. Inheritance 2.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Going deeper into inheritance: how attribute lookup walks up the class hierarchy, how to extend rather than replace inherited methods, and why an overridden `__init__` must still initialize the parent's state. How to reuse behavior without blindly copying code.

---

## 📝 Key Concepts

### 1. Attribute Lookup Follows the Hierarchy

When Python sees `dog.speak`, it checks the instance, then `Dog`, then each base class in method resolution order. A definition closer to the class wins, so a child can override one method and still find everything else on the parent.

```python
class Animal:
    def walk(self):
        return "walking"

class Dog(Animal):
    def speak(self):
        return "Woof!"

d = Dog()
print(d.speak(), d.walk())  # Woof! walking
```

---

### 2. Extending an Inherited Method

Instead of duplicating the parent's code in an override, call the parent implementation and add behavior around it. `super()` returns a proxy to the next class in lookup order, which is explored fully in a later lesson.

```python
class Dog(Animal):
    def speak(self):
        return super().speak() + " (enthusiastically)"
```

---

### 3. Initializing the Parent State

If a subclass defines `__init__`, Python uses it instead of the parent's. Call `super().__init__(...)` so fields set by the parent still exist; skipping it leaves objects partially initialized.

```python
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)
        self.breed = breed
```

---

## ⚠️ Gotchas & Pro Tips

1. **Overriding `__init__` without calling the parent loses state** — The subclass initializer replaces, not augments, the parent initializer unless you explicitly call `super()`.
2. **Duplicate names depend on lookup order** — When the same method appears in a parent and child, the first match in the MRO wins.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
