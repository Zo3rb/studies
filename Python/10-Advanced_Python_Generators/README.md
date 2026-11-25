# 🐍 Module 10 — Advanced Python: Generators

## Overview

This module introduces generators as a way to produce values lazily, one at a time, instead of building complete collections in memory. It starts with generator functions and `yield`, then moves through generator expressions, delegation with `yield from`, composition of lazy pipelines, and the practical memory and speed trade-offs involved. It finishes by looking inside generator objects at their suspended frames and state, and by applying the ideas to a Fibonacci generator exercise. Each lesson pairs concise notes with a runnable, dependency-free practice script.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[01 - Generators](./01-Generators/README.md)** | Generator functions, `yield`, `next()`, `StopIteration`, lazy evaluation | ⬜ |
| **[02 - Generators 2](./02-Generators_2/README.md)** | Generator expressions, `yield from`, lazy pipelines, bounded infinite sequences | ⬜ |
| **[03 - Generators Performance](./03-Generators_Performance/README.md)** | Memory vs speed, early termination, streaming, measuring with `timeit` and `tracemalloc` | ⬜ |
| **[04 - Under The Hood Of Generators](./04-Under_The_Hood_Of_Generators/README.md)** | Generator objects, suspended frames, `send()`, `close()`, `throw()`, generator states | ⬜ |
| **[05 - Exercise - Fibonacci Numbers](./05-Exercise_Fibonacci_Numbers/README.md)** | Infinite and bounded Fibonacci generators, `islice`, `takewhile`, iterative state | ⬜ |
| **[Quiz — Generators](./quiz.md)** | Self-assessment covering yield, laziness, performance, internals, Fibonacci... | ⬜ |

## 🎯 Module Objective

Build the ability to read and write lazy Python: distinguish iterables, iterators and generators; create generator functions and expressions that produce values on demand; consume them safely with `next()`, `for` loops and `itertools`; and explain what is happening in a generator's suspended frame. By the end, you should be able to choose generators where they genuinely help, measure rather than guess about performance, and implement bounded or infinite sequences such as Fibonacci without unnecessary memory use.

## 🎓 Course Video

`~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/`
