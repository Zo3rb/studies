# 📖 Lesson: Attributes and Methods

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0100. Attributes and Methods.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

The difference between attributes (data stored on an object or class) and methods (functions defined in a class body and bound to instances). How `self` receives the calling instance automatically. Class attributes versus instance attributes, shadowing, and the classic mutable-class-attribute trap.

---

## 📝 Key Concepts

### 1. Instance Attributes

Instance attributes are entries in an object's `__dict__`. They are most often created inside `__init__` with `self.name = value`, and each instance gets its own copy of the value.

```python
class User:
    def __init__(self, name):
        self.name = name

u = User("Ada")
print(u.__dict__)  # {'name': 'Ada'}
```

---

### 2. Methods and `self`

A method is a function stored on the class. Python passes the calling object as the first argument, conventionally named `self`. That is why `u.greet()` needs no explicit argument even though `greet` declares one.

```python
class User:
    def __init__(self, name):
        self.name = name

    def greet(self):
        return f"Hi, {self.name}"

print(User("Ada").greet())  # Hi, Ada
```

---

### 3. Class Attributes vs Instance Attributes

Attributes defined in the class body are shared by all instances unless an instance shadows them with the same name. Be careful with mutable class attributes: every instance sees the same list or dictionary.

```python
class Team:
    members = []   # shared by every instance!

a = Team()
b = Team()
a.members.append("Ada")
print(b.members)  # ['Ada'] — surprise!
```

---

## ⚠️ Gotchas & Pro Tips

1. **`self` is a convention, not a keyword** — You may rename it, but staying with `self` keeps code readable and tooling happy.
2. **Mutable class attributes are shared** — Use per-instance lists created in `__init__`, or a tuple, unless sharing is intentional.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
