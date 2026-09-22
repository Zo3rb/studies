# MLOps / AI Platform Engineer Mastery Roadmap

A 12-Month, 3-Hours/Day Progressive Study Plan
For a 1-year SWE targeting AWS-first MLOps / AI Platform Engineering

## Schedule & Learning Methodology

- Weekly budget: 6 days/week (Sat–Thu), 3 hours/day = 18 hours/week
- Daily rhythm:
  - Saturday: concept mastery + theory
  - Sunday: lab + guided practice
  - Monday: deeper concept review
  - Tuesday: implementation + exercises
  - Wednesday: build day 1
  - Thursday: build day 2
  - Friday: rest + review + notes
- Learning philosophy:
  - Learn the platform concept
  - Build the feature or service
  - Deploy it locally or on cloud
  - Observe, debug, and improve it
- Resource priority:
  1. Free Arabic-first resources if available
  2. Official docs and free English resources
  3. Hands-on labs and small projects
  4. Deep reading only after building a working system

---

## Target Role & Stack

This plan is optimized for:

- 1-year SWE
- full-time job schedule
- AWS-first cloud focus
- Python as main language
- strong emphasis on platform engineering, deployment, observability, infrastructure automation, model serving, and AI reliability

Primary stack:

- Python, Linux, Git
- TypeScript + JavaScript fundamentals
- React + React Native / Expo
- Node.js + Express + MongoDB (MERN layer)
- FastAPI
- Docker + Docker Compose
- PostgreSQL + Redis
- AWS: EC2, IAM, VPC, S3, EKS
- Terraform
- Kubernetes (k3d or Minikube)
- GitHub Actions
- Prometheus + Grafana
- MLflow
- vLLM / model serving
- Qdrant / vector search
- LangChain / RAG basics

Supporting modern developer layer (recommended for full-stack + platform roles):

- TypeScript syntax, interfaces, generics, strict mode
- React fundamentals: hooks, state, props, component design
- React Native / Expo: navigation, device APIs, mobile UI patterns
- MERN stack: Express APIs, MongoDB, CRUD patterns, auth basics
- Full-stack integration patterns for APIs, frontend state, and deployment

---

## 4 Production-Grade Capstone Projects

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                 4 PRODUCTION-STYLE CAPSTONE PROJECTS                        │
└─────────────────────────────────────────────────────────────────────────────┘
  CAPSTONE 1 (Month 3):  Python + FastAPI + PostgreSQL + Redis platform service
  CAPSTONE 2 (Month 6):  ML training + model serving + MLflow + Docker pipeline
  CAPSTONE 3 (Month 9):  GenAI / RAG service with Qdrant + vLLM + gateway design
  CAPSTONE 4 (Month 12): AI Platform project on AWS/Kubernetes with CI/CD + monitoring
