"""Acceptance tests for the Day 1 task. Do not edit these tests."""

import unittest

from src.session_summary import build_heading, format_session


class TestSessionSummary(unittest.TestCase):
    def test_build_heading_returns_learner_heading(self):
        self.assertEqual(build_heading("Ali"), "Ali's Learning Journal")

    def test_format_session_returns_all_session_values(self):
        result = format_session("Variables", 8, 60)

        self.assertEqual(result, "Topic: Variables | Lessons: 8 | Time: 60 minutes")
