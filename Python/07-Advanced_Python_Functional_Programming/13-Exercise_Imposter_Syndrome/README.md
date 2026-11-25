# 📖 Lesson: Exercise - Imposter Syndrome

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0129. Exercise - Imposter Syndrome.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

A reflective lesson on imposter syndrome in programming: why capable learners often feel like frauds, how confusion is a normal part of learning, and practical habits such as deliberate practice, small projects, and tracking progress that build real confidence.

---

## 📝 Key Concepts

### 1. Imposter Syndrome Is Common

Feeling that you have fooled others despite evidence of skill is a widespread experience, not proof that you lack ability. Naming it helps separate feelings from facts.

```python
# A small win worth recording: you can already build a data pipeline.
values = [1, 2, 3, 4]
result = [n * n for n in values if n % 2 == 0]
print(result)  # [4, 16]
```

---

### 2. Deliberate Practice

Confidence comes from repeated, focused effort: re-typing examples, explaining concepts aloud, and solving variations without looking at the answer.

```python
def practice(attempts):
    return [attempt * 2 for attempt in range(attempts)]

print(practice(3))  # [0, 2, 4] — small exercises add up
```

---

### 3. Evidence Over Feeling

Keep a record of problems you have solved. When self-doubt appears, concrete evidence is more reliable than a momentary feeling.

```python
solved = ['lambda sort key', 'dict comprehension', 'reduce with initializer']
print(f'Concepts practiced: {len(solved)}')  # Concepts practiced: 3
```

---

## ⚠️ Gotchas & Pro Tips

1. **Compare with your past self** — Progress is easiest to see against your own earlier work, not against someone else's highlight reel.
2. **Being stuck is part of learning** — Struggling before a concept clicks is normal; ask questions and revisit the material rather than assuming you cannot learn it.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
