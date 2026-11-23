# 📖 Lesson: What Is OOP?

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0097. What Is OOP?.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

What object-oriented programming actually means: organizing code around objects that bundle data (state) and behavior (methods) instead of loose functions and separate data. Why a class is a blueprint and an object is a concrete instance with its own state. A first tiny class in Python and what happens when you call it.

---

## 📝 Key Concepts

### 1. Objects: State + Behavior

An object is a self-contained unit that keeps its own data (attributes) and exposes operations (methods) that act on that data. Procedural code passes data between free functions; OOP asks the object that owns the data to do the work. Related code then lives together, and many independent objects of the same kind can coexist.

```python
class Dog:
    def bark(self):
        print("Woof!")

dog = Dog()
dog.bark()  # Woof!
```

---

### 2. Classes Are Blueprints, Instances Are Products

A class is a reusable description; an instance is one concrete object created from that description. Calling the class allocates a fresh object every time, so two instances share the same methods but can hold different values.

```python
class Dog:
    species = "Canis familiaris"

a = Dog()
b = Dog()
print(a is b)             # False
print(a.species)          # Canis familiaris
```

---

### 3. Why Choose OOP?

OOP helps when a program models many interacting entities: each entity becomes a class, and its responsibilities become methods. This supports reuse, makes state easier to localize, and prepares the ground for encapsulation, inheritance and polymorphism later in the module.

```python
# Procedural: behavior is separate from the data it touches
def bark(animal_name):
    print(f"{animal_name} says Woof!")

# OOP: behavior lives with the data
class Dog:
    def bark(self):
        print("Woof!")
```

---

## ⚠️ Gotchas & Pro Tips

1. **A class is not an object until you call it** — Writing `class Dog:` only creates a class object in the namespace; `Dog()` creates an instance.
2. **`self` is the instance, not the class** — The first parameter of an instance method receives whichever object called the method.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
