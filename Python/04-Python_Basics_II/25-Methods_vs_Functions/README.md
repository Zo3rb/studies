# 📖 Lesson: Methods vs Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0075. Methods vs Functions.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Functions and methods look similar but differ in how they are called and what they know. This lesson explains that a method is a function attached to an object and called with dot notation, why `self` is passed implicitly, and how to tell whether a method mutates its object or returns a new one.

---

## 📝 Key Concepts

### 1. Functions Stand Alone; Methods Are Bound

A function such as `len(items)` is called by name and receives all of its inputs explicitly. A method such as `items.append(3)` belongs to an object; calling it automatically passes that object as the first argument (`self`). The expression before the dot is the receiver.

```python
items = [1, 2]
print(len(items))          # built-in function
items.append(3)            # list method, bound to items
print(items)

print(len.__name__, items.append.__name__)
```

---

### 2. `self` Is the Instance

Inside a class, the first parameter of an instance method is conventionally named `self`. Python fills it in when you call `obj.method()`. The parameter still exists in the definition even though callers do not supply it.

```python
class Counter:
    def __init__(self):
        self.value = 0

    def increment(self, step=1):
        self.value += step
        return self.value

counter = Counter()
print(counter.increment(), counter.increment(5))
```

---

### 3. Mutation vs New Objects

Some methods change the receiver in place and return `None` (`list.append`, `list.sort`, `dict.update`). Others leave the receiver alone and return a new object (`str.upper`, `str.replace`, `list.copy`). Knowing which kind you are using prevents the classic `result = text.upper()` confusion — strings are immutable.

```python
text = "hello"
upper = text.upper()
print(text, upper)          # 'hello' 'HELLO': text unchanged

items = [3, 1, 2]
print(items.sort())         # None: in-place sort
print(items)                # [1, 2, 3]
print(sorted([3, 1, 2]))    # new sorted list
```

---

## ⚠️ Gotchas & Pro Tips

1. **Methods in a table** — | Operation | Function form | Method form | Mutates? |
|---|---|---|---|
| Length | `len(s)` | — | no |
| Uppercase | — | `s.upper()` | no (new str) |
| Add item | — | `lst.append(x)` | yes |
| Sort | `sorted(lst)` | `lst.sort()` | method: yes; function: no |
2. **Check the return value when learning a new method** — If a method returns `None`, it almost always mutated the object. That is why chaining `items.sort().reverse()` fails.
3. **Functions can also live in modules** — `math.sqrt(9)` is a function accessed through a module namespace using dot notation, but it is not a method: no instance is implicitly passed.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
