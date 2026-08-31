# Lesson: Upserting Data

## 📖 Overview
An 'Upsert' is a combination of Update and Insert. If a record doesn't exist, it is inserted. If it already exists (causing a unique constraint violation), it is updated instead.

## 🧠 Key Concepts
- **`ON CONFLICT`:** PostgreSQL's native way to handle upserts.
- **Conflict Target:** You must specify the column(s) that would trigger the conflict (usually a Primary Key or UNIQUE constraint).
- **`EXCLUDED` Table:** A special table available in the `DO UPDATE` clause that references the row you *tried* to insert.

## 🏆 Best Practices
- Upserts are incredibly useful for data synchronization, API webhooks, and ETL pipelines where you don't want to query the database first to check if a record exists.
