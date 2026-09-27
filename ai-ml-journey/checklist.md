# AI Platform Engineer + Full-Stack SWE — 12-Month Execution Plan

**Hardware:** Ubuntu, 16GB RAM, i5-5600, no GPU
**Cloud:** AWS Free Tier only (EC2 t2.micro/t3.micro, S3, IAM)
**Local K8s:** k3d
**Time:** 6 days/week (Sat–Thu), 3h/day = 18h/week
**Background:** 1-year SWE, rusty (comfort ~2/5), Docker 0, FastAPI 0
**Goal:** AI Platform / MLOps Engineer + Full-Stack SWE hybrid

---

## Rules of Engagement

1. **Commit + push every day.** Even bad days: 1 commit, 1 push, 1 journal line.
2. **Conventional commits:** `feat:`, `fix:`, `docs:`, `test:`, `chore:`, `refactor:`
3. **Commit message = why, not what.** Bad: `update`. Good: `feat: add Redis cache to /tasks`
4. **Never commit:** `.env`, secrets, `node_modules`, `__pycache__`, model weights.
5. **README updated weekly** with what you built + what's next.
6. **No GPU = no fine-tuning.** Learn LoRA/QLoRA theory only. Use CPU models.
7. **Interview prep starts Month 6**, not Month 11.
8. **Every project README tells a story:** problem → architecture → trade-offs → what broke → fix → next time.

---

## Resource Budget (16GB RAM, no GPU)

| Service                              | RAM          | Notes                         |
| ------------------------------------ | ------------ | ----------------------------- |
| OS + browser + VS Code               | ~4 GB        | Keep browser tabs low         |
| Docker + k3d                         | ~2 GB        | Limit pods to 256–512 MB each |
| PostgreSQL                           | ~256 MB      | Tune `shared_buffers` low     |
| Redis                                | ~64 MB       | Fine by default               |
| FastAPI                              | ~150 MB      | Uvicorn workers=1 locally     |
| Qdrant                               | ~256 MB      | Use small collections         |
| Embeddings (`all-MiniLM-L6-v2`)      | ~500 MB      | CPU, fast                     |
| Small LLM (Qwen2.5-0.5B / TinyLlama) | ~1–2 GB      | Use llama.cpp or vLLM CPU     |
| **Total headroom**                   | ~3–4 GB free | Don't run everything at once  |

**Rule:** Run at most 3 heavy services simultaneously. Stop what you're not using.

---

## The 5 Portfolio Projects

| #   | Project                     | Month | Stack                                     |
| --- | --------------------------- | ----- | ----------------------------------------- |
| 1   | Platform API Service        | 2–3   | FastAPI, PostgreSQL, Redis, Docker, CI/CD |
| 2   | ML Pipeline + Model Serving | 5–6   | scikit-learn, MLflow, FastAPI, Prometheus |
| 3   | RAG Knowledge Service       | 7–8   | Qdrant, embeddings, small LLM, FastAPI    |
| 4   | MERN + AI Integration       | 9     | React, Node, MongoDB, Project 3 API       |
| 5   | AI Platform Capstone        | 10    | k3d, Terraform, CI/CD, Grafana, runbook   |

Each project must include: README story, architecture diagram, tests, Dockerfile, runbook, and a 3-minute demo script.

---

## 12-Month Map

| Month | Core Focus                                | Project            | MERN Track (parallel)          |
| ----- | ----------------------------------------- | ------------------ | ------------------------------ |
| 1     | Ramp: Python, Git, Docker, FastAPI basics | Warmup CLI         | Node/Express/Mongo refresh     |
| 2     | FastAPI + PostgreSQL + Redis + testing    | Project 1          | React hooks + API integration  |
| 3     | AWS free tier + Terraform basics + CI/CD  | Project 1 deployed | Auth (JWT), file upload        |
| 4     | Kubernetes with k3d + Helm                | Project 1 on k3d   | React state management         |
| 5     | ML foundations + scikit-learn + MLflow    | Project 2 training | MERN error handling            |
| 6     | Model serving + Prometheus + Grafana      | Project 2 serving  | Interview prep starts          |
| 7     | LLM basics + embeddings + Qdrant          | Project 3          | MERN + AI integration prep     |
| 8     | AI gateway + guardrails + RAG evaluation  | Project 3 hardened | React Native / Expo (optional) |
| 9     | MERN deep dive + AI integration           | Project 4          | Project 4 (full focus)         |
| 10    | Terraform + k3d + observability           | Project 5          | Deploy MERN app free tier      |
| 11    | System design + mock interviews           | Polish all         | Interview storytelling         |
| 12    | Portfolio + applications                  | Ship everything    | Job-ready                      |

