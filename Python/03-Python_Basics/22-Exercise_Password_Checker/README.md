# 📖 Lesson: Exercise: Password Checker

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0032. Exercise - Password Checker.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This exercise builds a small password checker using two pieces of user input.
The video asks for a username and password, greets the user, and prints a row of stars whose length matches the password.
These notes use fixed sample strings instead of stdin so the script always runs without interaction.
The exercise combines `len()`, `*`, and f-strings in one practical program.

---

## 📝 Key Concepts

### 1. Collect Two Values (Simulated Input)

In the video, `input()` gathers the username and password; each call returns a string.
Here we assign sample strings directly, keeping the rest of the logic identical and deterministic.

```python
username = "Andrei"       # stands in for input("Username: ")
password = "s3cret!"      # stands in for input("Password: ")
print(type(username).__name__, type(password).__name__)
```

---

### 2. Greet and Mask the Password

Build a greeting with an f-string, then repeat `'*'` exactly `len(password)` times.
The mask hides the characters while still showing how long the password is.

```python
greeting = f"Welcome, {username}!"
masked = "*" * len(password)
print(greeting)
print("Password accepted:", masked)
```

---

### 3. Add Simple Validation

A real checker would enforce length and complexity rules and never display the password.
For this exercise, a minimum-length check is enough to practice booleans and conditional messages.

```python
password = "abc"
if len(password) >= 8:
    print("strong enough length")
else:
    print("too short:", len(password), "characters")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`input()` returns text** — No conversion is needed here because a password should stay a string.
2. **The mask leaks length** — `"*" * len(password)` reveals how many characters were typed; that is fine for the exercise but not for real authentication UIs.
3. **Never print real passwords** — Use this pattern only with sample data; real systems hash passwords and avoid echoing them.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
