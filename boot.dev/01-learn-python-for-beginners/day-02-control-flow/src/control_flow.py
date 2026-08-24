"""Day 2 starter code for the Learning Journal CLI."""


def classify_session(minutes_studied: int) -> str:
    """Return the study level for one session.

    Args:
        minutes_studied (int): The duration of the study session in minutes.

    Returns:
        str: The session level: short, focused, or deep.
    """
    if minutes_studied < 30:
        return "short"
    if minutes_studied < 90:
        return "focused"
    return "deep"


def build_progress_bar(completed: int, goal: int) -> str:
    """Return a progress bar for completed goals.

    Args:
        completed (int): How many goals have been completed.
        goal (int): The total number of goals for the day.

    Returns:
        str: A progress-bar string.
    """
    bar = "["

    for position in range(goal):
        if position < completed:
            bar += "#"
        else:
            bar += "-"

    return f"{bar}]"


def build_daily_report(
    topic: str,
    minutes_studied: int,
    lessons_completed: int,
    lesson_goal: int,
) -> str:
    """Return a report for the current day's study.

    Args:
        topic (str): The topic studied.
        lessons_completed (int): The number of completed lessons.
        minutes_studied (int): The duration of the session in minutes.
        lesson_goal (int): The day's total lesson goal.

    Returns:
        str: A summary of the current day.
    """
    level = classify_session(minutes_studied)
    bar = build_progress_bar(lessons_completed, lesson_goal)

    return f"Topic: {topic} | Level: {level} | Progress: {bar}"
