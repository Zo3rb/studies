# 🐍 Module 04 — Python Basics II

## Overview

Python Basics II builds on the fundamentals of variables, data types, and operators by introducing the constructs that make programs actually *do* things. This module walks through conditional logic and the flow of execution, truthiness and logical operators, every major loop construct (`for`, `while`, `range`, `enumerate`, `break`, `continue`, `pass`), and then moves into reusable code with functions, arguments, return values, docstrings, clean-code habits, `*args`/`**kwargs`, the walrus operator, and the full scope rules (`global`, `nonlocal`, and why scope exists at all). Each lesson pairs a short written explanation with a runnable, deterministic practice script so you can test every idea immediately in Python 3.

## Lessons

| Lesson | Topic | Status |
| :--- | :--- | :---: |
| **[01 - Breaking The Flow](./01-Breaking_The_Flow/README.md)** | Sequential execution vs branching; if / elif / else decision points | ⬜ |
| **[02 - Conditional Logic](./02-Conditional_Logic/README.md)** | Comparison operators, Boolean expressions, and combined conditions | ⬜ |
| **[03 - Indentation In Python](./03-Indentation_In_Python/README.md)** | Whitespace-defined blocks, indentation levels, and IndentationError | ⬜ |
| **[04 - Truthy vs Falsey](./04-Truthy_vs_Falsey/README.md)** | Truthiness rules, bool(), and implicit conditions | ⬜ |
| **[05 - Ternary Operator](./05-Ternary_Operator/README.md)** | Conditional expressions: value_if_true if condition else value_if_false | ⬜ |
| **[06 - Short Circuiting](./06-Short_Circuiting/README.md)** | Lazy evaluation of and / or, guard clauses, and operand return values | ⬜ |
| **[07 - Logical Operators](./07-Logical_Operators/README.md)** | and, or, not; truth tables, precedence, and De Morgan's laws | ⬜ |
| **[08 - Exercise - Logical Operators](./08-Exercise_Logical_Operators/README.md)** | Guided practice combining logical operators into validation rules | ⬜ |
| **[09 - is vs ==](./09-is_vs_equality/README.md)** | Identity (is) versus value equality (==); interning and the None singleton | ⬜ |
| **[10 - For Loops](./10-For_Loops/README.md)** | for-in iteration, loop variables, accumulators, and nested loops | ⬜ |
| **[11 - Iterables](./11-Iterables/README.md)** | Iterable protocol, iter()/next(), generators, and iterating dictionaries | ⬜ |
| **[12 - Exercise - Tricky Counter](./12-Exercise_Tricky_Counter/README.md)** | Counter variables, off-by-one thinking, and state changes inside loops | ⬜ |
| **[13 - range()](./13-range/README.md)** | range(start, stop, step): lazy integer sequences and reverse counting | ⬜ |
| **[14 - enumerate()](./14-enumerate/README.md)** | enumerate(iterable, start): index/value pairs in a single loop | ⬜ |
| **[15 - While Loops](./15-While_Loops/README.md)** | Condition-controlled repetition and avoiding infinite loops | ⬜ |
| **[16 - While Loops 2](./16-While_Loops_2/README.md)** | Nested while loops, flags, and simulating user input without stdin | ⬜ |
| **[17 - break, continue, pass](./17-break_continue_pass/README.md)** | Loop control statements and the loop else clause | ⬜ |
| **[18 - Our First GUI](./18-Our_First_GUI/README.md)** | First turtle graphics window, Screen/Turtle objects, headless-safe demo | ⬜ |
| **[19 - Developer Fundamentals IV](./19-Developer_Fundamentals_IV/README.md)** | Developer workflow: decompose problems, read errors, iterate, and verify | ⬜ |
| **[20 - Exercise - Find Duplicates](./20-Exercise_Find_Duplicates/README.md)** | Finding repeated values with sets, dict counters, and order preservation | ⬜ |
| **[21 - Functions](./21-Functions/README.md)** | def, function calls, DRY, and reusable named blocks | ⬜ |
| **[22 - Parameters and Arguments](./22-Parameters_and_Arguments/README.md)** | Positional and keyword arguments, parameter names, and arity errors | ⬜ |
| **[23 - Default Parameters and Keyword Arguments](./23-Default_Parameters_and_Keyword_Arguments/README.md)** | Default values, keyword-only clarity, and the mutable-default trap | ⬜ |
| **[24 - return](./24-return/README.md)** | Return values, early exits, implicit None, and multiple values | ⬜ |
| **[25 - Methods vs Functions](./25-Methods_vs_Functions/README.md)** | Standalone functions vs bound methods; mutating and non-mutating methods | ⬜ |
| **[26 - Docstrings](./26-Docstrings/README.md)** | Module/function docstrings, help(), __doc__, and PEP 257 conventions | ⬜ |
| **[27 - Clean Code](./27-Clean_Code/README.md)** | Meaningful names, small functions, PEP 8, DRY, and avoiding magic numbers | ⬜ |
| **[28 - *args and **kwargs](./28-args_and_kwargs/README.md)** | Arbitrary positional and keyword arguments; packing and unpacking | ⬜ |
| **[29 - Exercise - Functions](./29-Exercise_Functions/README.md)** | Guided function-writing exercise using parameters, defaults, returns, and docstrings | ⬜ |
| **[30 - Walrus Operator](./30-Walrus_Operator/README.md)** | Assignment expressions (:=), introduced in Python 3.8, and their scope | ⬜ |
| **[31 - Scope](./31-Scope/README.md)** | Local vs global scope, name lookup, and the lifetime of variables | ⬜ |
| **[32 - Scope Rules](./32-Scope_Rules/README.md)** | The LEGB rule, closures, builtin shadowing, and enclosing-scope lookup | ⬜ |
| **[33 - global Keyword](./33-global_Keyword/README.md)** | Rebinding module-level names from inside a function with global | ⬜ |
| **[34 - nonlocal Keyword](./34-nonlocal_Keyword/README.md)** | Rebinding enclosing-function variables from nested functions with nonlocal | ⬜ |
| **[35 - Why Do We Need Scope?](./35-Why_Do_We_Need_Scope/README.md)** | The purpose of scope: name isolation, state control, and module namespaces | ⬜ |
| **[Quiz — Python Basics II](./quiz.md)** | Self-assessment covering control flow, loops, functions, scope... | ⬜ |

## 🎯 Module Objective

Write Python programs that make decisions, iterate over data efficiently, and organize behaviour into clear, reusable functions. By the end of this module you should be able to reason about truthy/falsey values, choose the right loop for a problem, control loop flow precisely, design functions with sensible parameters and return values, and predict name resolution using Python's LEGB scope rules.

## 🎓 Course Video

`~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II`
