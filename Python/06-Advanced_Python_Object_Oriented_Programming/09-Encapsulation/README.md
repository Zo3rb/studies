# 📖 Lesson: Encapsulation

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0105. Encapsulation.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Encapsulation as bundling data with the methods that operate on it and controlling access through a deliberate public interface. Using properties and validation to protect invariants, and Python's convention-based privacy (single underscore) rather than hard walls.

---

## 📝 Key Concepts

### 1. Bundling State and Behavior

Encapsulation puts an object's data and the operations allowed on it in one class. Callers use methods such as `deposit` and `withdraw` instead of assigning to internal fields, so the class stays in charge of what valid state looks like.

```python
class Account:
    def __init__(self, balance=0):
        self._balance = balance

    def deposit(self, amount):
        if amount > 0:
            self._balance += amount
        return self._balance
```

---

### 2. Protecting Invariants With Properties

A `property` lets an attribute look like plain data while running getter/setter code underneath. You can validate assignments and later add logging or computed behavior without changing call sites.

```python
class Account:
    @property
    def balance(self):
        return self._balance

    @balance.setter
    def balance(self, value):
        if value < 0:
            raise ValueError("balance cannot be negative")
        self._balance = value
```

---

### 3. Public Interface vs Internal Details

Names starting with a single underscore signal 'internal use'. They are still reachable in Python, but well-behaved callers use the public methods instead. This is why encapsulation in Python is a social contract, not an access-control wall.

```python
class Account:
    def history(self):
        return tuple(self._ledger)  # controlled read-only view

a = Account()
print(a.history())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Python's encapsulation is a convention, not enforcement** — A single underscore is only a hint; even double-underscore names can be reached via name mangling.
2. **Properties let you add validation later** — Starting with `account.balance` as a property keeps the syntax identical if you need checks tomorrow.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
