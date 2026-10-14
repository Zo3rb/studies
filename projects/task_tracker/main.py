"""Entry point for the terminal task tracker."""

from storage import load_tasks, save_tasks
from task import Task


def display_tasks(tasks: list[Task]) -> None:
    """Print all tasks and their current status.

    Args:
        tasks: The tasks to display.
    """
    if not tasks:
        print("No tasks yet.")
        return

    for number, task in enumerate(tasks, start=1):
        print(f"{number}. {task}")


def persist_tasks(tasks: list[Task]) -> bool:
    """Save tasks and report whether saving succeeded.

    Args:
        tasks: The tasks to save.

    Returns:
        True if saving succeeded; otherwise, False.
    """
    try:
        save_tasks(tasks)
    except OSError as error:
        print(f"Could not save tasks: {error}")
        return False

    return True


def run_menu() -> None:
    """Show the main menu until the user chooses to exit."""
    try:
        tasks = load_tasks()
    except (OSError, ValueError) as error:
        print(f"Could not load tasks: {error}")
        return

    while True:
        print("\nTask Tracker")
        print("1. Add a task")
        print("2. List tasks")
        print("3. Mark a task as complete")
        print("4. Exit")

        choice = input("Choose an option: ").strip()

        match choice:
            case "1":
                title = input("Enter the task title: ").strip()

                if not title:
                    print("The task title cannot be empty.")
                else:
                    task = Task(title)
                    tasks.append(task)

                    if persist_tasks(tasks):
                        print("Task added.")
                    else:
                        tasks.pop()

            case "2":
                display_tasks(tasks)

            case "3":
                if not tasks:
                    print("There are no tasks to complete.")
                    continue

                display_tasks(tasks)
                task_number = input(
                    "Enter the number of the task to complete: "
                ).strip()

                selected_task: Task | None = None

                for number, task in enumerate(tasks, start=1):
                    if str(number) == task_number:
                        selected_task = task
                        break

                if selected_task is None:
                    print("That task number is not in the list.")
                else:
                    previous_status = selected_task.completed
                    selected_task.mark_completed()

                    if persist_tasks(tasks):
                        print(f"Marked '{selected_task.title}' as complete.")
                    else:
                        selected_task.completed = previous_status

            case "4":
                print("Goodbye!")
                break

            case _:
                print("Invalid choice. Enter 1, 2, 3, or 4.")


def main() -> None:
    """Start the task tracker."""
    run_menu()


if __name__ == "__main__":
    main()
