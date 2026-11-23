# 📖 Lesson: Exercise — How Does Python Work?

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0010. Exercise - How Does Python Work?.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

A consolidation exercise: trace a few lines of Python from plain text to executing bytecode. Rather than trusting the mental model, you will use the `ast` and `dis` modules to *see* the parse tree and the instructions CPython generates. This turns the earlier interpreter discussion into something observable.

---

## 📝 Key Concepts

### 1. The Pipeline You Can Inspect

```
source text
   │  tokenize
   ▼
tokens → parser → Abstract Syntax Tree (ast)
   │  compiler
   ▼
code object (bytecode + constants + names)
   │  CPython evaluation loop
   ▼
runtime effects (prints, assignments, calls)
```

```python
import ast, dis

source = "x = 2 + 3\nprint(x)"
tree = ast.parse(source)
print(ast.dump(tree, indent=2))
code = compile(source, "<demo>", "exec")
dis.dis(code)
```

### 2. What the AST Reveals

- `Assign(targets=[Name('x')], value=BinOp(...))` — assignment is a statement with a target and an expression.
- `Call(func=Name('print'), args=[Name('x')])` — `print` is just a name looked up at runtime.
- Names are **strings in the code object**, resolved through namespaces when executed.

### 3. What Bytecode Reveals

Typical instructions for `x = 2 + 3`:

```text
LOAD_CONST  0 (2)
LOAD_CONST  1 (3)
BINARY_OP   0 (+)
STORE_NAME  0 (x)
```

There is no "add two numbers" magic — the VM pushes constants on a stack, performs an operation, stores the result.

### 4. Why This Matters in Practice

- `SyntaxError` happens at **compile** time — before any code runs.
- `NameError` happens at **runtime** — the name was not found when that line executed.
- `IndentationError` is a parse failure, not a style warning.

---

## ⚠️ Gotchas & Pro Tips

1. **Bytecode is an implementation detail of CPython.** The AST is more stable and more useful for learning; other implementations may compile differently.
2. **Compiling the whole module first explains surprising behavior.** A `SyntaxError` at the bottom prevents even the first `print` at the top from running.
3. **`exec`/`eval` are powerful and dangerous.** Use them for learning or controlled plugins never on untrusted input — they execute arbitrary code.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
