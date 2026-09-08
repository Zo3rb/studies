"""Unit tests for Python refresher Session 1 exercises."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

# Add Python/examples directory to sys.path
examples_dir = Path(__file__).resolve().parent.parent / "examples"
if str(examples_dir) not in sys.path:
    sys.path.insert(0, str(examples_dir))

import importlib.util

# Load module 01_session
spec = importlib.util.spec_from_file_location("session01", examples_dir / "01_session.py")
session01 = importlib.util.module_from_spec(spec)  # type: ignore
spec.loader.exec_module(session01)  # type: ignore


class TestSession01(unittest.TestCase):
    """Test suite for Session 1 functions."""

    def test_validated_numbers_happy_path(self) -> None:
        """Test validated_numbers with standard numeric sequences."""
        result = list(session01.validated_numbers([1, 2, 3]))
        self.assertEqual(result, [1.0, 2.0, 3.0])

        result_negative = list(session01.validated_numbers([-5.5, 0, 10.2]))
        self.assertEqual(result_negative, [-5.5, 0.0, 10.2])

    def test_validated_numbers_exceptions(self) -> None:
        """Test type and value exceptions in validated_numbers."""
        with self.assertRaises(TypeError):
            list(session01.validated_numbers([1, True]))

        with self.assertRaises(TypeError):
            list(session01.validated_numbers([1, "two"]))

        with self.assertRaises(ValueError):
            list(session01.validated_numbers([1, float("nan")]))

        with self.assertRaises(ValueError):
            list(session01.validated_numbers([1, float("inf")]))

    def test_transform_positive_scale_happy_path(self) -> None:
        """Test transform_positive_scale positive scaling logic."""
        res1 = session01.transform_positive_scale([-2, 3, 0, 5], 2.0)
        self.assertEqual(res1, [6.0, 10.0])

        res2 = session01.transform_positive_scale([2.5, 4.0], 3.0)
        self.assertEqual(res2, [7.5, 12.0])

        res_empty = session01.transform_positive_scale([-1, -5, 0])
        self.assertEqual(res_empty, [])

    def test_transform_positive_scale_exceptions(self) -> None:
        """Test type validation in transform_positive_scale."""
        with self.assertRaises(TypeError):
            session01.transform_positive_scale([1, "a"])

        with self.assertRaises(TypeError):
            session01.transform_positive_scale([1, 2], "factor")

    def test_in_place_pad_vector_happy_path(self) -> None:
        """Test in-place vector padding identity and values."""
        vec = [1, 2]
        res = session01.in_place_pad_vector(vec, 4, 0)
        self.assertIs(res, vec)
        self.assertEqual(vec, [1, 2, 0, 0])

        vec2 = [1, 2, 3]
        res2 = session01.in_place_pad_vector(vec2, 2)
        self.assertEqual(res2, [1, 2, 3])

    def test_in_place_pad_vector_exceptions(self) -> None:
        """Test exception handling in in_place_pad_vector."""
        with self.assertRaises(TypeError):
            session01.in_place_pad_vector("not a list", 4)  # type: ignore

        with self.assertRaises(ValueError):
            session01.in_place_pad_vector([1, 2], -1)

    def test_vector_add_constant_happy_path(self) -> None:
        """Test vector_add_constant out-of-place vector addition."""
        orig = [1, 2, 3]
        res = session01.vector_add_constant(orig, 10)
        self.assertIsNot(res, orig)
        self.assertEqual(orig, [1, 2, 3])
        self.assertEqual(res, [11, 12, 13])

    def test_vector_add_constant_exceptions(self) -> None:
        """Test exception handling in vector_add_constant."""
        with self.assertRaises(TypeError):
            session01.vector_add_constant([1, "2"], 10)  # type: ignore

    def test_summarize_series_happy_path(self) -> None:
        """Test summary statistics calculation for positive numbers."""
        count, total, mean = session01.summarize_series([-2, 4, 6, 0])
        self.assertEqual(count, 2)
        self.assertAlmostEqual(total, 10.0)
        self.assertAlmostEqual(mean, 5.0)

        c0, t0, m0 = session01.summarize_series([-3, 0, -1])
        self.assertEqual((c0, t0, m0), (0, 0.0, 0.0))

        c_empty, t_empty, m_empty = session01.summarize_series([])
        self.assertEqual((c_empty, t_empty, m_empty), (0, 0.0, 0.0))

    def test_summarize_series_exceptions(self) -> None:
        """Test invalid types in summarize_series."""
        with self.assertRaises(TypeError):
            session01.summarize_series([1, "two"])


if __name__ == "__main__":
    unittest.main()
