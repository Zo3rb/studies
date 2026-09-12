# tests/test_04_functions.py

import unittest
from examples import 04_functions_example as func_mod

class TestFunctions(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(func_mod.greet("Alice"), "Hello, Alice!")

    def test_factorial(self):
        self.assertEqual(func_mod.factorial(0), 1)
        self.assertEqual(func_mod.factorial(5), 120)
        with self.assertRaises(ValueError):
            func_mod.factorial(-1)

    def test_sum_all(self):
        self.assertEqual(func_mod.sum_all(1, 2, 3, 4), 10)
        self.assertEqual(func_mod.sum_all(), 0)

if __name__ == "__main__":
    unittest.main()
