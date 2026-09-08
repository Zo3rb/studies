"""Unit tests for Python refresher Session 3 exercises."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

# Add Python/examples directory to sys.path
examples_dir = Path(__file__).resolve().parent.parent / "examples"
if str(examples_dir) not in sys.path:
    sys.path.insert(0, str(examples_dir))

import importlib.util

# Load module 03-conditional-execution.py
file_path = examples_dir / "03-conditional-execution.py"
spec = importlib.util.spec_from_file_location("session03", file_path)
session03 = importlib.util.module_from_spec(spec)  # type: ignore
spec.loader.exec_module(session03)  # type: ignore


class TestSession03(unittest.TestCase):
    """Test suite for Session 3 functions."""

    def test_categorize_number_sign_happy_path(self) -> None:
        """Test numeric classification into positive, negative, and zero."""
        self.assertEqual(session03.categorize_number_sign(10.5), "positive")
        self.assertEqual(session03.categorize_number_sign(-4), "negative")
        self.assertEqual(session03.categorize_number_sign(0), "zero")

    def test_categorize_number_sign_exceptions(self) -> None:
        """Test type and value exceptions in categorize_number_sign."""
        with self.assertRaises(TypeError):
            session03.categorize_number_sign("10")  # type: ignore

        with self.assertRaises(TypeError):
            session03.categorize_number_sign(True)  # type: ignore

        with self.assertRaises(ValueError):
            session03.categorize_number_sign(float("nan"))

    def test_calculate_overtime_pay_safe_happy_path(self) -> None:
        """Test regular and overtime pay parsing and calculation."""
        self.assertAlmostEqual(session03.calculate_overtime_pay_safe("35", "10.0"), 350.0)
        self.assertAlmostEqual(session03.calculate_overtime_pay_safe("45", "10.0"), 475.0)

    def test_calculate_overtime_pay_safe_exceptions(self) -> None:
        """Test invalid string inputs and negative numbers."""
        with self.assertRaises(ValueError):
            session03.calculate_overtime_pay_safe("forty", "10")

        with self.assertRaises(ValueError):
            session03.calculate_overtime_pay_safe("-5", "10")

        with self.assertRaises(TypeError):
            session03.calculate_overtime_pay_safe(35, "10.0")  # type: ignore

    def test_evaluate_score_grade_happy_path(self) -> None:
        """Test grade evaluation for score boundaries."""
        self.assertEqual(session03.evaluate_score_grade(0.95), "A")
        self.assertEqual(session03.evaluate_score_grade(0.85), "B")
        self.assertEqual(session03.evaluate_score_grade(0.75), "C")
        self.assertEqual(session03.evaluate_score_grade(0.65), "D")
        self.assertEqual(session03.evaluate_score_grade(0.50), "F")

    def test_evaluate_score_grade_exceptions(self) -> None:
        """Test out of range scores and invalid types."""
        with self.assertRaises(ValueError):
            session03.evaluate_score_grade(1.5)

        with self.assertRaises(ValueError):
            session03.evaluate_score_grade(-0.1)

        with self.assertRaises(TypeError):
            session03.evaluate_score_grade("A")  # type: ignore

    def test_safe_inverse_and_sqrt_happy_path(self) -> None:
        """Test inverse and sqrt output values."""
        inv, sq = session03.safe_inverse_and_sqrt(4.0)
        self.assertAlmostEqual(inv, 0.25)
        self.assertAlmostEqual(sq, 2.0)

    def test_safe_inverse_and_sqrt_exceptions(self) -> None:
        """Test boundary zero and negative numbers for safe_inverse_and_sqrt."""
        with self.assertRaises(ValueError):
            session03.safe_inverse_and_sqrt(0)

        with self.assertRaises(ValueError):
            session03.safe_inverse_and_sqrt(-4)

    def test_check_range_containment_happy_path(self) -> None:
        """Test inclusive vs exclusive interval checking."""
        self.assertTrue(session03.check_range_containment(5, 1, 10, True))
        self.assertFalse(session03.check_range_containment(10, 1, 10, False))
        self.assertFalse(session03.check_range_containment(0, 1, 10, True))

    def test_check_range_containment_exceptions(self) -> None:
        """Test invalid bounds where low > high."""
        with self.assertRaises(ValueError):
            session03.check_range_containment(5, 10, 1)


if __name__ == "__main__":
    unittest.main()
