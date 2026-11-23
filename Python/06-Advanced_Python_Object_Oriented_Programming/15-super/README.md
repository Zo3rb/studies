# 📖 Lesson: super()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0111. super().mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

`super()` as a proxy for the next class in the method resolution order, not merely 'the parent'. Using it in `__init__` to cooperate with parent initialization, using it in overridden methods, and why zero-argument `super()` is preferred in modern Python 3.

---

## 📝 Key Concepts

### 1. Why `super()` Exists

Inside a subclass method, `super()` returns a proxy that delegates attribute lookup to the next class in the MRO. This lets an override reuse the inherited implementation instead of naming the parent class explicitly.

```python
class Dog(Animal):
    def speak(self):
        return super().speak() + " loudly"

Dog("Rex").speak()  # 'Rex speaks loudly' (if parent returns 'Rex speaks')
```

---

### 2. Cooperative Initialization

Each class in a chain initializes its own fields and calls `super().__init__` to let the next class do the same. When every class cooperates, state is set up exactly once, even in multiple inheritance.

```python
class Animal:
    def __init__(self, name):
        self.name = name

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)
        self.breed = breed
```

---

### 3. `super()` Follows the MRO

`super()` is relative to the class where it is written and the instance's MRO, so in multiple inheritance the next class may not be a direct parent. Use the zero-argument form inside class bodies; it relies on Python 3's implicit `__class__` cell and works with the current class and instance.

```python
class Dog(Animal):
    def next_in_line(self):
        return super().__init__  # bound method from the next MRO entry

print(Dog.__mro__)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`super()` is not always the lexical parent** — In multiple inheritance it delegates to the next class in the instance's MRO, which may be a sibling mixin.
2. **Zero-argument `super()` only works in a class body** — It needs the compiler-created `__class__` cell; outside a class, use `super(MyClass, obj)` explicitly.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