---

## Daily Rhythm (3 hours)

| Block      | Time   | Activity                         |
| ---------- | ------ | -------------------------------- |
| Concept    | 30 min | Read/watch one focused resource  |
| Guided lab | 60 min | Follow a tutorial or exercise    |
| Build      | 75 min | Work on your project             |
| Commit     | 15 min | Commit, push, write journal line |

**Friday:** Rest + review week + plan next week.

---

## Month 1 — Ramp (Weeks 1–4)

**Goal:** Rebuild muscle memory + environment + first Dockerized service.
**Project output:** `warmup-cli/` → `project1/` skeleton running via `docker compose up`.

### Week 1 — Environment + Python muscle memory

- [x] Sat: Install/verify Python 3.11+, Git, Docker, Node 20+, k3d, VS Code, psql client
- [ ] Sun: Python warm-up — CLI reads CSV/JSON, validates rows, logs warnings, prints summary
- [ ] Mon: Add pytest tests to the CLI (happy path + 2 edge cases)
- [ ] Tue: Git drill — branch, commit, merge, rebase, stash, resolve a conflict
- [ ] Wed: Docker — write a multi-stage Dockerfile for the CLI
- [ ] Thu: Run the CLI in Docker, document run instructions, commit
- [ ] Fri: Review, write `journal.md`, plan Week 2
- **Deliverable:** `warmup-cli/` with Dockerfile, tests, README

### Week 2 — FastAPI + PostgreSQL foundations

- [ ] Sat: FastAPI hello world — routes, path/query params, response models
- [ ] Sun: Pydantic models — validation, nested schemas, error responses
- [ ] Mon: PostgreSQL — create a DB, design a `tasks` schema, write SQL by hand
- [ ] Tue: SQLAlchemy + Alembic — models, migrations, CRUD queries
- [ ] Wed: Connect FastAPI to PostgreSQL — `/tasks` CRUD endpoints + `/health`
- [ ] Thu: Add error handling, structured logging, `.env` config
- [ ] Fri: Review, journal, plan Week 3
- **Deliverable:** `project1/` with working CRUD API + DB

### Week 3 — Redis + Docker Compose + tests

- [ ] Sat: Redis basics — cache one endpoint, measure before/after latency
- [ ] Sun: Add cache invalidation on write + TTL
- [ ] Mon: Write integration tests — FastAPI TestClient + test DB
- [ ] Tue: Docker Compose — API + PostgreSQL + Redis in one stack
- [ ] Wed: Add health checks, restart policies, volumes
- [ ] Thu: Document the local runbook (`docker compose up` → working stack)
- [ ] Fri: Review, journal, plan Week 4
- **Deliverable:** Full local stack running via one command

### Week 4 — CI/CD + docs + polish

- [ ] Sat: GitHub Actions — lint (ruff) + tests (pytest) on push
- [ ] Sun: Add Docker build step to CI
- [ ] Mon: Write architecture diagram (draw.io or Mermaid in README)
- [ ] Tue: Write project README story (problem → stack → trade-offs → run)
- [ ] Wed: Add `/metrics` endpoint (Prometheus format)
- [ ] Thu: Final polish — clean commits, tag `v0.1.0`, push
- [ ] Fri: Month 1 review — what worked, what didn't, adjust Month 2
- **Deliverable:** Project 1 complete locally, CI green, README polished

### MERN Track — Month 1 (2 sessions/week)

- [ ] Week 1: Node + Express — routes, middleware, error handling
- [ ] Week 2: MongoDB — schemas, CRUD, Mongoose models
- [ ] Week 3: React — hooks, state, fetch from Express API
- [ ] Week 4: Connect React → Express → MongoDB (mini full-stack app)

---

## Month 2 — Project 1 Hardening + AWS Free Tier

**Goal:** Deploy Project 1 to AWS EC2 free tier + Terraform basics.

### Week 5 — AWS core services

- [ ] IAM: users, roles, policies (least privilege)
- [ ] EC2: launch t2.micro, SSH, security groups
- [ ] S3: bucket, upload artifacts, lifecycle basics
- [ ] Deploy Project 1 to EC2 manually (Docker on EC2)
- **Deliverable:** Project 1 running on EC2

