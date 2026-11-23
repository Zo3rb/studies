#!/usr/bin/env python3
"""Practice: Our First GUI — Module 04, Python Basics II.

Safely explores turtle.Screen, Turtle drawing commands, and headless GUI handling.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 18: Our First GUI")
    print("=" * 64)
    import os

    print("--- [1] Checking the environment for a display ---")
    display = os.environ.get("DISPLAY") or os.environ.get("WAYLAND_DISPLAY")
    print(f"  DISPLAY/WAYLAND_DISPLAY: {display or '<none>'}")

    print()
    print("--- [2] Trying to open a turtle window safely ---")
    if not display:
        print("  Headless environment detected: no graphical display is available.")
        print("  A turtle window cannot be created here; the lesson was verified without one.")
        print("  On a desktop, run: python3 -c 'import turtle; turtle.Screen().exitonclick()'")
    else:
        try:
            import turtle
        except ImportError as exc:
            print(f"  turtle/Tkinter is not installed: {exc}")
        else:
            screen = None
            try:
                screen = turtle.Screen()
                screen.title("Lesson 18: Our First GUI")
                pen = turtle.Turtle()
                pen.speed(0)
                for _ in range(4):
                    pen.forward(60)
                    pen.right(90)
                print("  Drew a square in a turtle window.")
            except turtle.TclError as exc:
                print(f"  Tk could not open a window: {exc}")
            finally:
                if screen is not None:
                    try:
                        screen.bye()
                        print("  Window closed cleanly with screen.bye().")
                    except turtle.TclError:
                        pass

    print()
    print("--- [3] The drawing algorithm works without a window too ---")
    def square_steps(side, corners=4):
        """Return the forward/right command sequence for a square."""
        return [("forward", side), ("right", 360 / corners)] * corners

    steps = square_steps(80)
    print(f"  commands: {steps}")
    assert len(steps) == 8 and steps[0] == ("forward", 80)
    assert steps[1] == ("right", 90.0)
    print("  Four forward-right pairs complete a 360-degree turn.")
    print()
    print("=" * 64)
    print(f"  Lesson 18 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
