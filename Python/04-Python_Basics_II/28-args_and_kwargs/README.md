# 📖 Lesson: *args and **kwargs

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0078. *args and **kwargs.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

`*args` and `**kwargs` let a function accept a variable number of arguments. This lesson explains the packing behaviour in function definitions, the unpacking behaviour in calls, the required parameter ordering, and the common wrapper/delegation pattern.

---

## 📝 Key Concepts

### 1. `*args` Collects Extra Positional Arguments

In a `def` header, a single star packs any number of leftover positional arguments into a tuple. The name `args` is a convention, not a requirement; the star is what matters. Without `*args`, extra positional arguments raise `TypeError`.

```python
def total(*numbers):
    print(f"numbers is a {type(numbers).__name__}: {numbers}")
    return sum(numbers)

print(total(1, 2, 3))
print(total())
```

---

### 2. `**kwargs` Collects Extra Keyword Arguments

A double star packs leftover keyword arguments into a dict whose keys are the argument names. Combine both forms for flexible APIs such as configuration builders and decorators.

```python
def build(label, *items, **options):
    return {"label": label, "items": items, "options": options}

print(build("groceries", "milk", "eggs", urgent=True, store="market"))
```

---

### 3. Packing, Unpacking and Parameter Order

The same stars work in calls: `*sequence` expands items into positional arguments and `**mapping` expands keyword pairs. In a definition the order is: normal parameters, `*args`, keyword-only parameters, then `**kwargs`. Mismatched or duplicate names still raise `TypeError`.

```python
def describe(a, b, *extra, label="default", **options):
    return a, b, extra, label, options

values = [1, 2, 3, 4]
settings = {"label": "custom", "verbose": True}
print(describe(*values, **settings))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`*` alone means keyword-only** — `def f(a, *, b=1):` does not collect extra arguments; it forces `b` to be passed by keyword. Distinguish this from `*args`.
2. **Unpacking dictionaries needs matching keys** — `f(**{'a': 1})` works only if `f` accepts a parameter named `a`. Unexpected keys produce `TypeError: unexpected keyword argument`.
3. **Use the names args/kwargs by convention** — Other code and documentation assume these names. You *can* write `*values, **options`, but the conventional names make intent obvious to readers.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