```

---

## Practical Weekly Execution Tracker

Use this template every week.

### Weekly goal

- [ ] Main topic for the week:
- [ ] Lab completed:
- [ ] Project output completed:
- [ ] One gap I need to revisit next week:
- [ ] One skill I can explain out loud without notes:

### Daily checklist (Sat–Thu)

- [ ] Saturday: Learn the concept + watch 1–2 focused videos / read 1 article
- [ ] Sunday: Do the lab + write short notes + 1 practical exercise
- [ ] Monday: Deepen the concept + revise confusing parts
- [ ] Tuesday: Build a small implementation or mini-project
- [ ] Wednesday: Build Day 1 — main project work
- [ ] Thursday: Build Day 2 — finish + document + test
- [ ] Friday: Review + note what was learned + rest

### Weekly project checkpoint

- [ ] Did I build something real this week?
- [ ] Did I deploy or run it locally?
- [ ] Did I document what I built?
- [ ] Did I check my outputs against the role target?

### Modern developer support track (lightweight, not separate priority)

Keep this to 1–2 focused sessions per week, only after the main MLOps task is done.

- [ ] TypeScript fundamentals: variables, types, interfaces, generics, strict mode
- [ ] React basics: props, state, hooks, forms, API integration
- [ ] React Native / Expo basics: navigation, components, mobile UI patterns
- [ ] MERN basics: Express, MongoDB CRUD, auth concepts

This support layer should be treated as a booster for understanding modern product architecture. It is not the main focus.

---

# Phase 0: Foundation Reset (Weeks 1–4)

Goal: solidify Python, Git, Linux, and software engineering habits before platform work.

## Week 1 – Python basics + environment setup

### Saturday

- Topic: Python basics (variables, types, functions, strings, mutability)
- Focus:
  - Python syntax
  - functions and parameters
  - data types and references
- Free resources:
  - Arabic: free Arabic Python explainers on YouTube
  - English: [Python Official Tutorial](https://docs.python.org/3/tutorial/), [freeCodeCamp](https://www.freecodecamp.org/), [Corey Schafer](https://www.youtube.com/@Coreyms)
- Lab:
  - create a script that reads a CSV file and prints summary stats
- Deliverable:
  - repository with a simple data processing script

### Sunday

- Topic: conditionals, loops, comprehensions, scope
- Lab:
  - build a mini transaction parsing script

### Monday

- Topic: dictionaries, sets, lists, and hash behavior
- Focus:
  - lookup speed vs list scanning
- Lab:
  - build a small lookup/indexing utility

### Tuesday

- Topic: file I/O, JSON, CSV, exceptions, logging
- Lab:
  - parse JSON/CSV input and log errors cleanly

### Wednesday – Build Day 1

- Project: create a small Python CLI tool
- Functionality:
  - read input files
  - validate rows
  - summarize data
  - log warnings/errors

### Thursday – Build Day 2

- Improve the CLI:
  - unit tests
  - README
  - file-based output
  - clean script structure

### Friday

- Rest + recap notes

---

## Week 2 – OOP, clean architecture, and testing

### Saturday

- Topic: classes, methods, constructors, encapsulation
- Lab:
  - create a `Transaction` model and a small parser

### Sunday

- Topic: inheritance, polymorphism, abstract classes
- Focus:
  - why interfaces matter in real systems

### Monday

- Topic: functional programming basics
- Learn:
  - lambdas, map, filter, list comprehensions
- Lab:
  - transform data cleanly using pure functions

### Tuesday

- Topic: pytest and professional testing habits
- Focus:
  - assertions, edge cases, fixtures

### Wednesday – Build Day 1

- Refactor the CLI into class-based architecture
- Classes likely to include:
  - `DataLoader`
  - `Validator`
  - `Processor`
  - `Reporter`

### Thursday – Build Day 2

- Add:
  - tests
  - typed functions
  - logging
  - clean project layout

### Friday

- Rest + review + commit history check

---

## Week 3 – Data structures, Big-O, and backend thinking

### Saturday

- Topic: arrays, dynamic arrays, list operations
- Focus: memory cost and indexing

### Sunday

- Topic: hash maps, sets, collisions
- Focus:
  - why dictionary lookup is $O(1)$ on average
- Lab:
  - index records by ID in memory

### Monday

- Topic: stacks, queues, linked lists
- Lab:
  - simulate an event queue or task queue

### Tuesday

- Topic: Big-O analysis
- Learn:
  - $O(1)$, $O(log n)$, $O(n)$, $O(n log n)$
- Lab:
  - compare list search vs dict lookup in code

### Wednesday – Build Day 1

- Build a mini in-memory indexing project
- Example:
  - search records by ID
  - group by category
  - store lookups in a dictionary

### Thursday – Build Day 2

- Benchmark performance and document results
- Deliverable:
  - README with complexity discussion

### Friday

- Rest + recap

---

## Week 4 – Git, venvs, typing, and packaging

### Saturday

- Topic: Git fundamentals
- Learn:
  - commit, branch, merge, rebase, stash
- Lab:
  - practice branching and merge conflict recovery

### Sunday

- Topic: Python environments and package management
- Learn:
  - virtualenv/venv
  - pip
  - poetry
- Lab:
  - create a proper project environment

### Monday

- Topic: type hints and Python typing
- Lab:
  - add typing to the project code

### Tuesday

- Topic: Pydantic basics
- Learn:
  - validation
  - schema design
  - structured request models

### Wednesday – Build Day 1

- Project structure:
  - src layout
  - requirements.txt or pyproject.toml
  - tests
  - docs

### Thursday – Build Day 2

- Finalize the project
- Create:
  - .gitignore
  - README
  - version tags
  - clean commit history

### Friday

- Rest + checkpoint

---

# Phase 1: Linux, APIs, SQL, and FastAPI Foundations (Weeks 5–8)

Goal: become comfortable with production backend systems before ML infrastructure.

## Week 5 – Linux + shell workflow

### Saturday

- Topic: Linux filesystem, permissions, users, processes
- Free resources:
  - Arabic: free Arabic Linux explainers on YouTube
  - English: [Linux Journey](https://linuxjourney.com/), [Linux Documentation Project](https://tldp.org/)
- Lab:
  - inspect files, permissions, and running services

### Sunday

- Topic: Bash scripting basics
- Learn:
  - loops, conditionals, grep, sed, awk
- Lab:
  - write a log summarizer script

### Monday

- Topic: process management + services
- Learn:
  - `ps`, `top`, `systemd`, backgrounding tasks
- Lab:
  - start and monitor a simple daemon-like process

### Tuesday

- Topic: networking basics
- Learn:
  - ports, localhost, curl, HTTP basics
- Lab:
  - use curl against a local API

### Wednesday – Build Day 1

- Build a small script or CLI that monitors a local machine:
  - CPU usage
  - file activity
  - log alerts

### Thursday – Build Day 2

- Extend it with:
  - logging
  - thresholds
  - periodic scheduling
  - README

### Friday

- Rest + notes

---

## Week 6 – REST APIs and FastAPI

### Saturday

- Topic: REST API fundamentals
- Learn:
  - endpoints, methods, status codes, HTTP semantics
- Resources:
  - [MDN HTTP Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP)
  - Arabic HTTP explainers for quick understanding

### Sunday

- Topic: FastAPI basics
- Learn:
  - app creation
  - routes
  - request models
  - responses
  - validation
- Lab:
  - create a mini task API

### Monday

- Topic: SQL fundamentals
- Learn:
  - `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, indexes
