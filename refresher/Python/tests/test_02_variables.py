"""Unit tests for Python refresher Session 2 exercises."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

# Add Python/examples directory to sys.path
examples_dir = Path(__file__).resolve().parent.parent / "examples"
if str(examples_dir) not in sys.path:
    sys.path.insert(0, str(examples_dir))

import importlib.util

# Load module 02-variables-expressions-and-statements.py
file_path = examples_dir / "02-variables-expressions-and-statements.py"
spec = importlib.util.spec_from_file_location("session02", file_path)
session02 = importlib.util.module_from_spec(spec)  # type: ignore
spec.loader.exec_module(session02)  # type: ignore


class TestSession02(unittest.TestCase):
    """Test suite for Session 2 functions."""

    def test_analyze_numeric_types_happy_path(self) -> None:
        """Test type analysis on heterogeneous lists."""
        values = [42, 3.14, "42", True, None]
        result = session02.analyze_numeric_types(values)
        expected = [
            ("42", "int"),
            ("3.14", "float"),
            ("'42'", "str"),
            ("True", "bool"),
            ("None", "NoneType"),
        ]
        self.assertEqual(result, expected)

    def test_analyze_numeric_types_exceptions(self) -> None:
        """Test exception when input is not a list."""
        with self.assertRaises(TypeError):
            session02.analyze_numeric_types("not a list")  # type: ignore

    def test_safe_divide_and_modulo_happy_path(self) -> None:
        """Test division and modulo output values."""
        q, fq, r = session02.safe_divide_and_modulo(7, 2)
        self.assertAlmostEqual(q, 3.5)
        self.assertEqual(fq, 3)
        self.assertAlmostEqual(r, 1.0)

        q2, fq2, r2 = session02.safe_divide_and_modulo(10.0, 4.0)
        self.assertAlmostEqual(q2, 2.5)
        self.assertEqual(fq2, 2)
        self.assertAlmostEqual(r2, 2.0)

    def test_safe_divide_and_modulo_exceptions(self) -> None:
        """Test ZeroDivisionError and TypeError in safe_divide_and_modulo."""
        with self.assertRaises(ZeroDivisionError):
            session02.safe_divide_and_modulo(5, 0)

        with self.assertRaises(TypeError):
            session02.safe_divide_and_modulo(5, "2")  # type: ignore

    def test_parse_and_scale_inputs_happy_path(self) -> None:
        """Test parsing strings and scaling float values."""
        v1, v2 = session02.parse_and_scale_inputs("36", "2.75", 2.0)
        self.assertAlmostEqual(v1, 72.0)
        self.assertAlmostEqual(v2, 5.5)

    def test_parse_and_scale_inputs_exceptions(self) -> None:
        """Test parsing invalid numeric strings."""
        with self.assertRaises(ValueError):
            session02.parse_and_scale_inputs("abc", "2.75")

        with self.assertRaises(TypeError):
            session02.parse_and_scale_inputs(36, "2.75")  # type: ignore

    def test_calculate_gross_pay_happy_path(self) -> None:
        """Test regular pay and overtime pay calculations."""
        # Regular pay (35 hours @ 10/hr)
        self.assertAlmostEqual(session02.calculate_gross_pay(35, 10.0), 350.0)

        # Overtime pay (45 hours @ 10/hr => 40*10 + 5*15 = 475.0)
        self.assertAlmostEqual(session02.calculate_gross_pay(45, 10.0), 475.0)

    def test_calculate_gross_pay_exceptions(self) -> None:
        """Test negative inputs and type validation for calculate_gross_pay."""
        with self.assertRaises(ValueError):
            session02.calculate_gross_pay(-1, 10.0)

        with self.assertRaises(TypeError):
            session02.calculate_gross_pay(40, "10.0")  # type: ignore

    def test_celsius_to_fahrenheit_happy_path(self) -> None:
        """Test temperature conversion values."""
        self.assertAlmostEqual(session02.celsius_to_fahrenheit(0), 32.0)
        self.assertAlmostEqual(session02.celsius_to_fahrenheit(100), 212.0)
        self.assertAlmostEqual(session02.celsius_to_fahrenheit(-40), -40.0)

    def test_celsius_to_fahrenheit_exceptions(self) -> None:
        """Test type validation for celsius_to_fahrenheit."""
        with self.assertRaises(TypeError):
            session02.celsius_to_fahrenheit("0")  # type: ignore


if __name__ == "__main__":
    unittest.main()
