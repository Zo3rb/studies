"""Acceptance tests for the Day 2 task. Do not edit these tests."""

import unittest

from src.control_flow import build_daily_report, build_progress_bar, classify_session


class TestClassifySession(unittest.TestCase):
    def test_short_session_is_under_thirty_minutes(self):
        self.assertEqual(classify_session(29), "short")

    def test_focused_session_includes_thirty_and_eighty_nine_minutes(self):
        self.assertEqual(classify_session(30), "focused")
        self.assertEqual(classify_session(89), "focused")

    def test_deep_session_includes_ninety_minutes(self):
        self.assertEqual(classify_session(90), "deep")

class TestBuildProgressBar(unittest.TestCase):
    def test_progress_bar_has_completed_and_remaining_markers(self):
        self.assertEqual(build_progress_bar(3, 5), "[###--]")

    def test_progress_bar_can_be_empty_or_complete(self):
        self.assertEqual(build_progress_bar(0, 4), "[----]")
        self.assertEqual(build_progress_bar(4, 4), "[####]")

class TestBuildDailyReport(unittest.TestCase):
    def test_daily_report_combines_the_other_results(self):
        report = build_daily_report("Loops", 45, 3, 5)
        self.assertEqual(report, "Topic: Loops | Level: focused | Progress: [###--]")
