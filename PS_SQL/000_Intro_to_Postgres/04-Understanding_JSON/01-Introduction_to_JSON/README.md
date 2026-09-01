# Lesson: Introduction to JSON

## 📖 Overview
PostgreSQL supports storing JSON (JavaScript Object Notation) natively. You can choose between two data types: `JSON` and `JSONB`.

## 🧠 Key Concepts
- **`JSON` Type:** Stores an exact copy of the input text, preserving whitespace and key order. It must be re-parsed on every query execution.
- **`JSONB` Type (Binary):** Stores the JSON in a decomposed binary format. Whitespace is stripped, duplicate keys are removed (keeping the last one), and key order is not preserved. It is significantly faster to process and supports indexing (GIN indexes).
- **Validation:** Both types ensure that the data being inserted is strictly valid JSON format.

## 🏆 Best Practices
- **Always use `JSONB`** unless you have a highly specialized legacy requirement that demands exact text preservation of whitespace or key order.
