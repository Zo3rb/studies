# Python Course Workspace

This folder contains the Python refresher based on
[Python for Everybody (PY4E)](https://www.py4e.com/).

The aim is to rebuild practical fluency from the beginning, then connect
Python to software engineering, data processing, databases, and AI/ML.
Because there is already a software engineering degree and previous coding
experience, familiar material can be reviewed quickly while rusty concepts
receive deeper practice.

## Current status

- Replit/Linux setup: skipped
- First diagnostic session: complete
- Reviewed:
  - list mutation and rebinding;
  - object identity;
  - `+` versus `+=`;
  - functions, loops, and conditions;
  - return values and edge cases;
  - basic assertions and code review.
- Next topic: strings and parsing

## PY4E roadmap

The official PY4E sequence covers:

1. Introduction
2. Variables
3. Conditionals
4. Functions
5. Iterations
6. Strings
7. Files
8. Lists
9. Dictionaries
10. Tuples
11. Regular expressions
12. Networked programs
13. Python and web services
14. Python objects
15. Python and databases
16. Data visualization

Official lesson index:
[py4e.com/lessons](https://www.py4e.com/lessons)

## Study method

For each lesson:

1. Read or watch a short section.
2. Explain the central concept in your own words.
3. Predict the output of a small example.
4. Write the exercise yourself.
5. Run it and inspect errors.
6. Add edge-case tests.
7. Refactor for clarity and document the lesson.

The assistant will help by explaining concepts, reviewing attempts, giving
hints before solutions, creating variations, and maintaining the notes.

## Engineering practices

- Use four spaces for indentation.
- Prefer small functions with one responsibility.
- Choose descriptive names.
- Avoid accidental mutation of shared data.
- Handle empty input and invalid input deliberately.
- Use assertions or a test framework to verify behavior.
- Add type annotations to function interfaces and validate external input at
  the boundary using the standard library.
- Use virtual environments for project dependencies.
- Keep secrets and configuration outside source code.
- Use Git for meaningful, incremental changes.
- Add type annotations to function parameters and return values.
- Give every module and function a docstring with `Args`, `Returns`, and
  `Raises` sections where applicable.
- Add `#!/usr/bin/env python3` to standalone runnable scripts.
- Use logging instead of scattered debug prints in larger programs.

## Folder structure

```text
Python/
  README.md
  notes/       Concept explanations and study records
  examples/    Small runnable demonstrations
  exercises/   Exercises to attempt before reading solutions
```

## Run the examples

From the workspace root:

```bash
python3 Python/examples/01_session.py
```

## Next checkpoint: strings

The next Python session will cover:

- indexing and slicing;
- `strip`, `split`, `join`, and `replace`;
- searching and parsing text;
- converting strings to numbers;
- writing a small parser with tests.
