# 📖 Lesson: Jupyter Notebooks

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0095. Jupyter Notebooks.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Installing and running Jupyter, understanding the notebook document format, and using the notebook workflow effectively. We cover the difference between the classic Notebook interface and JupyterLab, how kernels execute cells, and the keyboard shortcuts that make cell-based exploration fast. The lesson closes on when to use a notebook and when to move working code into ordinary `.py` files.

---

## 📝 Key Concepts

### 1. Install and Start Jupyter

Install into your chosen interpreter with `python -m pip install jupyterlab` (or `jupyter`), then launch with `jupyter lab` or `jupyter notebook`. A browser opens at a local address such as `localhost:8888` with a token in the URL; the terminal running the server must stay open. Shut it down cleanly with `Ctrl+C` in that terminal.

```python
import importlib.util

for module in ("IPython", "jupyter", "nbformat"):
    print(f"{module:<10} importable: {importlib.util.find_spec(module) is not None}")
```

### 2. Cells, Kernels, and Execution Order

A notebook is a JSON `.ipynb` file containing code cells, Markdown cells, and stored outputs. The kernel is the interpreter process that executes code; it starts when you open the notebook and holds state between cells. `Shift + Enter` runs the current cell and moves on, `Ctrl + Enter` runs in place, and **Run All** executes top to bottom. Because cells can be run out of order, the visible state may not match the file — use **Restart & Run All** before trusting results.

```python
# One cell: import and compute
total = sum(range(1, 6))
print(total)  # 15

# A later cell can reuse 'total' because the kernel keeps state.
print(f"Double it: {total * 2}")
```

### 3. Modes and Practical Workflow

Press `Esc` for command mode (`A` insert above, `B` below, `D D` delete, `M` to Markdown, `Y` to code) and `Enter` to return to edit mode. Notebooks shine for exploration, plotting, and step-by-step teaching. For reusable programs, move finished functions into `.py` modules and import them from the notebook, and clear outputs before committing so diffs stay small.

```python
cell_sources = {
    "markdown": "# Analysis notes\nExplain the question in prose.",
    "code": "values = [1, 2, 3]\nprint(sum(values))",
}
print(cell_sources["code"])
```

---

## ⚠️ Gotchas & Pro Tips

1. **Kernel mismatch** — if a package is missing, check *Kernel → Change Kernel*; the notebook may be using an interpreter different from the one where you installed it.
2. **Hidden state** — variables survive cell deletion, so a notebook can appear to work while depending on a cell that no longer exists; restart and run all to verify.
3. **Not a production file format** — notebooks are poor for large applications and awkward in code review; extract stable logic into modules.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
