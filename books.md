# Best 10 Books for Full-Stack SWE / DevOps / AI Platform Engineer (AWS)

A curated reading list covering full-stack engineering, DevOps/platform practices, and AWS-based AI/ML systems — designed to build confidence across all three role areas without heavy overlap.

---

## Core Software Engineering (the foundation)

### 1. Designing Data-Intensive Applications

**Author:** Martin Kleppmann

The single most valuable book for understanding databases, caching, replication, and distributed systems tradeoffs. Almost every backend and platform decision you'll make traces back to concepts in this book.

### 2. System Design Interview: An Insider's Guide (Vol. 1)

**Author:** Alex Xu

Quick, practical patterns for designing scalable services (load balancers, sharding, queues, caching). Great for translating theory into "how do I actually architect this feature."

---

## DevOps & Production Systems

### 3. The Phoenix Project

**Authors:** Gene Kim, Kevin Behr, George Spafford

A novel, not a manual, but it's the best gut-level introduction to _why_ DevOps culture and practices exist (bottlenecks, deployment pain, feedback loops).

### 4. The DevOps Handbook

**Authors:** Gene Kim, Jez Humble, Patrick Debois, John Willis

The practical companion to _The Phoenix Project_ — CI/CD, deployment pipelines, telemetry, and how high-performing teams actually operate.

### 5. Site Reliability Engineering

**Author:** Google (Betsy Beyer et al.)

How to run production systems reliably: SLOs/SLIs, incident response, error budgets, on-call practices. Free to read online too. Core reading for anyone touching infrastructure.

### 6. Accelerate

**Authors:** Nicole Forsgren, Jez Humble, Gene Kim

The research behind _what actually predicts_ high-performing engineering orgs (deploy frequency, lead time, MTTR). Useful for making the case for good practices, not just following them.

---

## Infrastructure & Orchestration

### 7. Terraform: Up & Running

**Author:** Yevgeniy Brikman

The standard for Infrastructure as Code. Directly applicable to provisioning AWS resources reproducibly.

### 8. Kubernetes: Up & Running

**Authors:** Brendan Burns, Joe Beda, Kelsey Hightower

Container orchestration fundamentals — you'll run into this constantly whether deploying microservices or ML inference endpoints.

---

## AWS & AI/ML Platform Engineering

### 9. Amazon Web Services in Action

**Authors:** Andreas & Michael Wittig

A hands-on, practical tour of core AWS services (EC2, IAM, VPC, Lambda, S3, RDS) — the connective tissue for everything you'll build on AWS.

### 10. Designing Machine Learning Systems

**Author:** Chip Huyen

The best current book on production ML/MLOps: data pipelines, serving, monitoring, drift — directly maps to "AI Platform Engineer" responsibilities regardless of cloud provider.

---

## Suggested Reading Order

1. **Start with:** #1 (Designing Data-Intensive Applications) and #9 (AWS in Action) — to get your bearings on systems fundamentals and AWS basics.
2. **Then:** #3 (The Phoenix Project) and #4 (The DevOps Handbook) — for the DevOps mindset and culture.
3. **Next:** #7 (Terraform) and #8 (Kubernetes) — for hands-on infrastructure skills.
4. **Fill in:** #2 (System Design Interview) and #5/#6 (SRE, Accelerate) as you go.
5. **Finish with:** #10 (Designing Machine Learning Systems) — once you're comfortable with the platform pieces, since it assumes some of that context.

> **Note:** SRE and Accelerate are denser reads. Consider lighter/faster-reading alternatives if you want something more skimmable in those categories.
