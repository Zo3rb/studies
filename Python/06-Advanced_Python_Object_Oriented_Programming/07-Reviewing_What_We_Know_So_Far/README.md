# 📖 Lesson: Reviewing What We Know So Far

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0103. Reviewing What We Know So Far.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

A consolidated review of everything introduced so far: declaring classes, creating instances, storing state, writing methods that use `self`, initializing objects with `__init__`, and adding class and static methods. One small example ties the pieces together before the module moves into the four pillars of OOP.

---

## 📝 Key Concepts

### 1. The Class Vocabulary So Far

`class` defines a blueprint; calling it creates an instance; `__init__` sets initial state; instance attributes live in each object's `__dict__`; class attributes live in the class namespace; ordinary methods receive `self`; class methods receive `cls`; static methods receive neither.

```python
class Demo:
    shared = "class attribute"

    def __init__(self, value):
        self.value = value          # instance attribute

    def show(self):                 # instance method
        return self.value

    @classmethod
    def make(cls):                  # class method
        return cls("created")

    @staticmethod
    def helper():                   # static method
        return "helper"
```

---

### 2. An Integrated Example

A realistic class combines all of the pieces: a shared class attribute, validated initial state, instance methods that use that state, a classmethod factory and a staticmethod validator. Reading such a class top to bottom should make its responsibility obvious.

```python
class Book:
    category = "reading"

    def __init__(self, title, pages):
        self.title = title
        self.pages = pages

    def description(self):
        return f"{self.title} ({self.pages} pages)"

    @classmethod
    def from_dict(cls, data):
        return cls(data["title"], data["pages"])
```

---

### 3. Where Each Kind of Data Lives

The class holds its namespace in `Book.__dict__`; each instance holds only its own fields in `book.__dict__`. Name lookup starts on the instance, then continues on the class, which is why class attributes act as shared defaults.

```python
b = Book("Dune", 412)
print(b.__dict__)          # {'title': 'Dune', 'pages': 412}
print("category" in Book.__dict__)  # True
print("category" in b.__dict__)     # False
```

---

## ⚠️ Gotchas & Pro Tips

1. **Methods live on the class, not in each instance** — `book.__dict__` lists only that object's fields; `book.description` is found by lookup on the class.
2. **A missing `self` is the most common beginner error** — Check the traceback: if an argument count looks off, verify that every instance method declares `self` first.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
