"""Day 4 starter code for the Learning Journal Reliability."""


def add_topic(topics: list[str], topic: str) -> None:
    """Append the topic to the list, validating its type and value.

    Args:
        topics (list[str]): The mutable list of recorded study topics.
        topic (str): The topic to add to the list.

    Raises:
        TypeError: If the topic is not a string.
        ValueError: If the topic is an empty string.
    """
    if not isinstance(topic, str):
        raise TypeError("The topic must be a string to be added to the Topics.")
    if not topic:
        raise ValueError(
            "Please add a valid topic value to be added to the topics list."
        )
    topics.append(topic)


def remove_topic(topics: list[str], topic: str) -> None:
    """Remove the topic from the list.

    Args:
        topics (list[str]): The mutable list of recorded study topics.
        topic (str): The topic to remove.

    Raises:
        ValueError: If the topic is not found in the list.
    """
    try:
        topics.remove(topic)
    except ValueError:
        raise ValueError("The topic is not in the Topics list.")


def get_topic_at_index(topics: list[str], index: int) -> str:
    """Retrieve the topic at the specific index.

    Args:
        topics (list[str]): The list of topics.
        index (int): The position to retrieve.

    Returns:
        str: The topic string.

    Raises:
        ValueError: If the index is out of bounds.
    """
    try:
        return topics[index]
    except IndexError:
        raise ValueError("Index out of bounds")
