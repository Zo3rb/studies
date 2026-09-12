# tests/test_06_strings.py

import unittest
from examples import 06_strings_example as str_mod

class TestStrings(unittest.TestCase):
    def test_reverse_string(self):
        self.assertEqual(str_mod.reverse_string('abcd'), 'dcba')

    def test_is_palindrome(self):
        self.assertTrue(str_mod.is_palindrome('Madam'))
        self.assertTrue(str_mod.is_palindrome('A man a plan a canal Panama'))
        self.assertFalse(str_mod.is_palindrome('Python'))

    def test_count_vowels(self):
        self.assertEqual(str_mod.count_vowels('Hello'), 2)
        self.assertEqual(str_mod.count_vowels('bcdfg'), 0)

    def test_remove_whitespace(self):
        self.assertEqual(str_mod.remove_whitespace(' a b c '), 'abc')
        self.assertEqual(str_mod.remove_whitespace('\tHello\nWorld  '), 'HelloWorld')

if __name__ == "__main__":
    unittest.main()
