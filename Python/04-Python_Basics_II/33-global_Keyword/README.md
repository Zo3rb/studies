# 📖 Lesson: global Keyword

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0083. global Keyword.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Reading a global inside a function is automatic, but rebinding it requires the `global` keyword. This lesson explains the declaration rule, why it must appear before any use of the name in the function, and why returning a new value is usually a cleaner design.

---

## 📝 Key Concepts

### 1. When `global` Is Required

If you want a function to *assign* to a module-level variable, declare `global name` inside the function first. Without it, Python creates a new local name and the global is unchanged. Reading alone never needs the declaration.

```python
counter = 0

def increment():
    global counter
    counter += 1

increment()
increment()
print(counter)   # 2
```

---

### 2. Declaration Order Matters

The `global` statement must appear before any read or assignment of that name in the function body; otherwise Python raises `SyntaxError: name used prior to global declaration`. The rule is determined when the function is compiled, not when it runs.

```python
count = 0

def bad():
    # print(count)      # would be a SyntaxError before 'global'
    global count
    count += 1

bad()
print(count)
```

---

### 3. Prefer Returning Values

Global mutation connects a function to hidden program state, making it harder to test and reuse. If a function needs to update state, consider returning the new value and letting the caller store it; reserve `global` for genuine module-level configuration or process-wide state.

```python
count = 0

def add(value, current):
    return current + value

count = add(3, count)
count = add(4, count)
print(count)   # 7: no hidden mutation
```

---

## ⚠️ Gotchas & Pro Tips

1. **You cannot declare a parameter global** — `def f(global x):` is a syntax error; a name cannot be both a parameter and a global declaration in the same function.
2. **`global` can refer only to module scope** — It cannot reach a variable in an enclosing function; that is what `nonlocal` is for.
3. **Multiple names in one statement** — `global a, b, c` is valid, but needing many globals is a signal that the function should take arguments and return results instead.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
