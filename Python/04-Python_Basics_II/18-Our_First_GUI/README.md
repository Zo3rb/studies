# 📖 Lesson: Our First GUI

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0068. Our First GUI.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This lesson introduces graphical programming with Python's standard-library `turtle` module. You will see how a `Screen` hosts a `Turtle`, how simple commands such as `forward()` and `right()` draw lines, and why GUI programs rely on an event loop. The practice detects a missing display and explains it instead of crashing.

---

## 📝 Key Concepts

### 1. The `turtle` Module and the Screen

`turtle` ships with Python and is backed by Tkinter. `turtle.Screen()` creates the drawing window; `screen.title(...)` labels it and `screen.exitonclick()` keeps it open until a click. In a headless environment there is no display, so creating the screen raises `TclError` (or the import itself may fail).

```python
import turtle

screen = turtle.Screen()
screen.title("My first GUI")
screen.exitonclick()   # blocks until the user clicks
```

---

### 2. Turtles Draw Relative to Their Heading

A `Turtle` starts at the centre of the screen facing right. `forward(d)` / `backward(d)` move along the current heading; `right(angle)` / `left(angle)` rotate it; `penup()` / `pendown()` control whether a line is drawn. A square is four forward-and-turn steps.

```python
import turtle

pen = turtle.Turtle()
pen.speed(1)
for _ in range(4):
    pen.forward(80)
    pen.right(90)

turtle.done()
```

---

### 3. GUI Programs Are Event-Driven

Unlike a script that prints and exits, a GUI waits for events such as clicks and key presses. That is why GUI examples end with `exitonclick()` or `turtle.done()`. In automated or headless runs, skip the window entirely and print a clear explanation rather than blocking or failing.

```python
# Headless-safe structure:
import os

if not (os.environ.get("DISPLAY") or os.environ.get("WAYLAND_DISPLAY")):
    print("No graphical display available; skipping turtle window.")
else:
    try:
        import turtle
        screen = turtle.Screen()
        screen.bye()
    except Exception as exc:
        print(f"GUI unavailable: {exc}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`DISPLAY` is required on Linux** — SSH sessions and CI runners usually have no `DISPLAY`, so Tk cannot create a window. Checking the environment first avoids an ugly traceback; `TclError: no display name and no $DISPLAY environment variable` is the classic symptom.
2. **Close windows you create** — Call `screen.bye()` (or `turtle.bye()`) when a script must finish without waiting for a click, so no Tk process is left behind.
3. **Keep drawing commands simple at first** — Start with a square or a spiral using a short loop. Fancy colours and event handlers can be layered on once the basic Screen/Turtle relationship is clear.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
