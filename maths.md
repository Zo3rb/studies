# Math Roadmap for Software Engineering & Data Science

### A progressive, step-by-step map using Khan Academy (all links verified)

**How to use this map:** Go phase by phase, in order — each one leans on the last. If a phase looks too easy, use Khan Academy's "Course challenge" (top of each course page) to test out and skip ahead. Every course listed has free videos + practice exercises.

Tags used below: 🔴 Essential · 🟡 Recommended · ⚪ Optional — rated separately for **SWE** (Software Engineering) and **DS** (Data Science).

---

## Phase 0 — Foundations

_Skip this phase entirely if you're already comfortable with fractions, negative numbers, ratios, and basic equations._

- **Arithmetic** — <https://www.khanacademy.org/math/arithmetic>
- **Pre-algebra** — <https://www.khanacademy.org/math/pre-algebra>
- **Algebra basics** — <https://www.khanacademy.org/math/algebra-basics>

`SWE: ⚪ optional` · `DS: ⚪ optional`

---

## Phase 1 — Algebra

_The language every later topic is written in. Don't skip this even if you think you "know algebra" — most gaps in calculus/stats trace back here._

- **Algebra 1** — <https://www.khanacademy.org/math/algebra>
- **Algebra 2** — <https://www.khanacademy.org/math/algebra2>
- **Geometry** — <https://www.khanacademy.org/math/geometry> _(gives you coordinate geometry & vectors intuition — useful for graphics, game dev, and later linear algebra)_

`SWE: 🔴 essential` · `DS: 🔴 essential`

---

## Phase 2 — Trigonometry & Precalculus

_Precalculus is the real bridge into calculus — functions, exponentials, logarithms, sequences, vectors, complex numbers._

- **Trigonometry** — <https://www.khanacademy.org/math/trigonometry>
- **Precalculus** — <https://www.khanacademy.org/math/precalculus>

`SWE: 🟡 recommended` · `DS: 🔴 essential`

---

## Phase 3 — Calculus

_Underpins optimization, gradient descent, loss functions, growth models — the math engine behind most ML._

- **Differential Calculus (Calculus 1)** — <https://www.khanacademy.org/math/calculus-1>
- **Integral Calculus (Calculus 2)** — <https://www.khanacademy.org/math/calculus-2>
- **Multivariable Calculus** — <https://www.khanacademy.org/math/multivariable-calculus> _(gradients, partial derivatives — directly used in training ML models)_
- **Differential Equations** — <https://www.khanacademy.org/math/differential-equations> _(optional — shows up in simulations, control systems, some scientific computing)_

`SWE: 🟡 recommended (Calc 1 at minimum)` · `DS: 🔴 essential (through multivariable)`

---

## Phase 4 — Linear Algebra

_Arguably THE most important single subject for both tracks. Vectors, matrices, and transformations are the native language of data (tables, images, embeddings), computer graphics, and every ML algorithm._

- **Linear Algebra** — <https://www.khanacademy.org/math/linear-algebra>

`SWE: 🔴 essential` · `DS: 🔴 essential`

---

## Phase 5 — Probability & Statistics

_The core toolkit for reasoning about data, uncertainty, and model performance._

- **Statistics and Probability** — <https://www.khanacademy.org/math/statistics-probability>
- **AP®︎/College Statistics** — <https://www.khanacademy.org/math/ap-statistics> _(more rigorous version with fuller practice sets — good second pass or if you want depth)_

`SWE: 🟡 recommended` · `DS: 🔴 essential`

---

## Phase 6 — Discrete Math & CS Theory

_The math specific to how computers and algorithms work: complexity, number theory, logic-adjacent reasoning._

- **Algorithms** — <https://www.khanacademy.org/computing/computer-science/algorithms> _(Big-O notation, binary/insertion/merge sort, graph representation, BFS)_
- **Cryptography** — <https://www.khanacademy.org/computing/computer-science/cryptography> _(modular arithmetic, number theory, RSA — good discrete-math flavor)_

`SWE: 🔴 essential` · `DS: 🟡 recommended`

> **Honest gap to flag:** Khan Academy does **not** have a full standalone Discrete Mathematics course (formal logic, set theory, combinatorics, graph theory, proof techniques). These matter a lot for SWE (technical interviews, algorithm design) and moderately for DS. The two courses above cover a slice of it, but you'll eventually want a dedicated discrete math resource elsewhere to fill this in — Khan Academy just doesn't publish one currently.

---

## Suggested priority if you're short on time

| Phase                               | Software Engineering | Data Science  |
| ----------------------------------- | -------------------- | ------------- |
| Algebra 1 & 2                       | Essential            | Essential     |
| Trig / Precalculus                  | Nice-to-have         | Essential     |
| Calculus 1–2                        | Nice-to-have         | Essential     |
| Multivariable Calculus              | Optional             | Essential     |
| **Linear Algebra**                  | **Essential**        | **Essential** |
| **Statistics & Probability**        | Recommended          | **Essential** |
| Algorithms & Discrete-math-adjacent | **Essential**        | Recommended   |

If you had to pick the two highest-leverage stops for either track, they'd be **Linear Algebra** and **Statistics & Probability** — start there once your algebra is solid if time is tight.

---

## Pacing tip

Each full Khan Academy course (Algebra 1 through Multivariable Calculus) realistically takes **4–8 weeks** at ~5–7 hrs/week if you're doing the exercises, not just watching videos. Linear Algebra and Statistics run a bit shorter since they're more self-contained. Don't rush the algebra/precalc phases — weak fundamentals there are the #1 reason people stall out in calculus or linear algebra later.
