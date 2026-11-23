# 📖 Lesson: Developer Fundamentals V

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0104. DEVELOPER FUNDAMENTALS - V.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

A developer-fundamentals interlude focused on designing classes rather than merely writing them: identify an object's responsibility, keep related data and behavior together, prefer a small public interface, and avoid global state. Practical habits that make encapsulation, inheritance and polymorphism easier to reason about later.

---

## 📝 Key Concepts

### 1. Design Around Responsibilities

Before writing a class, describe what it is responsible for in one sentence. If you cannot, the class may be doing too much. Replace loose global variables with state owned by a well-named object so that different parts of a program cannot silently corrupt it.

```python
# Weak: global state mutated from anywhere
items = []
def add(item):
    items.append(item)

# Better: state owned by a responsible object
class Cart:
    def __init__(self):
        self._items = []
```

---

### 2. Cohesion and a Small Public Interface

Cohesion means the members of a class belong together. Expose only the operations callers need; keep helpers internal with a leading underscore. A narrow public interface lets you change internals without breaking users of the class.

```python
class Cart:
    def add(self, name, price):
        self._items.append((name, price))

    def total(self):
        return self._sum()

    def _sum(self):   # internal helper
        return sum(price for _, price in self._items)
```

---

### 3. Tell, Don't Ask

Rather than asking an object for its fields and manipulating them outside, tell the object what should happen. The object then maintains its own invariants, which is the practical heart of good object design.

```python
# Avoid: cart.items.append(("Book", 20))
cart.add("Book", 20)
print(cart.total())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Don't over-engineer** — A short script with one-off data may not need classes at all; introduce them when state and behavior genuinely belong together.
2. **One class, one clear job** — If a class name needs 'and' (e.g. `UserAndReport`), consider splitting it into two collaborating classes.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
