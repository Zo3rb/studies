# 16-Week Mathematics Roadmap for AI/ML

> A progressive path from algebra fundamentals to the mathematics used in machine learning.
>
> **Study rhythm:** 5 days per week, 60-90 minutes per day
>
> **Rule:** Finish the current course checkpoint before moving to the next course. Watch less, solve more: aim for roughly 30% lessons and 70% exercises.

## The Route

| Order | Course                                                                                | Weeks | Why it matters                                              |
| ----- | ------------------------------------------------------------------------------------- | ----: | ----------------------------------------------------------- |
| 1     | [Algebra 1](https://www.khanacademy.org/math/algebra)                                 |   1-2 | Equations, graphs, functions, and modelling                 |
| 2     | [Algebra 2](https://www.khanacademy.org/math/algebra2)                                |     3 | Exponents, logarithms, systems, and richer functions        |
| 3     | [Precalculus](https://www.khanacademy.org/math/precalculus)                           |     4 | The bridge to calculus and mathematical modelling           |
| 4     | [Linear Algebra](https://www.khanacademy.org/math/linear-algebra)                     |   5-8 | Vectors and matrices: the language of data and ML           |
| 5     | [Statistics and Probability](https://www.khanacademy.org/math/statistics-probability) |  9-12 | Uncertainty, distributions, inference, and model evaluation |
| 6     | [Calculus 1](https://www.khanacademy.org/math/calculus-1)                             | 13-15 | Derivatives, optimization, and gradient descent             |
| 7     | ML mathematics integration                                                            |    16 | Connect the subjects in one practical project               |

### Optional preparation

If fractions, negative numbers, ratios, or basic equations feel rusty, complete the Khan Academy [Arithmetic](https://www.khanacademy.org/math/arithmetic), [Pre-algebra](https://www.khanacademy.org/math/pre-algebra), and [Algebra basics](https://www.khanacademy.org/math/algebra-basics) courses before Week 1. Use the course challenges to test out of material you already know.

## Weekly Plan

### Course 1: Algebra 1

#### Week 1 - Equations and inequalities

**Course:** [Khan Academy Algebra 1](https://www.khanacademy.org/math/algebra)

- Complete lessons on one-variable equations and inequalities.
- Practise simplifying expressions, combining like terms, and using the distributive property.
- Solve at least 25 mixed problems without looking at worked solutions.
- Write a one-page reference sheet for algebraic rules and common mistakes.

**Finish line:** You can rearrange and solve a linear equation and explain every operation used.

#### Week 2 - Functions, lines, and systems

**Course:** [Khan Academy Algebra 1](https://www.khanacademy.org/math/algebra)

- Complete lessons on functions, slope, graphing lines, and systems of equations.
- Practise interpreting slope and intercepts in a real-world situation.
- Solve systems by graphing, substitution, and elimination.
- Complete the Algebra 1 course challenge or a representative mastery quiz.

**Finish line:** You can move confidently between an equation, a table, a graph, and a written description.

### Course 2: Algebra 2

#### Week 3 - Exponents, logarithms, and richer functions

**Course:** [Khan Academy Algebra 2](https://www.khanacademy.org/math/algebra2)

- Complete lessons on exponents, logarithms, polynomials, and function transformations.
- Practise exponential growth and decay, since these appear in data modelling.
- Solve systems and quadratic problems using more than one method.
- Complete the Algebra 2 course challenge or a targeted unit test.

**Finish line:** You can manipulate exponential and logarithmic expressions and recognise the shape of common functions.

### Course 3: Precalculus

#### Week 4 - Functions, trigonometry, and preparation for calculus

**Course:** [Khan Academy Precalculus](https://www.khanacademy.org/math/precalculus)

- Complete lessons on functions, trigonometry, vectors, sequences, and limits intuition.
- Review radians, sine, cosine, and periodic functions.
- Practise reading function behaviour from graphs and equations.
- Take the Precalculus course challenge and record the topics that need review.

**Finish line:** You understand function composition, inverse functions, basic trigonometry, and the idea of approaching a limit.

### Course 4: Linear Algebra

#### Week 5 - Vectors and geometric meaning

**Course:** [Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra)

**Visual companion:** [3Blue1Brown - Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra), chapters 1-3.

- Learn vectors, vector addition, scalar multiplication, length, and direction.
- Study the dot product and its geometric interpretation.
- Implement vector addition, scaling, and dot product with NumPy.
- Draw a short explanation of how a vector represents a point, direction, or feature row.

**Finish line:** You can calculate a dot product and explain what its sign and magnitude mean.

#### Week 6 - Matrices and linear transformations

**Course:** [Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra)

**Visual companion:** [3Blue1Brown - Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra), chapters 4-6.

- Learn matrices, matrix operations, transpose, and matrix-vector multiplication.
- Study matrices as transformations of space rather than only tables of numbers.
- Use NumPy to rotate, scale, reflect, and shear a set of 2D points.
- Explain why matrix multiplication is not generally commutative.

**Finish line:** You can calculate a matrix-vector product and predict the broad effect of a simple transformation.

#### Week 7 - Systems, span, basis, and independence

**Course:** [Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra)

- Complete lessons on systems of equations, span, basis, and linear independence.
- Practise solving small systems by hand and with `numpy.linalg.solve`.
- Connect feature vectors and design matrices to linear regression.
- Work through at least 10 problems involving span or independence.

**Finish line:** You can explain when a system has no solution, one solution, or infinitely many solutions.

#### Week 8 - Determinants, eigenvectors, and review

**Course:** [Khan Academy Linear Algebra](https://www.khanacademy.org/math/linear-algebra)

**Visual companion:** [3Blue1Brown - Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra), chapters 14-15.

- Study determinants, inverses, eigenvalues, and eigenvectors at an intuitive level.
- Compute determinants and eigenvectors for small matrices with NumPy.
- Complete the Linear Algebra course challenge.
- Build a one-page summary of vectors, matrices, transformations, and eigenvectors.

**Finish line:** You can describe why eigenvectors are useful for understanding a transformation or a dataset.

### Course 5: Statistics and Probability

#### Week 9 - Probability foundations

**Course:** [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

**Visual companion:** [StatQuest](https://www.youtube.com/@statquest), probability playlists.

- Learn sample spaces, events, counting, and addition and multiplication rules.
- Simulate coin flips and dice rolls with Python.
- Compare experimental probability with theoretical probability.
- Keep a glossary of probability notation and terms.

**Finish line:** You can model a simple random experiment and calculate the probability of combined events.

#### Week 10 - Conditional probability and Bayes' theorem

**Course:** [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

- Study conditional probability, independence, and Bayes' theorem.
- Implement a small Bayesian update, such as a medical test example.
- Explain false positives, false negatives, precision, and recall in plain language.
- Solve at least 15 conditional-probability problems.

**Finish line:** You can distinguish $P(A|B)$ from $P(B|A)$ and explain why the distinction matters in ML.

#### Week 11 - Random variables and distributions

**Course:** [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

- Learn discrete and continuous random variables.
- Study normal, binomial, and uniform distributions.
- Use NumPy to sample distributions and Matplotlib to plot histograms.
- Compare mean, variance, and standard deviation across simulated samples.

**Finish line:** You can select a sensible distribution for a simple situation and describe its parameters.

#### Week 12 - Descriptive statistics and inference

**Course:** [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability)

- Complete lessons on mean, median, mode, percentiles, variance, and standard deviation.
- Study correlation, covariance, confidence intervals, and hypothesis testing.
- Analyse one small dataset with pandas and write five evidence-based observations.
- Complete the course challenge; optionally continue with [AP/College Statistics](https://www.khanacademy.org/math/ap-statistics).

**Finish line:** You can summarise a dataset, identify misleading conclusions, and explain uncertainty around an estimate.

### Course 6: Calculus 1

#### Week 13 - Limits and derivatives

**Course:** [Khan Academy Calculus 1](https://www.khanacademy.org/math/calculus-1)

**Visual companion:** [3Blue1Brown - Essence of Calculus](https://www.3blue1brown.com/topics/calculus), chapters 1-3.

- Study limits, continuity, the derivative as a rate of change, and basic derivative rules.
- Calculate derivatives of polynomial, exponential, and trigonometric functions.
- Implement a finite-difference numerical derivative in Python.
- Plot a function and its derivative for several examples.

**Finish line:** You can explain a derivative geometrically and calculate one using rules and numerical approximation.

#### Week 14 - Chain rule and multivariable intuition

**Course:** [Khan Academy Calculus 1](https://www.khanacademy.org/math/calculus-1)

**Visual companion:** [3Blue1Brown - Essence of Calculus](https://www.3blue1brown.com/topics/calculus), chapters 4-6.

- Complete lessons on the chain rule, implicit differentiation, and derivative applications.
- Learn the intuition behind partial derivatives and gradients.
- Calculate numerical gradients for simple two-variable functions.
- Connect the chain rule to layers in a neural network.

**Finish line:** You can describe how a small change in an input affects an output through multiple functions.

#### Week 15 - Integrals and optimization

**Course:** [Khan Academy Calculus 1](https://www.khanacademy.org/math/calculus-1)

- Study antiderivatives, definite integrals, and the Fundamental Theorem of Calculus.
- Learn local minima and maxima and how derivatives identify them.
- Implement gradient descent for a one-dimensional quadratic function.
- Complete the Calculus 1 course challenge or a focused review test.

**Finish line:** You can explain why a zero derivative may indicate an optimum and how gradient descent searches for one.

### Week 16 - Mathematics for ML integration project

This week is deliberately project-based: use the previous five courses together instead of beginning another large course.

**Project:** Build a small linear-regression notebook from scratch.

- Use vectors and matrices to represent features and parameters.
- Use descriptive statistics to inspect and standardise a dataset.
- Define mean squared error as the loss function.
- Derive or look up the gradient, then implement gradient descent with NumPy only.
- Plot loss against training steps and explain the result in a short README.

**Recommended references:**

- [Andrew Ng - Machine Learning (Coursera)](https://www.coursera.org/learn/machine-learning)
- [Hands-On Machine Learning notebooks](https://github.com/ageron/handson-ml2)
- [Full Stack Deep Learning](https://fullstackdeeplearning.com/)

**Finish line:** You can explain how algebra, linear algebra, statistics, and calculus each contribute to training and evaluating a simple model.

## Weekly Study Template

Use this rhythm each week:

| Day     | Focus                                                        |
| ------- | ------------------------------------------------------------ |
| Day 1   | Learn the week's first concept and take notes                |
| Day 2   | Complete guided examples and exercises                       |
| Day 3   | Learn the second concept and solve mixed problems            |
| Day 4   | Code or visualise the idea in Python/NumPy                   |
| Day 5   | Take a short quiz, correct mistakes, and update your summary |
| Weekend | Optional catch-up, project work, or rest                     |

## Progress Tracker

- [ ] Weeks 1-2: Algebra 1
- [ ] Week 3: Algebra 2
- [ ] Week 4: Precalculus
- [ ] Weeks 5-8: Linear Algebra
- [ ] Weeks 9-12: Statistics and Probability
- [ ] Weeks 13-15: Calculus 1
- [ ] Week 16: Linear regression from scratch

## What Comes After Week 16?

Once this plan is complete, continue with [Multivariable Calculus](https://www.khanacademy.org/math/multivariable-calculus) for deeper gradient intuition, then move into the ML sequence in [ai-ml-journey/checklist.md](ai-ml-journey/checklist.md). For software-engineering and algorithms work, continue with [Algorithms](https://www.khanacademy.org/computing/computer-science/algorithms) and the [NeetCode Roadmap](https://neetcode.io/roadmap).
