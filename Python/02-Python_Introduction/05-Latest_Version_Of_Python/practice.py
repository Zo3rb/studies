#!/usr/bin/env python3
"""Practice — Lesson 02: Latest Version Of Python | 02 — Python Introduction."""

import platform
import sys


def main():
    print("=" * 68)
    print("  Lesson: Latest Version Of Python")
    print("=" * 68)

    info = sys.version_info
    print("\nThis interpreter:")
    print(f"  platform.python_version(): {platform.python_version()}")
    print(f"  sys.version_info         : {info.major}.{info.minor}.{info.micro}")
    print(f"  release level            : {info.releaselevel} (serial {info.serial})")

    print("\nFeature gates (structural tuple comparison):")
    for version, feature in [
        ((3, 8), "walrus operator :="),
        ((3, 9), "built-in generics list[int]"),
        ((3, 10), "match / case, X | Y unions"),
        ((3, 11), "tomllib, ExceptionGroup"),
        ((3, 12), "type parameter syntax"),
    ]:
        supported = info >= version
        mark = "yes" if supported else "no "
        print(f"  Python {version[0]}.{version[1]:<2} {feature:<30} {mark}")

    print("\nWrong way: string comparison can lie.")
    print(f"  '3.9' > '3.10' → {'3.9' > '3.10'}  (do not do this)")
    print(f"  (3, 9) > (3, 10) → {(3, 9) > (3, 10)}  (correct tuple logic)")

    print("\nRule: code against a supported version range, not the newest headline number.")

if __name__ == "__main__":
    main()

