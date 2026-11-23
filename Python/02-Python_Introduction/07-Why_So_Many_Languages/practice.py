#!/usr/bin/env python3
"""Practice — Lesson 02: Why So Many Languages? | 02 — Python Introduction."""

def main():
    print("=" * 68)
    print("  Lesson: Why So Many Languages?")
    print("=" * 68)

    languages = [
        ("Python", "automation, data, backends", "readability + ecosystem"),
        ("JavaScript", "browser UI, Node", "ubiquitous runtime"),
        ("TypeScript", "large JS apps", "static types at scale"),
        ("C / Rust", "systems, drivers, engines", "control + performance"),
        ("Go", "services, CLIs", "simple concurrency + deploys"),
        ("SQL", "relational data", "declarative querying"),
    ]

    print("\nDifferent tools optimize for different things:")
    for name, niche, strength in languages:
        print(f"  {name:<12} {niche:<28} → {strength}")

    recommendations = {
        "browser ui": "JavaScript / TypeScript",
        "data pipeline": "Python + SQL",
        "device driver": "C or Rust",
        "glue two apis": "Python",
    }
    print("\nA tiny decision helper:")
    for task in recommendations:
        print(f"  {task:<18} → {recommendations[task]}")
    print(f"  {'unfamiliar task':<18} → use what the team already maintains")

    print("\nPython's deal: developer speed and readable code; libraries supply the hot loops.")

if __name__ == "__main__":
    main()

