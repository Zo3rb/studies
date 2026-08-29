"""Acceptance tests for the Day 3 task. Do not edit these tests."""

import unittest

from src.topic_tracker import (
    build_topic_report,
    count_topics,
    get_unique_topics,
    record_topic,
)


class TestRecordTopic(unittest.TestCase):
    def test_record_topic_appends_to_the_existing_list(self):
        topics = ["Variables"]

        result = record_topic(topics, "Functions")

        self.assertIsNone(result)
        self.assertEqual(topics, ["Variables", "Functions"])

    def test_record_topic_can_start_a_new_list(self):
        topics = []

        record_topic(topics, "Lists")

        self.assertEqual(topics, ["Lists"])


class TestCountTopics(unittest.TestCase):
    def test_count_topics_counts_each_repeated_topic(self):
        topics = ["Variables", "Loops", "Variables", "Lists"]

        self.assertEqual(
            count_topics(topics),
            {"Variables": 2, "Loops": 1, "Lists": 1},
        )

    def test_count_topics_does_not_modify_the_original_list(self):
        topics = ["Sets", "Sets"]

        count_topics(topics)

        self.assertEqual(topics, ["Sets", "Sets"])


class TestGetUniqueTopics(unittest.TestCase):
    def test_get_unique_topics_removes_duplicates(self):
        topics = ["Lists", "Dictionaries", "Lists", "Sets"]

        self.assertEqual(get_unique_topics(topics), {"Lists", "Dictionaries", "Sets"})


class TestBuildTopicReport(unittest.TestCase):
    def test_build_topic_report_combines_session_and_unique_counts(self):
        topics = ["Variables", "Loops", "Variables", "Lists"]

        self.assertEqual(
            build_topic_report(topics),
            "Study sessions: 4 | Unique topics: 3",
        )
