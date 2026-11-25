# 🐍 Module 09 — Advanced Python: Error Handling

## Overview

This module teaches how Python reports failures and how to write programs that respond to them deliberately. It begins with the difference between syntax errors and runtime exceptions, the `BaseException` → `Exception` hierarchy, and the built-in exceptions you meet most often. It then builds up `try`/`except`/`else`/`finally`, multiple handlers, raising your own exceptions, custom exception classes, and exception chaining with `raise ... from ...`. Each lesson includes a runnable, dependency-free practice script, and the quiz at the end checks that you can choose the right handler instead of hiding bugs.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[01 - Errors in Python](./01-Errors_in_Python/README.md)** | Syntax errors vs exceptions, the exception hierarchy, common built-ins, reading tracebacks | ⬜ |
| **[02 - Error Handling](./02-Error_Handling/README.md)** | `try`/`except`, multiple handlers, the exception object, catching only what you can handle | ⬜ |
| **[03 - Error Handling 2](./03-Error_Handling_2/README.md)** | `else`, `finally`, `raise`, custom exceptions, exception chaining | ⬜ |
| **[04 - Exercises - Error Handling](./04-Exercises_Error_Handling/README.md)** | Boundary validation, EAFP vs LBYL, safe access, converting low-level errors into domain errors | ⬜ |
| **[05 - Error Handling 3](./05-Error_Handling_3/README.md)** | Custom exception hierarchies, `from exc` vs `from None`, traceback inspection, handling at the right boundary | ⬜ |
| **[Quiz — Error Handling](./quiz.md)** | Self-assessment covering exceptions, handlers, raising, chaining and tracebacks | ⬜ |

## 🎯 Module Objective

Write Python that fails clearly and recovers intentionally: recognize common exception types, read tracebacks from the bottom up, handle only the errors you can actually resolve, and add context with your own exception classes rather than swallowing problems. By the end, you should be comfortable using `try`/`except`/`else`/`finally`, choosing handler order correctly, raising and re-raising exceptions safely, and chaining errors so the original cause survives debugging.

## 🎓 Course Video

`~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/`
