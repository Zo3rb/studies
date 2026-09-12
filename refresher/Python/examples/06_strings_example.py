# examples/06_strings_example.py


def reverse_string(s: str) -> str:
    """Return the reverse of *s*.

    Args:
        s: Input string.
    Returns:
        Reversed string.
    """
    return s[::-1]


def is_palindrome(s: str) -> bool:
    """Return ``True`` if *s* reads the same forward and backward (case‑insensitive).

    Args:
        s: Input string.
    Returns:
        ``True`` if palindrome, else ``False``.
    """
    cleaned = s.replace(" ", "").lower()
    return cleaned == cleaned[::-1]


def count_vowels(s: str) -> int:
    """Count the number of vowel characters in *s* (a, e, i, o, u, case‑insensitive)."""
    return sum(1 for ch in s.lower() if ch in "aeiou")


def remove_whitespace(s: str) -> str:
    """Return *s* with **all** whitespace characters removed.

    Args:
        s: Input string.
    Returns:
        String without spaces, tabs, newlines.
    """
    return "".join(s.split())


if __name__ == "__main__":
    print(reverse_string("abcd"))
    print(is_palindrome("Madam"))
    print(count_vowels("Hello World"))
    print(remove_whitespace(" a b c "))
