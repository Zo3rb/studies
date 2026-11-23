# 📖 Lesson: MRO - Method Resolution Order

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0116. MRO - Method Resolution Order.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Method Resolution Order: the exact sequence Python uses to look up attributes on a class and its bases. C3 linearization, reading `__mro__` and `mro()`, why `super()` uses this order, and how Python detects inconsistent hierarchies early.

---

## 📝 Key Concepts

### 1. What MRO Is

For every class Python precomputes a linearized list of classes used for attribute lookup: check the object, then the first class, then the next, and so on until `object`. Read it with `Class.__mro__` or `Class.mro()`.

```python
class A:
    pass

class B(A):
    pass

class C(B):
    pass

print(C.__mro__)
# (<class 'C'>, <class 'B'>, <class 'A'>, <class 'object'>)
```

---

### 2. C3 Linearization in a Diamond

C3 linearization preserves local precedence (bases are checked in order) while ensuring a shared ancestor appears only after all classes that depend on it. `class D(B, C)` with both B and C deriving from A gives `D, B, C, A, object`.

```python
class A:
    def who(self):
        return "A"

class B(A):
    pass

class C(A):
    def who(self):
        return "C"

class D(B, C):
    pass

print(D().who())  # 'C' — B has no override, lookup continues to C
```

---

### 3. Inconsistent Hierarchies

Not every arrangement can be linearized. If base order contradicts another branch, Python rejects the class definition outright instead of choosing an arbitrary order.

```python
class X(A): pass
class Y(A): pass
class Right(X, Y): pass          # consistent

# class Wrong(X, A, Y): pass     # TypeError: inconsistent MRO
```

---

## ⚠️ Gotchas & Pro Tips

1. **`__mro__` includes the class itself and ends at `object`** — The first entry is where lookup starts; the last is the universal base class.
2. **`super()` follows the instance's MRO** — It delegates to the next entry after the class where `super()` appears, not simply to a hardcoded parent name.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
