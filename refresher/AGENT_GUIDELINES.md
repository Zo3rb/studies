# 🤖 AI Agent Guidelines for Refresher Workspace

This document defines the governing principles, coding standards, and pedagogical guidelines for any AI Agent or LLM working within this `refresher` study repository.

---

## 🎯 Core Purpose & Philosophy

The user is refreshing their **Python** and **PostgreSQL** foundation (PY4E & PG4E by Dr. Charles Severance) as a direct stepping stone toward advanced studies in **Mathematics** and **Data Structures & Algorithms (DSA)**.

Every interaction, code example, and exercise must bridge basic programming syntax with **algebraic thinking, computational complexity ($O(N)$ time/space), edge-case validation, and software engineering rigor**.

---

## 📜 Principles for AI Assistance

### 1. Socratic & Progressive Guidance

- **Never reveal full solutions immediately** unless explicitly requested by the user.
- Provide clean function signatures with `raise NotImplementedError("Implement me!")` stubs.
- Include 3–4 commented test case examples under each function demonstrating inputs, outputs, and exception behavior.
- Lead the user to discover mathematical relationships and algorithm efficiency trade-offs.

### 2. Standard Library Type Annotations & Validation

- **Strictly use Python Standard Library components.** Do NOT introduce third-party type-checking libraries (e.g. Pydantic, mypy-extensions).
- Use `from __future__ import annotations` at the top of Python files to enable clean modern typing syntax (`int | float`, `list[int]`, `dict[str, Any]`, `tuple[int, ...]`).
- Use standard library types from `typing` and `collections.abc` (`Iterable`, `Iterator`, `Sequence`, `Callable`, `Any`, `TypeVar`).
- Perform explicit runtime type & value validation at system boundaries (e.g., `isinstance(x, bool)`, `isinstance(x, (int, float))`, `math.isfinite(x)`).

### 3. Documentation Standards (PEP 8 & Google Style)

- Strict compliance with **PEP 8** formatting (snake_case functions/variables, 88–100 char max line width, clean whitespace).
- All functions must feature comprehensive **Google Docstrings**:

  ```python
  def function_name(param1: type1, param2: type2) -> return_type:
      """Short summary line ending with a period.

      Detailed description if needed.

      Args:
          param1: Description of param1.
          param2: Description of param2.

      Returns:
          return_type: Description of return value.

      Raises:
          TypeError: Conditions under which TypeError is raised.
          ValueError: Conditions under which ValueError is raised.
      """
  ```

### 4. Unit Testing Protocol

- Tests **must** be written using Python's standard `unittest` module in a dedicated `Python/tests/` directory.
- Test suites must cover:
  1. Happy path (normal expected inputs).
  2. Edge cases (empty inputs, zero, negative numbers, floating-point precision).
  3. Boundary & Error validation (`assertNotEqual`, `assertRaises`, `assertAlmostEqual`).

### 5. Maths & DSA Bridges in Notes

- In `Python/notes/` and `PostgreSQL/notes/`, always include a dedicated **"🧠 Maths & DSA Insights"** section.
- Highlight:
  - **Time Complexity ($O$)**: e.g., $O(1)$ lookup in hash maps/dicts vs $O(N)$ search in lists.
  - **Space Complexity ($O$)**: e.g., $O(1)$ auxiliary space in generator expressions vs $O(N)$ list allocations.
  - **Numeric Precision**: IEEE 754 floating-point caveats, exact decimal representation, `math.isclose()`.
  - **Algorithmic Patterns**: Accumulator pattern, two-pointer approach, sliding window, immutability vs mutation.

---

## 📁 Directory Structure Standard

```text
refresher/
├── AGENT_GUIDELINES.md          # This file
├── STUDY_PLAN.md                # Overall study roadmap
├── Python/
│   ├── README.md                # Python track overview
│   ├── examples/                # Exercise stubs & runnable examples
│   ├── tests/                   # Standard unittest test suites
│   ├── notes/                   # Theory notes with Maths & DSA Insights
│   └── exercises/               # Independent problem sets & markdown tasks
└── PostgreSQL/
    ├── README.md                # PostgreSQL track overview
    ├── notes/                   # SQL concepts & query optimization notes
    └── exercises/               # DDL/DML exercises & queries
```

---

_By following these guidelines, AI agents ensure a consistent, rigorous, and rewarding learning environment for the user._
