# 🐍 Module 08 — Advanced Python: Decorators

## Overview

This module introduces decorators from first principles: functions as first-class objects, higher-order functions, wrappers, closures, metadata preservation, decorator factories, stacking, and practical uses such as logging, timing, authorization, and caching. It moves from writing the smallest possible wrapper to reading framework-style decorators and deciding when a decorator is the right tool. Each lesson pairs concise notes with a runnable, dependency-free practice script.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[01 - Decorators](./01-Decorators/README.md)** | Functions as objects, wrappers, and `@decorator` syntax sugar | ⬜ |
| **[02 - Higher Order Functions](./02-Higher_Order_Functions/README.md)** | Functions as arguments, returned functions, callbacks, and closures | ⬜ |
| **[03 - Decorators 2](./03-Decorators_2/README.md)** | `functools.wraps`, argument forwarding, and decorator factories | ⬜ |
| **[04 - Decorators 3](./04-Decorators_3/README.md)** | Stacking order, closure state, caching, and authorization | ⬜ |
| **[05 - Why Do We Need Decorators?](./05-Why_Do_We_Need_Decorators/README.md)** | Cross-cutting concerns: logging, timing, authorization, caching, routes | ⬜ |
| **[Quiz — Decorators](./quiz.md)** | Self-assessment covering first-class functions, wrappers, factories, and stack order... | ⬜ |

## 🎯 Module Objective

Build the ability to write, read, and debug idiomatic decorators: explain why `@` is syntax sugar, preserve function metadata with `@wraps`, configure decorators with factories, predict stacked execution order, and use closures for state. By the end, you should recognize cross-cutting concerns that belong in a reusable wrapper and know when a plain function is clearer.

## 🎓 Course Video

`~/Videos/video_courses/Complete_Python_Developer/08-Advanced Python - Decorators/`
