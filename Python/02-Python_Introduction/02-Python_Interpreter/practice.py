#!/usr/bin/env python3
"""Practice — Lesson 02: Python Interpreter | 02 — Python Introduction."""

import platform
import sys


def main():
    print("=" * 68)
    print("  Lesson: Python Interpreter")
    print("=" * 68)

    print("\nRuntime identity:")
    print(f"  implementation : {platform.python_implementation()}")
    print(f"  version        : {platform.python_version()}")
    print(f"  executable     : {sys.executable}")
    print(f"  default encoding: {sys.getdefaultencoding()}")

    print("\nImport machinery:")
    print(f"  modules already cached: {len(sys.modules)}")
    import math
    print(f"  math.sqrt(81) = {math.sqrt(81)}")
    print(f"  math cached now: {'math' in sys.modules}")

    print("\nSource → bytecode demo:")
    source = "def add(a, b):\n    return a + b"
    code = compile(source, "<practice>", "exec")
    namespace = {}
    exec(code, namespace)
    print(f"  bytecode instructions: {len(list(__import__('dis').get_instructions(code)))}")
    print(f"  add(2, 3) = {namespace['add'](2, 3)}")

    print("\nTry REPL mode with: python3   |   one-liner mode: python3 -c \"print(2 ** 8)\"")

if __name__ == "__main__":
    main()

