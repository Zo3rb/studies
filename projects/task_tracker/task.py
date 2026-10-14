"""Model individual tasks for the task tracker."""


class Task:
    """Represents one task and its completion"""

    def __init__(self, title: str, completed: bool = False) -> None:
        """Initialize a task.

        Args:
            title (str): The text describing the task.
            completed: Whether the task is complete.

        Raises:
            TypeError: If title or completed has the wrong type.
            ValueError: If title is empty or whitespace only.
        """

        if not isinstance(title, str):
            raise TypeError("title must be a string.")
        if not isinstance(completed, bool):
            raise TypeError("completed must be a boolean.")

        cleaned_title = title.strip()
        if not cleaned_title:
            raise ValueError("title cannot be empty.")

        self.title = cleaned_title
        self.completed = completed

    def mark_completed(self) -> None:
        """Mark this task as completed."""
        self.completed = True

    def to_dict(self) -> dict[str, str | bool]:
        """Convert this task into values that can be saved as JSON.
        Returns:
            A dictionary containing the task's title and completion status.
        """
        return {
            "title": self.title,
            "completed": self.completed,
        }

    @classmethod
    def from_dict(cls, data: dict[str, object]) -> "Task":
        """Create a task from values read from JSON.
        Args:
            data: A dictionary containing the task's saved values.
        Returns:
            A task created from the dictionary.
        Raises:
            ValueError: If the dictionary has missing or incorrectly typed values.
        """
        title = data.get("title")
        completed = data.get("completed")
        if not isinstance(title, str):
            raise ValueError("'title' must be a string.")
        if not isinstance(completed, bool):
            raise ValueError("'completed' must be a boolean.")
        return cls(title=title, completed=completed)

    def __str__(self) -> str:
        """Return a readable description of this task."""
        status = "done" if self.completed else "not done"
        return f"[{status}] {self.title}"
