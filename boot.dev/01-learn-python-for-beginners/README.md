# Learn Python for beginners

This folder is a companion to Boot.dev's course—not a replacement for it. Complete
the Boot.dev lessons first, then use the small local project to apply only the
concepts you have already encountered.

## This week's project: Learning Journal CLI

Build a command-line program that records a study session and prints a useful
summary. It starts as a single script on Day 1 and gains modules, data
structures, error handling, type hints, and tests as the course reaches those
topics. It uses only Python's standard library.

Start here: [`day-01-foundations/instructions.txt`](./day-01-foundations/instructions.txt).
Use [`learning-workflow.txt`](./learning-workflow.txt) as the repeatable routine
for every study day.

## Four-day course plan

| Day | Course chapters | Project milestone |
| --- | --- | --- |
| 1 (today) | Introduction, Variables, Functions, Scope | Print one well-formatted study-session summary |
| 2 | Testing & Debugging, Computing, Comparisons, Loops | Validate a session and report its study level |
| 3 | Lists, Dictionaries, Sets | Summarize several study sessions and their topics |
| 4 | Errors, Type Hints, Practice, Quiz | Finish the CLI safely, with type hints and standard-library tests |

Do not skip or rush Boot.dev exercises to work on the project. When a milestone
asks for a construct you have not studied yet, leave it for the appropriate day.

## Folder layout

```text
01-learn-python-for-beginners/
├── README.md                  # module overview and four-day plan
├── day-01-foundations/        # today's task, source file, and tests
├── day-02-control-flow/       # next concepts and task
├── day-03-collections/        # next concepts and task
├── day-04-reliability/        # final concepts and task
├── learning-workflow.txt      # day-by-day study and review routine
└── notes/                     # your own course notes and reflections
```

## Working agreement

- Use Python's standard library only. There is no virtual environment today.
- Create a virtual environment only if a future, explicitly chosen dependency
  requires it; record the reason and dependency in the module README.
- Keep Boot.dev solutions and project code separate. Write your own solutions;
  only bring the *idea* you learned into this project.
- Commit after each completed day with a message such as `day 1: session summary`.

## Test workflow

Every task has tests written with Python's built-in `unittest`; no installation
or virtual environment is required. From a day's directory, run:

```bash
python3 -m unittest discover -s tests -v
```

Tests failing before you write the implementation is expected. Do not change the
tests to make them pass. Implement the requested behavior in `src/`, run the
tests, and then ask for a review of both your code and test output.