- Resources:
  - PostgreSQL docs, SQLBolt, free SQL practice labs

### Tuesday

- Topic: PostgreSQL + SQLAlchemy basics
- Lab:
  - connect FastAPI to PostgreSQL
- Deliverable:
  - CRUD API using database storage

### Wednesday – Build Day 1

- Project: build a task management API with FastAPI + PostgreSQL
- Include:
  - REST routes
  - validation
  - database connection
  - health endpoint

### Thursday – Build Day 2

- Add:
  - tests
  - environment variables
  - better docs
  - logging

### Friday

- Rest + review

---

## Week 7 – Redis, async Python, and reliability patterns

### Saturday

- Topic: Redis basics
- Learn:
  - cache patterns
  - TTL
  - invalidation
  - key-value usage
- Lab:
  - cache API responses in Redis

### Sunday

- Topic: async programming in Python
- Learn:
  - `async` / `await`
  - `asyncio`
  - background tasks
- Lab:
  - use async for a simple service or client

### Monday

- Topic: HTTP clients and API integration
- Learn:
  - `requests` vs `httpx`
  - retries and timeouts
- Lab:
  - create a client that calls another API reliably

### Tuesday

- Topic: reliability patterns
- Learn:
  - retries
  - timeouts
  - idempotency
  - graceful failure

### Wednesday – Build Day 1

- Project: extend the API with Redis cache and async tasks

### Thursday – Build Day 2

- Add:
  - structured logging
  - error handling
  - health checks
  - metrics endpoint

### Friday

- Rest + recap

---

## Week 8 – Docker fundamentals and containerization

### Saturday

- Topic: Docker basics
- Learn:
  - images vs containers
  - Dockerfiles
  - Docker architecture