### Week 6 — Terraform basics

- [ ] Providers, variables, resources, outputs
- [ ] State, plan, apply, destroy lifecycle
- [ ] Provision VPC + EC2 + S3 with Terraform
- [ ] Tear down and re-apply (prove reproducibility)
- **Deliverable:** `terraform/` folder in Project 1

### Week 7 — CI/CD to AWS

- [ ] GitHub Actions: build → test → push image → deploy to EC2
- [ ] Secrets management in GitHub
- [ ] Rollback strategy documented
- **Deliverable:** Automated deploy pipeline

### Week 8 — Monitoring basics

- [ ] Prometheus + Grafana locally (Docker Compose)
- [ ] Scrape `/metrics` from Project 1
- [ ] Build 3 dashboards: latency, errors, request rate
- **Deliverable:** Grafana dashboard screenshot in README

### MERN Track — Month 2

- [ ] JWT auth (register, login, protected route)
- [ ] File upload (Multer + S3 free tier)
- [ ] Error boundaries + loading states in React

---

## Month 3 — Kubernetes with k3d

**Goal:** Deploy Project 1 to local k3d + Helm.

### Week 9 — K8s fundamentals

- [ ] Pods, Deployments, Services, Ingress
- [ ] Install k3d, create cluster, deploy hello world
- [ ] ConfigMaps, Secrets, volumes
- **Deliverable:** Hello world running on k3d

### Week 10 — Deploy Project 1 to k3d

- [ ] Write Deployment + Service + ConfigMap manifests
- [ ] Readiness/liveness probes
- [ ] Resource limits (256 MB per pod)
- **Deliverable:** Project 1 on k3d via `kubectl apply`

### Week 11 — Helm basics

- [ ] Chart structure, values.yaml, templates
- [ ] Convert Project 1 manifests to a Helm chart
- [ ] Deploy + upgrade + rollback
- **Deliverable:** `helm/` folder

### Week 12 — Scaling + resilience

- [ ] HPA basics (CPU-based)
- [ ] Simulate load, observe scaling
- [ ] Runbook: "what happens when Redis dies?"
- **Deliverable:** Scaling demo + runbook

### MERN Track — Month 3

- [ ] React state management (Context or Zustand)
- [ ] API integration patterns (React Query basics)
- [ ] Deploy MERN frontend to Vercel/Netlify free tier

---

## Month 4–5 — ML Foundations + Project 2

**Goal:** scikit-learn → MLflow → FastAPI serving.

### Month 4 — ML foundations

- [ ] NumPy, Pandas, statistics basics
- [ ] Train/test split, preprocessing, feature engineering
- [ ] Linear regression, logistic regression, decision trees, random forest
- [ ] Evaluation metrics: accuracy, precision, recall, F1, RMSE
- **Deliverable:** Notebook + training script for a small dataset

### Month 5 — MLflow + serving

- [ ] MLflow tracking — log params, metrics, artifacts
- [ ] Run 3+ experiments, compare, pick a winner (document why)
- [ ] Model registry — register best model
- [ ] FastAPI inference API with Pydantic input/output schemas
- [ ] Dockerize the inference service
- [ ] Add `/metrics` + request logging
- **Deliverable:** Project 2 complete (training + serving + Docker)

### MERN Track — Months 4–5

- [ ] Error handling patterns (try/catch, error boundaries)
- [ ] Loading + empty states in React
- [ ] MERN app: add a feature end-to-end (frontend → API → DB)

---

## Month 6 — Observability + Interview Prep Starts

**Goal:** Project 2 monitored + start interview practice.

- [ ] Prometheus scrapes inference API metrics
- [ ] Grafana dashboards: latency, throughput, error rate, model load time
- [ ] Alert rules for high latency + error rate
- [ ] Runbook for model service failures
- [ ] **Interview prep:** explain Project 2 in 2 minutes (record yourself)
- [ ] **Interview prep:** 3 STAR stories from your projects
- **Deliverable:** Project 2 with monitoring + first mock interview

---

## Month 7 — LLM + RAG (Project 3)

**Goal:** RAG service with Qdrant + CPU-friendly LLM.

