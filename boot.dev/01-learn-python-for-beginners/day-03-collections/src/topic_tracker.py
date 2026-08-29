"""Day 3 starter code for the Learning Journal CLI."""


def record_topic(topics: list[str], topic: str) -> None:
    """Append one topic to the supplied list in place.

    Args:
        topics (list[str]): The mutable list of recorded study topics.
        topic (str): The topic to add to the list.

    Returns:
        None: This function modifies ``topics`` directly.
    """
    topics.append(topic)


def count_topics(topics: list[str]) -> dict[str, int]:
    """Return the number of times each topic appears.

    Args:
        topics (list[str]): The study topics to count. Duplicate values are
            counted separately.

    Returns:
        dict[str, int]: A mapping of every topic to its occurrence count.
    """
    topic_counts = {}

    for topic in topics:
        if topic in topic_counts:
            topic_counts[topic] += 1
        else:
            topic_counts[topic] = 1

    return topic_counts


def get_unique_topics(topics: list[str]) -> set[str]:
    """Return each topic once as a set.

    Args:
        topics (list[str]): The recorded study topics, possibly with duplicates.

    Returns:
        set[str]: Every distinct topic from ``topics``.
    """
    return set(topics)


def build_topic_report(topics: list[str]) -> str:
    """Return the total session count and the distinct-topic count.

    Args:
        topics (list[str]): The recorded study topics. Each item represents one
            study session.

    Returns:
        str: A formatted report containing total sessions and unique topics.
    """
    return f"Study sessions: {len(topics)} | Unique topics: {len(get_unique_topics(topics))}"
