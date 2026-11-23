#!/usr/bin/env python3
"""Practice for Lesson 09: Encapsulation — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 09: Encapsulation")
    print("=" * 64)

    print("\n--- [1] Behavior controls state ---")
    class Account:
        def __init__(self, owner, balance=0):
            self.owner = owner
            self._ledger = []
            self.balance = balance       # goes through the property setter

        @property
        def balance(self):
            return self._current

        @balance.setter
        def balance(self, value):
            if value < 0:
                raise ValueError("balance cannot be negative")
            self._current = value

        def deposit(self, amount):
            if amount <= 0:
                raise ValueError("deposit must be positive")
            self.balance += amount
            self._ledger.append(f"+{amount}")

        def history(self):
            return tuple(self._ledger)

    print("\n--- [2] Using the public interface ---")
    account = Account("Ada", 100)
    account.deposit(50)
    print("balance:", account.balance)
    print("history:", account.history())

    print("\n--- [3] Validation protects invariants ---")
    try:
        account.balance = -10
    except ValueError as exc:
        print("ValueError:", exc)
    try:
        account.deposit(-5)
    except ValueError as exc:
        print("ValueError:", exc)
    print("balance after errors:", account.balance)

    print("\n--- [4] Internals are reachable by convention only ---")
    print("'_ledger' in __dict__:", "_ledger" in account.__dict__)
    print("please do not touch:", account._ledger)

    print("\nLesson 09 practice completed successfully!")


if __name__ == "__main__":
    main()