- [ ] LLM basics: tokens, attention, transformers (theory only)
- [ ] Embeddings: `all-MiniLM-L6-v2` (CPU)
- [ ] Qdrant in Docker — collections, upsert, search
- [ ] Chunking strategies — test 2–3 sizes on real docs
- [ ] Ingestion pipeline: load → chunk → embed → store
- [ ] Retrieval + generation with small LLM (Qwen2.5-0.5B or API)
- [ ] FastAPI RAG endpoint
- **Deliverable:** Project 3 working locally

---

## Month 8 — RAG Hardening + AI Gateway

**Goal:** Production-grade RAG + gateway layer.

- [ ] Hybrid search (vector + keyword)
- [ ] Metadata filtering
- [ ] Evaluation: relevance, faithfulness (manual + simple metrics)
- [ ] AI gateway: routing, rate limiting, fallback
- [ ] Guardrails: input validation, output boundaries
- [ ] Monitoring: latency, token count, cost estimate
- **Deliverable:** Project 3 hardened + gateway

---

## Month 9 — MERN + AI Integration (Project 4)

**Goal:** Full-stack app on top of Project 3.

- [ ] React chat UI (streaming responses)
- [ ] Node/Express proxy to RAG service
- [ ] MongoDB for chat history
- [ ] Auth (JWT) + user sessions
- [ ] File upload → ingestion pipeline
- [ ] Error states, loading, retry
- **Deliverable:** Project 4 — full-stack AI app

---

## Month 10 — Platform Capstone (Project 5)

**Goal:** Deploy Projects 1–3 on k3d + Terraform + full observability.

- [ ] k3d cluster with all services
- [ ] Terraform for AWS free tier (EC2, S3, IAM)
- [ ] GitHub Actions: build → test → deploy
- [ ] Prometheus + Grafana across all services
- [ ] Runbook + incident simulation
- [ ] Architecture diagram
- **Deliverable:** Project 5 — platform capstone

---

## Month 11 — System Design + Mock Interviews

- [ ] Load balancers, reverse proxies, caching layers
- [ ] Database design trade-offs (SQL vs NoSQL)
- [ ] Queues + workers (RabbitMQ/SQS concepts)
- [ ] High availability + deployment strategies
- [ ] ML/AI platform trade-offs
- [ ] 5 mock interviews (record + review)
- [ ] 10 STAR stories ready
- **Deliverable:** Interview-ready

---

## Month 12 — Portfolio + Applications

- [ ] Polish all 5 project READMEs (story format)
- [ ] Architecture diagrams for all projects
- [ ] 3-minute demo video per project
- [ ] Resume matched to AI Platform / MLOps / Full-Stack AI roles
- [ ] GitHub profile README
- [ ] Apply to 5 jobs/week
- [ ] Network: LinkedIn, communities, referrals
- **Deliverable:** Job-ready portfolio + active applications

---

## Weekly Checkpoint Template

Copy into `journal.md` every Friday:

```markdown
## Week N — [Date]

**Built:**
**Broke:**
**Fixed:**
**Learned:**
**Next week:**
**Commits:**
**Blocked by:**
```

## Month 6+ Interview Prep Cadence

- **Weekly:** Explain one project in 2 minutes (record, review)
- **Bi-weekly:** One system design question (write + diagram)
- **Monthly:** One mock interview (friend or AI)
- **Ongoing:** Add STAR stories to `stories.md`

## KodeKloud Integration (booster only)

Challenge

When

How

100 Days of DevOps

Months 4–6

2–3 lessons/week

100 Days of Cloud

Months 3–4

Supplementary AWS practice

100 Days of MLOps

Months 5–7

After MLflow + serving basics

**Rule:** If behind → do KodeKloud as lab booster. If on track → optional, 1–2 modules/week. Never replace project work.

---

## Final Checklist

- [ ] Project 1: Platform API (FastAPI + PG + Redis + Docker + CI/CD)
- [ ] Project 2: ML Pipeline + Serving (scikit-learn + MLflow + FastAPI + Prometheus)
- [ ] Project 3: RAG Service (Qdrant + embeddings + LLM + gateway)
- [ ] Project 4: MERN + AI (React + Node + Mongo + RAG integration)
- [ ] Project 5: AI Platform (k3d + Terraform + CI/CD + Grafana + runbook)
- [ ] 5 polished READMEs with stories + diagrams
- [ ] 5 demo videos (3 min each)
- [ ] Resume + GitHub profile ready
- [ ] 10 STAR stories
- [ ] 5 mock interviews done
- [ ] Active job applications
