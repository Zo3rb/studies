# 📖 Lesson: Indentation In Python

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0053. Indentation In Python.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Unlike languages that use braces, Python uses whitespace to define which statements belong to a block. This lesson explains how indentation marks the body of `if`, loops, functions, and classes, why every line in one block must align, and how editors can silently introduce hard-to-spot errors when tabs and spaces are mixed.

---

## 📝 Key Concepts

### 1. Whitespace Is Syntax

Python groups statements by their leading whitespace. Statements at the same indentation level form one block; increasing the indentation opens a nested block, and decreasing it closes that block. The colon on `if`, `for`, `while`, `def`, and `class` announces that an indented block follows.

```python
weather = "rain"

if weather == "rain":
    print("Take an umbrella")   # indented: inside the if
    print("Wear boots")         # same level: still inside
print("Leave the house")       # unindented: outside the if
```

---

### 2. Consistent Levels: Four Spaces by Convention

Python only requires that indentation be *consistent within a block*, but PEP 8 recommends four spaces per level. Tabs and spaces must never be mixed: visually identical lines can contain different characters, producing `TabError` or `IndentationError`. Configure your editor to insert spaces when you press Tab.

```python
def show_levels(value):
    if value > 0:
        if value > 10:
            print("positive and large")   # level 3
        else:
            print("positive but small")   # level 2
    else:
        print("not positive")             # level 2

show_levels(25)
```

---

### 3. Common Indentation Errors

An `IndentationError: expected an indented block` means a colon was followed by no body. `unexpected indent` means a line was indented without opening a block, and `unindent does not match any outer indentation level` means a dedent landed between levels. Empty blocks are not allowed, which is why `pass` exists as a placeholder.

```python
# Valid placeholder for a block we have not written yet:
class FutureFeature:
    pass

# Invalid examples (would not run):
# if True:
# print("missing indent")       -> IndentationError
#     print("unexpected indent") -> IndentationError
```

---

## ⚠️ Gotchas & Pro Tips

1. **Blank lines do not break blocks** — Empty lines (and comment-only lines) are ignored for indentation purposes, so you can space out code inside a block without closing it.
2. **One compound header, one block** — The entire body of an `if`, `for`, `while`, `def`, or `class` must be indented at the same level. A single stray space at the end of a multiline body can move a statement out of the block.
3. **Show invisible characters when debugging** — If indentation looks correct but Python complains, view the file with visible whitespace (`cat -A` on Linux) or enable your editor's whitespace rendering to reveal mixed tabs and spaces.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
