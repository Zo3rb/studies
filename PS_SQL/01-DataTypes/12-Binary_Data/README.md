# 💾 Lesson 12: Binary Data (BYTEA) in PostgreSQL

In PostgreSQL, the **`BYTEA`** data type is used to store raw binary strings (byte arrays). It is designed to hold unstructured or binary data such as file attachments, images, PDF documents, encrypted hashes, or serialized machine learning tensors.

---

## 1. `BYTEA` vs `TEXT`

*   **`TEXT` / `VARCHAR`:** Expects valid character data encoded in a specific character set (e.g., UTF-8). Inserting invalid byte sequences into a text column throws a character encoding error.
*   **`BYTEA`:** Stores raw 8-bit bytes without character set validation or interpretation. Any byte sequence from `0x00` to `0xFF` can be stored safely.

---

## 2. Binary Output Representations

PostgreSQL supports two formats for inputting and outputting binary data:

1.  **Hex Format (Default since PostgreSQL 9.0):**
    *   Prefixed with `\x` followed by hexadecimal digits (0-9, A-F).
    *   *Example:* `'\x48656c6c6f'` represents the ASCII string `"Hello"`.
2.  **Escape Format (Legacy):**
    *   Uses printable ASCII characters directly and escapes non-printable bytes with backslashes.

---

## 3. Helper Functions: `encode()` and `decode()`

PostgreSQL provides built-in functions to convert between text encodings (Base64, Hex, Escape) and `BYTEA`:

*   **`encode(bytea, format)`:** Converts binary data into a text string representation (e.g. `'hex'`, `'base64'`).
    ```sql
    SELECT encode('Hello World'::bytea, 'hex');
    -- Returns: 48656c6c6f20576f726c64
    ```
*   **`decode(text, format)`:** Parses a text string representation back into raw `BYTEA`.
    ```sql
    SELECT decode('48656c6c6f', 'hex');
    -- Returns: \x48656c6c6f
    ```

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to store binary data, test Base64 and Hex encoding/decoding, and measure byte storage sizes.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to check for binary data columns in table catalogs.
