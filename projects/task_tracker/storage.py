"""Read and write task data using a JSON file."""

import json
from pathlib import Path

from task import Task

DATA_FILE = Path(__file__).with_name("tasks.json")


def load_tasks() -> list[Task]:
    """Load tasks from the JSON file.

    Returns:
        The saved tasks, or an empty list if the file does not exist.

    Raises:
        OSError: If the file cannot be read.
        ValueError: If the file contains invalid JSON or task data.
    """
    if not DATA_FILE.exists():
        return []

    try:
        saved_data = json.loads(DATA_FILE.read_text(encoding="utf-8"))
    except json.JSONDecodeError as error:
        raise ValueError(f"{DATA_FILE.name} contains invalid JSON.") from error

    if not isinstance(saved_data, list):
        raise ValueError(f"{DATA_FILE.name} must contain a JSON list.")

    tasks: list[Task] = []

    for number, record in enumerate(saved_data, start=1):
        if not isinstance(record, dict):
            raise ValueError(f"Task record {number} must be a JSON object.")

        try:
            task = Task.from_dict(record)
        except ValueError as error:
            raise ValueError(f"Invalid task record {number}: {error}") from error

        tasks.append(task)

    return tasks


def save_tasks(tasks: list[Task]) -> None:
    """Save tasks to the JSON file.

    Args:
        tasks: The tasks to save.

    Raises:
        OSError: If the file cannot be written.
    """
    saved_data = [task.to_dict() for task in tasks]
    json_text = json.dumps(saved_data, indent=2)
    DATA_FILE.write_text(f"{json_text}\n", encoding="utf-8")
