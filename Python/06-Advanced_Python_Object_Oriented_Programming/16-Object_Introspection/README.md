# 📖 Lesson: Object Introspection

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0112. Object Introspection.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Object introspection tools for discovering what an object is and can do: `type`, `isinstance`, `dir`, `vars`/`__dict__`, `inspect.signature`, `inspect.getmembers`, `help` and `__mro__`. Learning to explore unfamiliar objects interactively instead of guessing.

---

## 📝 Key Concepts

### 1. Identity and Type

`type(obj)` gives the exact class, `isinstance(obj, cls)` checks compatibility including subclasses, and `id(obj)` gives a unique identity token. These answer 'what is this thing?' in increasingly precise ways.

```python
class Dog:
    pass

d = Dog()
print(type(d).__name__)       # Dog
print(isinstance(d, object))  # True
```

---

### 2. Discovering Attributes With `dir` and `__dict__`

`dir(obj)` lists many attribute names, including inherited ones and dunders. `vars(obj)` (equivalently `obj.__dict__`) shows only the instance's own stored fields, which is usually what you want when debugging state.

```python
d.name = "Rex"
print("name" in dir(d))      # True
print(vars(d))               # {'name': 'Rex'}
```

---

### 3. Using the `inspect` Module

`inspect.signature` reveals a callable's parameters, `inspect.getmembers` filters members by predicate, and `inspect.ismethod`/`isfunction` distinguish bound methods from plain functions. `__mro__` exposes the inheritance lookup chain.

```python
import inspect

class Dog:
    def speak(self, loud=False):
        pass

print(inspect.signature(Dog.speak))  # (self, loud=False)
print([n for n, _ in inspect.getmembers(Dog, inspect.isfunction)])
```

---

## ⚠️ Gotchas & Pro Tips

1. **`dir()` includes inherited and special names** — It is a discovery aid, not a list of instance fields; combine it with `vars()`.
2. **Instances with `__slots__` have no `__dict__`** — `vars()` raises `TypeError` for slot-only objects, so use `getattr` or `dir` instead.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
