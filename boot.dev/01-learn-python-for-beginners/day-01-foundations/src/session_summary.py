"""Day 1 starter code for the Learning Journal CLI."""


def build_heading(learner_name: str) -> str:
    """Return a heading for a learner's journal.

    Args:
        learner_name (str): The learner's name.

    Returns:
        str: The formatted journal heading.
    """

    return f"{learner_name}'s Learning Journal"


def format_session(topic: str, lessons_completed: int, minutes_studied: int) -> str:
    """Return a formatted summary of one study session.

    Args:
        topic (str): The topic studied.
        lessons_completed (int): The number of completed lessons.
        minutes_studied (int): The duration of the session in minutes.

    Returns:
        str: The formatted study-session summary.
    """

    return f"Topic: {topic} | Lessons: {lessons_completed} | Time: {minutes_studied} minutes"