- Resources:
  - [Docker Docs](https://docs.docker.com/), official tutorials

### Sunday

- Topic: multi-stage Docker builds
- Lab:
  - containerize the FastAPI project

### Monday

- Topic: Docker Compose
- Lab:
  - run PostgreSQL + Redis + API together in one stack

### Tuesday

- Topic: Docker debugging and container networking
- Learn:
  - logs, ports, environment variables, volumes

### Wednesday – Build Day 1

- Containerize your API service
- Include:
  - Dockerfile
  - docker-compose
  - env configuration
  - health check

### Thursday – Build Day 2

- Finalize the local deployment runbook
- Deliverable:
  - working Dockerized backend service

### Friday

- Rest + checkpoint

---

# Phase 2: Data, ML Foundations, and Early MLOps (Weeks 9–12)

Goal: understand machine learning basics and connect them to deployment patterns.

## Week 9 – Data science fundamentals

### Saturday

- Topic: NumPy arrays and vector operations
- Learn:
  - arrays, broadcasting, shapes, dot product
- Resources:
  - NumPy docs, free tutorials

### Sunday

- Topic: Pandas basics
- Learn:
  - DataFrame, filtering, grouping, merging
- Lab:
  - clean a CSV dataset and compute summary metrics

### Monday

- Topic: statistics basics
- Learn:
  - mean, median, variance, standard deviation
- Lab:
  - calculate and visualize simple distributions

### Tuesday

- Topic: probability and distributions
- Learn:
  - normal distribution, skew, confidence level

### Wednesday – Build Day 1

- Build a local data pipeline project
- Include:
  - input ingestion
  - cleaning logic
  - summary metrics
  - output export

### Thursday – Build Day 2

- Add:
  - validation checks
  - logging
  - notebook or script report

### Friday

- Rest

---

## Week 10 – ML foundations: supervised learning

### Saturday

- Topic: ML pipeline basics
- Learn:
  - train/test split
  - preprocessing
  - feature engineering
  - model evaluation

### Sunday

- Topic: linear regression
- Lab:
  - train and test a linear regression model using scikit-learn

### Monday

- Topic: logistic regression
- Lab:
  - binary classification task using a simple dataset

### Tuesday

- Topic: decision trees and random forests
- Lab:
  - compare model performance

### Wednesday – Build Day 1

- Build a training pipeline
- Include:
  - data prep
  - model training
  - evaluation
  - artifact save

### Thursday – Build Day 2

- Wrap the pipeline in a simple API or service
- Goal:
  - understand inference life cycle

### Friday

- Rest + review

---

## Week 11 – Model deployment basics

### Saturday

- Topic: offline vs online inference
- Learn:
  - training pipeline vs serving pipeline

### Sunday

- Topic: FastAPI prediction service
- Lab:
  - serve a trained model using FastAPI

### Monday

- Topic: request validation in ML APIs
- Learn:
  - Pydantic schemas for model input/output

### Tuesday

- Topic: model artifact versioning
- Learn:
  - file naming, model paths, minimal registry concepts
- Lab:
  - save multiple model versions locally

### Wednesday – Build Day 1

- Build an inference API around a scikit-learn model
- Include:
  - request schema
  - prediction endpoint
  - example payload

### Thursday – Build Day 2

- Add:
  - model versioning
  - Dockerfile
  - documentation
  - request logging

### Friday

- Rest + checkpoint

---

## Week 12 – MLflow and local MLOps mini-project

### Saturday

- Topic: MLflow basics
- Learn:
  - experiments, parameters, metrics, models, registry
- Lab:
  - train and log a model using MLflow

### Sunday

- Topic: model artifact tracking and experiment review
- Lab:
  - store artifacts and compare runs

### Monday

- Topic: basic workspace design for MLOps projects
- Learn:
  - training code
  - inference code
  - versioned artifacts

### Tuesday

- Topic: health checks and observability for ML apps
- Lab:
  - add health endpoint and request logs

### Wednesday – Build Day 1

- Project: create a local MLOps mini-project
- Includes:
  - training pipeline
  - MLflow tracking
  - inference API
  - Docker container

### Thursday – Build Day 2

- Finalize the project with:
  - README
  - architecture diagram
  - runbook
  - artifacts

### Friday

- Rest + review + prepare next phase

---

# Phase 3: Cloud, IaC, and Kubernetes (Weeks 13–20)

Goal: become capable of provisioning and deploying services in cloud-native environments.

## Week 13 – AWS foundations

### Saturday

- Topic: AWS core services
- Learn:
  - IAM, EC2, VPC, S3, Route53
- Resources:
  - AWS Skill Builder free content, AWS documentation

### Sunday

- Topic: IAM and security basics
- Lab:
  - create users, roles, policies, and secure permissions

### Monday

- Topic: EC2 basics
- Lab:
  - launch an EC2 instance and SSH into it

### Tuesday

- Topic: S3 and artifact storage
- Learn:
  - bucket storage, object lifecycle, policy basics

### Wednesday – Build Day 1

- Deploy a simple web or API app on EC2
- Document server setup and security steps

### Thursday – Build Day 2

- Add:
  - S3 artifact storage
  - deployment notes
  - firewall/security group notes

### Friday

- Rest

---

## Week 14 – Terraform basics

### Saturday

- Topic: Terraform fundamentals
- Learn:
  - providers, variables, resources, outputs
- Resources:
  - HashiCorp Learn, Terraform docs

### Sunday

- Topic: Terraform state and modules
- Lab:
  - provision a small resource set using Terraform

### Monday

- Topic: plan, apply, and destroy lifecycle
- Learn:
  - how infrastructure state works

### Tuesday

- Topic: Terraform best practices
- Learn:
  - modules
  - tfvars
  - environment separation

### Wednesday – Build Day 1

- Project: Terraform for AWS VPC + EC2 + S3

### Thursday – Build Day 2

- Validate:
  - plan
  - apply
  - destroy
- Goal:
  - automate resource provisioning

### Friday

- Rest + recap

---

## Week 15 – Kubernetes fundamentals

### Saturday

- Topic: Kubernetes concepts
- Learn:
  - pods, deployments, services, ingress
- Resources:
  - Kubernetes docs, KodeKloud free labs

### Sunday

- Topic: local k8s setup
- Lab:
  - install k3d or Minikube and deploy a simple app

### Monday

- Topic: ConfigMaps, Secrets, volumes
- Lab:
  - deploy an app that uses external config

### Tuesday

- Topic: Helm basics
- Learn:
  - chart structure, values, templates
- Lab:
  - deploy a sample app via Helm

### Wednesday – Build Day 1

- Deploy the FastAPI app to local Kubernetes
- Include:
  - Deployment
  - Service
  - ConfigMap or Secret

### Thursday – Build Day 2

- Add:
  - readiness/liveness probes
  - resource limits
  - notes on rollout behavior

### Friday

- Rest + review

---

## Week 16 – Kubernetes scaling + system design basics

### Saturday

- Topic: HPA and scaling basics
- Learn:
  - CPU metrics, queue length, autoscaling
- Lab:
  - simulate traffic to observe scaling

### Sunday

- Topic: readiness and liveness probes
- Lab:
  - improve resilience and recovery behavior

### Monday

- Topic: load balancers, proxies, caching basics
- Learn:
  - reverse proxy, L4 vs L7, caching strategies

### Tuesday

- Topic: queueing and event-driven design basics
- Learn:
  - RabbitMQ, Kafka, and SQS concepts

### Wednesday – Build Day 1

- Deploy a multi-container app in Kubernetes
- Include:
  - API service
  - PostgreSQL
  - Redis

### Thursday – Build Day 2

- Add:
  - scaling
  - notes on service resilience
  - runbook

### Friday

- Rest + checkpoint

---

## Week 17 – EKS + AWS networking

### Saturday

- Topic: Amazon EKS basics
- Learn:
  - cluster architecture
  - node groups
  - IAM integration

### Sunday

- Topic: AWS networking foundations
- Learn:
  - VPC, subnets, security groups, NAT, routing

### Monday

- Topic: service exposure patterns
- Learn:
  - ALB and ingress basics

### Tuesday

- Topic: Terraform + EKS deployment workflow
- Lab:
  - create a cluster deployment script

### Wednesday – Build Day 1

- Build a Terraform + EKS deployment project

### Thursday – Build Day 2

- Validate cluster bootstrapping and app deployment
- Goal:
  - production-like provisioning flow

### Friday

- Rest

---

## Week 18 – GitHub Actions + monitoring

### Saturday

- Topic: CI/CD with GitHub Actions
- Learn:
  - jobs, workflows, secrets, matrix builds
- Lab:
  - build a pipeline for Python app or service

### Sunday

- Topic: Prometheus + Grafana basics
- Learn:
  - metrics, dashboards, alerting
- Lab:
  - expose app metrics and visualize them

### Monday

- Topic: structured logging and observability
- Learn:
  - logs, correlation, alerts, operational signals

### Tuesday

- Topic: service reliability basics
- Learn:
  - SLIs/SLOs, alert thresholds, incident response

### Wednesday – Build Day 1

- Add CI/CD for your application
- Include:
  - tests
  - lint
  - Docker build
  - deploy step

### Thursday – Build Day 2

- Add monitoring dashboard and deployment runbook
- Goal:
  - platform-grade operational readiness

### Friday

- Rest + review

---

# Phase 4: MLOps and Model Serving (Weeks 19–24)

Goal: turn your ML projects into deployable, observable, repeatable systems.

## Week 19 – MLflow and experiment tracking

### Saturday

- Topic: MLflow basics
- Learn:
  - experiments, parameters, metrics, artifacts
- Lab:
  - run a training job and log its results

### Sunday

- Topic: model registry and versioning
- Lab:
  - save and register a model version

### Monday

- Topic: DVC basics
- Learn:
  - dataset versioning and reproducible training

### Tuesday

- Topic: MLOps pipeline concepts
- Learn:
  - training pipeline, evaluation pipeline, serving pipeline

### Wednesday – Build Day 1

- Build an ML pipeline with MLflow tracking

### Thursday – Build Day 2

- Add:
  - model registry
  - artifact retention
  - logs

### Friday

- Rest

---

## Week 20 – Model serving and inference basics

### Saturday

- Topic: serving architecture
- Learn:
  - offline vs online inference
  - batch vs real-time serving

### Sunday

- Topic: FastAPI model API
- Lab:
  - host a model behind a production-like API

### Monday

- Topic: concurrency and request handling
- Learn:
  - async vs threads, queueing, throughput

### Tuesday

- Topic: performance metrics for inference
- Learn:
  - latency, throughput, error rate, model load time

### Wednesday – Build Day 1

- Create a model serving service with:
  - validation
  - prediction endpoint
  - metrics
  - logs

### Thursday – Build Day 2

- Dockerize it and document the deployment flow

### Friday

- Rest + review

---

## Week 21 – LLM and vLLM basics

### Saturday

- Topic: LLM fundamentals
- Learn:
  - tokens, attention, transformers, inference trade-offs
- Resources:
  - Hugging Face docs, free transformer explainers, LLM architecture fundamentals

### Sunday

- Topic: vLLM basics
- Learn:
  - model serving, batching, memory optimization
- Lab:
  - serve a small model locally

### Monday

- Topic: quantization basics
- Learn:
  - INT8, FP8, memory trade-offs

### Tuesday

- Topic: API gateway and routing concepts
- Learn:
  - model fallback patterns, quotas, endpoint routing

### Wednesday – Build Day 1

- Build a local vLLM service

### Thursday – Build Day 2

- Add:
  - request logging
  - token count tracking
  - basic route handling

### Friday

- Rest

---

## Week 22 – LLM platform architecture and RAG foundations

### Saturday

- Topic: multi-tenant AI gateway design
- Learn:
  - routing, fallbacks, quotas, logging, tracing

### Sunday

- Topic: embeddings and vector search basics
- Learn:
  - semantic search vs keyword search

### Monday

- Topic: Qdrant basics
- Lab:
  - set up a vector database and index sample docs

### Tuesday

- Topic: chunking and document ingestion
- Learn:
  - document splitting strategies and metadata

### Wednesday – Build Day 1

- Create a basic retrieval service using embeddings + Qdrant

### Thursday – Build Day 2

- Add:
  - vector indexing
  - metadata filtering
  - sample retrieval responses

### Friday

- Rest + checkpoint

---

## Week 23 – RAG and AI service workflow

### Saturday

- Topic: RAG architecture basics
- Learn:
  - ingestion, retrieval, generation, evaluation

### Sunday

- Topic: LangChain / LlamaIndex basics
- Lab:
  - connect a document store to a model response generator

### Monday

- Topic: hybrid search
- Learn:
  - vector + keyword retrieval patterns

### Tuesday

- Topic: prompt design and context window handling
- Focus:
  - better prompts and chunk management

### Wednesday – Build Day 1

- Build a simple RAG answer service

### Thursday – Build Day 2

- Add:
  - API security
  - logging
  - fallback behavior
  - rate limiting concept

### Friday

- Rest

---

## Week 24 – Platform mini-capstone

### Saturday

- Topic: plan the first full portfolio project
- Goal:
  - choose one clear AI platform service to build and deploy

### Sunday

- Topic: architecture design
- Document:
  - components
  - data flow
  - deployment stack
  - observability

### Monday

- Topic: define API contracts
- Include:
  - requests
  - responses
  - validation
  - auth

### Tuesday

- Topic: final integration setup
- Include:
  - model or LLM backend
  - database or vector store
  - deployment environment

### Wednesday – Build Day 1

- Build the project foundation

### Thursday – Build Day 2

- Finalize and document the system
- Goal:
  - clean capstone portfolio entry

### Friday

- Rest + review

---

# Phase 5: AI Platform Engineering and GenAI Deployment (Weeks 25–32)

Goal: build the skill set needed for production AI and LLM platform roles.

## Week 25 – AI gateway and request handling

### Saturday

- Topic: AI gateway design
- Learn:
  - routing, quotas, fallback, token accounting

### Sunday

- Topic: request validation and auth patterns
- Lab:
  - secure your AI service with API keys or token checks

### Monday

- Topic: prompt safety and guardrails basics
- Learn:
  - unsafe input handling, validation, content boundaries

### Tuesday

- Topic: monitoring for AI systems
- Learn:
  - latency, queue time, cost, token throughput, request failure rate

### Wednesday – Build Day 1

- Add a gateway layer for your AI service

### Thursday – Build Day 2

- Add guardrails, request logging, and metrics

### Friday

- Rest

---

## Week 26 – Qdrant + RAG system hardening

### Saturday

- Topic: semantic search and retrieval quality
- Learn:
  - embedding quality, metadata, retrieval tuning

### Sunday

- Topic: hybrid search
- Learn:
  - vector + keyword search combinations

### Monday

- Topic: chunking strategies and context design
- Lab:
  - test different chunk sizes over example docs

### Tuesday

- Topic: evaluation basics for RAG
- Learn:
  - relevance, faithfulness, helpfulness trade-offs

### Wednesday – Build Day 1

- Improve the RAG project with hybrid retrieval and metadata filters

### Thursday – Build Day 2

- Add evaluation notes and quality checks

### Friday

- Rest + review

---

## Week 27 – Deployment automation and cloud-level AI service delivery

### Saturday

- Topic: GitHub Actions for AI services
- Lab:
  - automate build + test + deploy flow

### Sunday

- Topic: Docker deployment for model services
- Lab:
  - ship built service in Docker and run it with Compose

### Monday

- Topic: cloud deployment patterns
- Learn:
  - EC2, ECS/EKS, and services architecture decisions

### Tuesday

- Topic: AI service infrastructure decisions
- Learn:
  - when to deploy as API, job runner, or inference service

### Wednesday – Build Day 1

- Add deployment automation for your AI service

### Thursday – Build Day 2

- Document a production runbook
- Goal:
  - service should be deployable with minimal manual effort

### Friday

- Rest

---

## Week 28 – Observability for AI platforms

### Saturday

- Topic: Prometheus and Grafana for AI systems
- Learn:
  - model latency, request count, queue depth, token usage

### Sunday

- Topic: alert thresholds for ML/AI services
- Lab:
  - design alerts for errors, latency, and throughput anomalies

### Monday

- Topic: drift and data quality basics
- Learn:
  - why AI monitoring is different from classic app monitoring

### Tuesday

- Topic: memory and GPU understanding
- Learn:
  - VRAM estimation and batching limits

### Wednesday – Build Day 1

- Add dashboards and alerts to your deployed service

### Thursday – Build Day 2

- Document failure modes and troubleshooting steps

### Friday

- Rest + checkpoint

---

## Week 29 – Fine-tuning and parameter-efficient adaptation

### Saturday

- Topic: PEFT and LoRA basics
- Learn:
  - low-rank adaptation and why it matters
- Resources:
  - official PEFT docs, Hugging Face blog posts, free explainers

### Sunday

- Topic: QLoRA basics
- Learn:
  - low-memory fine-tuning and practical trade-offs

### Monday

- Topic: fine-tuning workflow design
- Learn:
  - dataset prep, prompt format, validation loop

### Tuesday

- Topic: evaluation of tuned models
- Learn:
  - evaluation metrics and quality checks

### Wednesday – Build Day 1

- Create a small fine-tuning demo project

### Thursday – Build Day 2

- Evaluate output quality and document the workflow

### Friday

- Rest

---

## Week 30 – GenAI platform project sprint

### Saturday

- Topic: platform architecture review
- Focus:
  - what makes a production AI platform different from a notebook demo

### Sunday

- Topic: secure environment design
- Learn:
  - secrets, ingress, auth, environments

### Monday

- Topic: production deployment plan
- Document:
  - deployment architecture
  - traffic flow
  - monitoring
  - rollback strategy

### Tuesday

- Topic: cost and performance optimization
- Learn:
  - queueing, request batching, rate limiting, token savings

### Wednesday – Build Day 1

- Build the core GenAI platform service

### Thursday – Build Day 2

- Harden it for deployment and documentation

### Friday

- Rest + review

---

## Week 31 – Workloads and scaling for AI services

### Saturday

- Topic: scaling AI systems under load
- Learn:
  - autoscaling, concurrent request handling, queue depth

### Sunday

- Topic: GPU capacity and batching strategy
- Learn:
  - fit to model size and memory constraints

### Monday

- Topic: failover and fallback patterns
- Learn:
  - fallback models, safe routing, degraded mode

### Tuesday

- Topic: service tuning and optimization
- Focus:
  - time to first token, throughput, cost per request

### Wednesday – Build Day 1

- Improve the service under simulated high load

### Thursday – Build Day 2

- Add metrics and tuning notes

### Friday

- Rest

---

## Week 32 – Project hardening and portfolio polish

### Saturday

- Topic: stringing together all platform components
- Focus:
  - API, data flow, deployment, monitoring, docs

### Sunday

- Topic: cleanup and architecture diagram creation
- Deliverable:
  - polished project docs and diagrams

### Monday

- Topic: quality review
- Check:
  - code quality
  - tests
  - reproducibility
  - deployability

### Tuesday

- Topic: final portfolio summarization
- Write a project summary in job-ready language

### Wednesday – Build Day 1

- Final capstone sprint

### Thursday – Build Day 2

- Finalize repository polish and deployment notes

### Friday

- Rest + checkpoint

---

# Phase 6: Final Portfolio and Job Readiness (Weeks 33–52)

Goal: become interview-ready and turn your projects into strong evidence of platform engineering capability.

## Weeks 33–36 – Portfolio project deepening

Focus projects:

- Project A: fast API + database + Redis + Docker service
- Project B: ML training + inference + MLflow + deployment service
- Project C: LLM / RAG service with Qdrant + gateway + monitoring
- Project D: Terraform + Kubernetes deployment of an app or AI service

### Weekly rhythm

- Saturday: advanced concept study
- Sunday: deep bench practice
- Monday: architecture review
- Tuesday: implementation and bug fixing
- Wednesday: project sprint
- Thursday: project sprint
- Friday: review and notes

---

## Week 33

- Focus: production hardening
- Tasks:
  - CI/CD pipeline
  - logging and testing
  - health checks
  - clean environment docs

## Week 34

- Focus: deployment automation
- Tasks:
  - Terraform + cloud deployment
  - Docker Compose and K8s deployment notes

## Week 35

- Focus: monitoring and operations
- Tasks:
  - add Prometheus/Grafana
  - define alert thresholds
  - create runbook

## Week 36

- Focus: portfolio polish
- Tasks:
  - README cleanup
  - architecture diagrams
  - screenshots
  - final project summary

---

## Weeks 37–44 – System design and platform thinking

### Focus topics

- load balancers
- reverse proxies
- autoscaling
- caching layers
- database design trade-offs
- queues and workers
- high availability
- deployment strategies
- ML/AI platform trade-offs

### Weekly practice

- Saturday: system design reading
- Sunday: architecture diagram creation
- Monday: cloud review
- Tuesday: platform trade-off review
- Wednesday: project work
- Thursday: project work
- Friday: review and notes

---

## Weeks 45–52 – Final interview prep + job application readiness

### Focus

- behavior interviews
- technical interviews
- MLOps/system design interviews
- cloud interview questions
- project explanation and storytelling

### Final deliverables

- polished GitHub profile
- strong README files for all projects
- architecture diagrams
- deployment runbooks
- resume matched to MLOps / AI Platform Engineer job titles

### Interview topics to master

- Docker and containerization
- Kubernetes basics
- Terraform and state
- AWS core services
- CI/CD pipelines
- model deployment strategies
- monitoring and alerting
- LLM serving architecture
- RAG architecture
- AI platform trade-offs and failure modes

---

# Best Free Resource Strategy (Arabic Preferred, Then English)

## Arabic-first preference

Use Arabic resources for:

- Python fundamentals
- Linux basics
- Docker and Kubernetes explainers
- AWS concepts simple breakdowns
- MLOps concepts explained in simple language

## English resources to prioritize

- [Python Official Tutorial](https://docs.python.org/3/tutorial/)
- [FastAPI Docs](https://fastapi.tiangolo.com/)
- [Docker Docs](https://docs.docker.com/)
- [Kubernetes Docs](https://kubernetes.io/docs/)
- [AWS Skill Builder](https://skillbuilder.aws/) and AWS Docs
- [Terraform Learn](https://developer.hashicorp.com/terraform/learn)
- [Prometheus Docs](https://prometheus.io/docs/)
- [Grafana Docs](https://grafana.com/docs/)
- [MLflow Docs](https://mlflow.org/docs/latest/index.html)
- [Qdrant Docs](https://qdrant.tech/documentation/)
- [Hugging Face Docs](https://huggingface.co/docs)
- [vLLM Docs](https://docs.vllm.ai/)

---

# Project Milestones Checklist

- [ ] Python CLI project with validation and logging
- [ ] FastAPI service with PostgreSQL + Redis + Docker
- [ ] ML training pipeline with experiment tracking
- [ ] ML model serving API behind Docker
- [ ] Terraform deployment for AWS resources
- [ ] Local Kubernetes deployment of an app
- [ ] GitHub Actions CI/CD pipeline
- [ ] Prometheus + Grafana monitoring stack
- [ ] LLM or generative AI service
- [ ] Qdrant-based RAG service
- [ ] Final AI platform portfolio project

---

# Final Goal Checklist

By the end of this plan, you should be able to:

- explain the full lifecycle of a production AI or ML service
- deploy a service using Docker and cloud infrastructure
- understand Kubernetes and Terraform at a working level
- build and track ML experiments using MLflow
- serve a model or LLM in a production-like way
- monitor application and model health with dashboards and alerts
- build an AI platform portfolio that demonstrates real engineering skills
- comfortably read and contribute to TypeScript, React, React Native, and MERN-based codebases

---

## KodeKloud 100 Days Challenge Integration

These are useful, but they should be treated as boosters, not as the main roadmap.

### 1) KodeKloud 100 Days of DevOps

Best use:

- reinforcement after the Linux + Docker + GitHub Actions + CI/CD phase
- weekly challenge mode for hands-on practice
- repeat exercises until they feel second nature

Recommended placement:

- use it mainly during Phase 3 and Phase 4
- do 2–3 lessons per week instead of trying to finish all 100 days at once

### 2) KodeKloud 100 Days of Cloud

Best use:

- AWS and cloud comfort practice for IAM, networking, compute, and deployment
- ideal for reinforcing cloud architecture after the Terraform and EKS modules

Recommended placement:

- do this after the AWS + Terraform foundational blocks
- use it as supplementary cloud practice rather than the core learning source

### 3) KodeKloud 100 Days of MLOps

Best use:

- practical reinforcement for model deployment, experiments, pipelines, and serving workflows
- ideal after MLflow, Dockerized AI services, and inference service modules

Recommended placement:

- do this during Phase 4 and Phase 5, when you understand the core concepts

### Rule of thumb

- If you feel behind, do the KodeKloud challenge as a lab booster
- If you feel on track, keep it optional and limit it to 1–2 modules per week
- Do not let it replace the actual portfolio-building and deployment work

These challenges are excellent for repetition and confidence, but the real job readiness comes from building and deploying projects yourself.

---

## Recommended action for the next step

At this point, the roadmap is structured properly for your goal and includes the modern full-stack layer you wanted. The next best move is to turn this into a practical weekly checklist with exact tasks for each Saturday–Thursday block, while keeping the TypeScript / React / React Native / MERN layer as a support track rather than a distraction.

If you want, I can now convert this roadmap into a tighter execution version with:

1. exact weekly checkboxes for each week
2. one study task + one lab + one build project per day
3. a separate modern developer support track that is easier to follow in parallel
