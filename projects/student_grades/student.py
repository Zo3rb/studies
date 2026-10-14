"""a Class module that is producing code of Student Class."""


class Student:
    """a Student Class that representing the physical form of a Student in real-life."""

    def __init__(self, name: str) -> None:
        """initiation method to create a new instance of the class.

        Args:
            name (str): the name of the student.

        Raises:
            ValueError: will raise error if no name provided.
            TypeError: will raise error if invalid data provided.
        """

        self.grades: list[int] = []  # a list that holds the Student's Grades.

        if not isinstance(name, str):
            raise TypeError("The Student's Name Should be a String.")

        cleaned_student_name = name.strip()

        if not cleaned_student_name:
            raise ValueError("Invalid Student Name, Please provide the valid name.")

        self.name = cleaned_student_name

    def add_grade(self, grade: int) -> None:
        """Add a grade to this student's grades.

        Args:
            grade: The integer score to add, from 0 through 100.

        Raises:
            TypeError: If grade is not an integer or is a boolean.
            ValueError: If grade is outside the range 0 through 100.
        """

        if not isinstance(grade, int) or isinstance(grade, bool):
            raise TypeError("Invalid grade type. acceptable input is integers only")

        if (grade < 0) or (grade > 100):
            raise ValueError("Only accept grades from 0 - 100")

        self.grades.append(grade)

    def average(self) -> float | None:
        """Return the average of the student's grades.

        Returns:
            The average as a float, or None if no grades have been added.
        """
        if self.grades:
            sum_of_grades = sum(self.grades)
            return sum_of_grades / len(self.grades)

        return None

    def letter_grade(self) -> str | None:
        """Return the letter grade based on the average.

        Returns:
            The letter grade (A, B, C, D, F), or None if no grades added.
        """
        avg_grades = self.average()

        if avg_grades is None:
            return None

        if avg_grades >= 90:
            return "A"
        elif avg_grades >= 80:
            return "B"
        elif avg_grades >= 70:
            return "C"
        elif avg_grades >= 60:
            return "D"
        else:
            return "F"

    def to_dict(self) -> dict[str, str | list[int]]:
        """Return this student as a plain dictionary.

        Returns:
            A dict with keys "name" and "grades".
        """

        return {"name": self.name, "grades": list(self.grades)}

    @classmethod
    def from_dict(cls, data: dict) -> "Student":
        """Create a Student from a plain dictionary.

        Args:
            data: Dict with keys "name" (str) and "grades" (list[int]).

        Returns:
            A new Student instance with the given grades.

        Raises:
            TypeError: If data is not a dict, or grades is not a list.
            KeyError: If "name" or "grades" key is missing.
        """
        if not isinstance(data, dict):
            raise TypeError("Student data must be a dict.")

        # KeyError propagates naturally if keys are missing.
        name = data["name"]
        grades = data["grades"]

        if not isinstance(grades, list):
            raise TypeError("Student 'grades' must be a list.")

        student = cls(name)
        for grade in grades:
            student.add_grade(grade)
        return student

    def __str__(self) -> str:
        """Return a human-readable summary of the student.

        Returns:
            A string with name, average, letter grade, and grade count.
        """
        if self.grades:
            return f"{self.name} - Avg: {self.average()} ({self.letter_grade()}) [{len(self.grades)}] grades"
        else:
            return f"{self.name} - No grades yet"
