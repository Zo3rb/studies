# 📖 Lesson: Private vs Public Variables

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0107. Private vs Public Variables.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Python's naming conventions for visibility: public names, `_single_leading_underscore` as an internal-use hint, `__double_leading_underscore` name mangling, and reserved `__dunder__` names. How to inspect mangled attributes and why 'private' in Python is a soft convention rather than a hard rule.

---

## 📝 Key Concepts

### 1. Public, Protected and Name-Mangled

A normal name such as `balance` is public. A single leading underscore, `_internal`, tells other programmers it is an implementation detail. A double leading underscore, `__secret`, additionally triggers name mangling: Python stores it as `_ClassName__secret` in the instance dictionary.

```python
class Vault:
    def __init__(self):
        self.public = "open"
        self._internal = "by convention"
        self.__secret = "mangled"

v = Vault()
print(v.public)
```

---

### 2. Name Mangling in Action

Mangling is a textual rewrite based on the class where the attribute is defined. It reduces accidental collisions between a base class and a subclass, but the value remains reachable if you know the rewritten name.

```python
print(sorted(v.__dict__))            # ['_Vault__secret', '_internal', 'public']
print(v._Vault__secret)              # mangled — accessible!
print(hasattr(v, "__secret"))        # False
```

---

### 3. Dunder Names Are Reserved

Names with both leading and trailing double underscores, such as `__init__` or `__len__`, are special protocol hooks used by Python itself. They are NOT mangled and should only be defined with the meaning Python assigns to them.

```python
class Box:
    def __len__(self):
        return 3

print(len(Box()))  # 3
```

---

## ⚠️ Gotchas & Pro Tips

1. **`__name` is mangled, `__name__` is not** — Trailing double underscores disable mangling because the name is a dunder protocol hook.
2. **Name mangling does not secure data** — It prevents accidental overrides and casual access, not deliberate inspection; use properties for real validation.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
