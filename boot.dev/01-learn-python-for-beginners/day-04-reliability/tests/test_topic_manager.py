"""Acceptance tests for the Day 4 task. Do not edit these tests."""

import unittest

from src.topic_manager import (
    add_topic,
    remove_topic,
    get_topic_at_index,
)


class TestAddTopic(unittest.TestCase):
    def test_add_valid_topic(self):
        topics = []
        add_topic(topics, "Exceptions")
        self.assertEqual(topics, ["Exceptions"])

    def test_add_empty_string_raises_value_error(self):
        topics = []
        with self.assertRaises(ValueError):
            add_topic(topics, "")

    def test_add_non_string_raises_type_error(self):
        topics = []
        with self.assertRaises(TypeError):
            add_topic(topics, 123)


class TestRemoveTopic(unittest.TestCase):
    def test_remove_existing_topic(self):
        topics = ["Loops", "Exceptions"]
        remove_topic(topics, "Loops")
        self.assertEqual(topics, ["Exceptions"])

    def test_remove_non_existent_topic_raises_value_error(self):
        topics = ["Exceptions"]
        with self.assertRaises(ValueError):
            remove_topic(topics, "Loops")


class TestGetTopicAtIndex(unittest.TestCase):
    def test_get_valid_index(self):
        topics = ["Variables", "Functions"]
        self.assertEqual(get_topic_at_index(topics, 1), "Functions")

    def test_get_invalid_index_raises_value_error(self):
        topics = ["Variables"]
        with self.assertRaises(ValueError) as context:
            get_topic_at_index(topics, 5)
        self.assertEqual(str(context.exception), "Index out of bounds")

if __name__ == "__main__":
    unittest.main()
