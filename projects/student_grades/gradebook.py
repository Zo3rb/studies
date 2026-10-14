"""In-memory collection of Students for the grade tracker."""

from student import Student


class Gradebook:
    """Owns and manages a set of Students, keyed case-insensitively by name."""

    def __init__(self) -> None:
        """Create an empty grade book."""
        self._students: dict[str, Student] = {}

    @staticmethod
    def _key(name: str) -> str:
        """Return the normalized dict key for a student name.

        Args:
            name: Raw student name.

        Returns:
            Stripped, lower-cased key.

        Raises:
            TypeError: If name is not a string.
            ValueError: If name is blank after stripping.
        """
        if not isinstance(name, str):
            raise TypeError("Student name must be a string.")
        key = name.strip().lower()
        if not key:
            raise ValueError("Student name must not be blank.")
        return key

    def add_student(self, name: str) -> Student:
        """Add a new student.

        Args:
            name: Display name of the student.

        Returns:
            The newly created Student.

        Raises:
            TypeError: If name is not a string.
            ValueError: If name is blank or already exists (case-insensitive).
        """
        key = self._key(name)
        if key in self._students:
            raise ValueError(f"Duplicate student: {name.strip()!r}.")
        student = Student(name)
        self._students[key] = student
        return student

    def find_student(self, name: str) -> Student | None:
        """Find a student by name, case-insensitively.

        Args:
            name: Name to look up.

        Returns:
            The Student, or None if not found.

        Raises:
            TypeError: If name is not a string.
        """
        if not isinstance(name, str):
            raise TypeError("Student name must be a string.")
        return self._students.get(name.strip().lower())

    def remove_student(self, name: str) -> None:
        """Remove a student by name.

        Args:
            name: Name to remove.

        Raises:
            TypeError: If name is not a string.
            KeyError: If no student with that name exists.
        """
        key = self._key(name)
        if key not in self._students:
            raise KeyError(f"No student named {name.strip()!r}.")
        del self._students[key]

    def list_students(self) -> list[Student]:
        """Return all students as a list.

        Returns:
            A new list of Students in insertion order.
        """
        return list(self._students.values())

    def class_average(self) -> float | None:
        """Return the average of student averages, skipping grade less students.

        Returns:
            The class average, or None if no grades exist yet.
        """
        avgs = [s.average() for s in self._students.values() if s.average() is not None]
        if not avgs:
            return None
        return sum(avgs) / len(avgs)

    def top_student(self) -> Student | None:
        """Return the student with the highest average.

        Returns:
            The top Student, first found on ties, or None if no grades exist.
        """
        best: Student | None = None
        best_avg: float | None = None
        for student in self._students.values():
            avg = student.average()
            if avg is None:
                continue
            if best_avg is None or avg > best_avg:
                best = student
                best_avg = avg
        return best

    def to_list(self) -> list[dict]:
        """Return this gradebook as a list of plain dicts.

        Returns:
            One dict per student, via Student.to_dict().
        """
        return [s.to_dict() for s in self._students.values()]

    @classmethod
    def from_list(cls, data: list) -> "Gradebook":
        """Create a Gradebook from a list of student dicts.

        Args:
            data: List of dicts with "name" and "grades" keys.

        Returns:
            A new Gradebook.

        Raises:
            TypeError: If data is not a list.
        """
        if not isinstance(data, list):
            raise TypeError("Gradebook data must be a list.")
        book = cls()
        for item in data:
            student = Student.from_dict(item)  # validates name + grades
            key = cls._key(student.name)
            if key in book._students:
                raise ValueError(f"Duplicate student: {student.name!r}.")
            book._students[key] = student
        return book

    def __len__(self) -> int:
        """Return the number of students."""
        return len(self._students)

    def __str__(self) -> str:
        """Return a one-line summary of the gradebook.

        Returns:
            Human-readable summary with count and class average.
        """
        if not self._students:
            return "Gradebook(empty)"
        avg = self.class_average()
        avg_text = f"{avg:.1f}" if avg is not None else "no grades"
        return f"Gradebook({len(self)} students, class avg: {avg_text})"
