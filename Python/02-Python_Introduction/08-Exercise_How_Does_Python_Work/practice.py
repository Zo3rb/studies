#!/usr/bin/env python3
"""Practice — Lesson 02: Exercise — How Does Python Work? | 02 — Python Introduction."""

import ast
import dis


def main():
    print("=" * 68)
    print("  Exercise: How Does Python Work?")
    print("=" * 68)

    source = "x = 2 + 3\nprint(x)"

    print("\n[1] Source text:")
    print(source)

    print("\n[2] Abstract Syntax Tree (ast.parse):")
    tree = ast.parse(source)
    print(ast.dump(tree, indent=2))

    print("\n[3] Compiled code object:")
    code = compile(source, "<practice>", "exec")
    print(f"  co_names   : {code.co_names}")
    print(f"  co_consts  : {code.co_consts}")
    print(f"  instruction count: {len(list(dis.get_instructions(code)))}")

    print("\n[4] Bytecode (dis.dis):")
    dis.dis(code)

    print("\n[5] Execution:")
    namespace = {}
    exec(code, namespace)
    user_names = {k: v for k, v in namespace.items() if not k.startswith("__")}
    print(f"  namespace after exec: {user_names}")
    print("  x =", namespace["x"])

if __name__ == "__main__":
    main()

