# 📖 Lesson: Creating Our Own Objects

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0099. Creating Our Own Objects.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

How to declare a class with the `class` keyword and create objects by calling the class like a function. What that call does behind the scenes: allocate a fresh instance and give it its own namespace (`__dict__`). Adding attributes after creation, and checking an object's class with `type` and `isinstance`.

---

## 📝 Key Concepts

### 1. Declaring a Class

A class body is a block of Python code introduced by `class Name:`. Names assigned in that body become members of the class namespace. An empty class with `pass` is perfectly legal and already produces usable objects.

```python
class Empty:
    pass

obj = Empty()
print(type(obj).__name__)  # Empty
```

---

### 2. Instantiation Creates a Fresh Namespace

Calling a class creates a new instance and gives it its own `__dict__`. Assigning `obj.x = 10` writes into that dictionary; another instance of the same class has an empty dictionary and is unaffected.

```python
a = Empty()
b = Empty()
a.x = 10
print(a.__dict__)  # {'x': 10}
print(b.__dict__)  # {}
```

---

### 3. Checking What an Object Is

`type(obj)` returns the exact class, while `isinstance(obj, cls)` also accepts subclasses. The latter is usually preferred when you care about supported behavior rather than the exact implementation class.

```python
print(type(a) is Empty)       # True
print(isinstance(a, Empty))   # True
```

---

## ⚠️ Gotchas & Pro Tips

1. **Calling a class twice never returns the same object** — Each call allocates a distinct instance, even when all its attributes are identical.
2. **Dynamic attributes are legal but can be messy** — Setting attributes ad hoc works, but defining expected fields in `__init__` makes objects predictable.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
