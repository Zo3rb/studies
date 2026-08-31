# 18-Month Sequential AI/ML Engineering Mastery Roadmap

## Checklist Version (Week-by-Week) + Project Briefs + AI Agent Prompt

**Target roles:**

- Primary: **AI Engineer / GenAI Developer**
- Secondary: **ML Engineer**

**Time commitment:** 15–20 hours/week  
**Stack:** Python, Node.js, AWS, Docker, LangChain, vector DBs, ML frameworks

---

## How to Use This Checklist

- Each week has:
  - ✅ Checkboxes for courses/modules to complete
  - ✅ Checkboxes for coding exercises / problems
  - ✅ A “Project / Deliverable” checkbox
- Mark `[x]` when done.
- If you miss a week, shift everything forward; don’t try to “catch up” by skipping.

---

# Phase 0 (Week 0): Setup & Baseline

## Week 0 – Setup & Python Refresh

- [ ] Install Python 3.11+, VS Code + Python extension, Node.js LTS, Docker Desktop.
- [ ] Create GitHub's studies repo sub folder `ai-ml-journey` with folders: `00-setup`, `01-math`, `03-ml`, `04-ai`, `projects` (Note: DSA solved in main repo `../DSA/`).
- [ ] Complete Python basics refresher (functions, modules, data structures).
  - [ ] Free: [Python for Everybody (Coursera)](https://www.coursera.org/specializations/python) – audit Weeks 1–3.
- [ ] Learn Jupyter notebooks; create `eda-titanic.ipynb` with basic EDA.
- [ ] Learn `numpy`, `pandas`, `matplotlib` basics via Kaggle Learn & Arabic YouTube tutorials (Mohamed Al Assaal / Elzero).
- [ ] Solve 5 easy DSA problems on LeetCode/HackerRank in Python (save in `../DSA/`).
- [ ] Write “My 18-month AI/ML goals” doc (roles, industries, salary, remote).

**Deliverable:**

- [ ] `00-setup/` with scripts + `eda-titanic.ipynb` + goals doc pushed to GitHub.

---

# Phase 1: Math Foundations (Weeks 1–16)

## Course 1.1 – Linear Algebra for ML (Weeks 1–6)

### Week 1 – Vectors & Basic Operations

- [ ] Khan Academy: Vectors, vector addition, scalar multiplication.
- [ ] Khan Academy: Dot product.
- [ ] Watch 3Blue1Brown – Essence of Linear Algebra #1–3.
- [ ] Implement vector operations in numpy (add, scale, dot).
- [ ] Write short notes: geometric meaning of dot product.

**Deliverable:**

- [ ] `01-math/linear-algebra/week1-vectors.ipynb` committed.

### Week 2 – Matrices & Transformations

- [ ] Khan Academy: Matrices, matrix addition, multiplication, transpose.
- [ ] Watch 3Blue1Brown #4–6 (linear transformations).
- [ ] Implement matrix operations in numpy.
- [ ] Visualize 2D transformations (rotate/scale a square).

**Deliverable:**

- [ ] `week2-matrices.ipynb` with code + plots.

### Week 3 – Systems of Equations

- [ ] Khan Academy: Solving systems of equations.
- [ ] Use `np.linalg.solve` on small systems.
- [ ] Write notes linking systems to ML (e.g., linear regression normal equation).

**Deliverable:**

- [ ] `week3-systems.ipynb`.

### Week 4 – Determinants & Inverses

- [ ] Khan Academy: Determinants, inverse matrices (conceptual).
- [ ] Compute determinants/inverses in numpy; interpret geometrically.

**Deliverable:**

- [ ] `week4-determinants-inverses.ipynb`.

### Week 5 – Eigenvalues & Eigenvectors (Intuition)

- [ ] Khan Academy: Eigenvalues/eigenvectors (focus on intuition).
- [ ] Watch 3Blue1Brown #14–15.
- [ ] Compute eigenvalues/eigenvectors in numpy for simple matrices.

**Deliverable:**

- [ ] `week5-eigen.ipynb`.

### Week 6 – Project: Linear Algebra in Action

- [ ] Build **Image Transformer Toy**:
  - [ ] Represent 2D points as vectors.
  - [ ] Apply matrix transformations (rotation, scaling, shear).
  - [ ] Expose via simple API (FastAPI or Node/Express) + minimal UI.
- [ ] Write README explaining the math and how to run.

**Deliverable:**

- [ ] `projects/image-transformer-toy/` repo with code + README.

---

## Course 1.2 – Probability & Statistics for ML (Weeks 7–12)

### Week 7 – Basic Probability

- [ ] Khan Academy: Events, sample space, addition/multiplication rules.
- [ ] StatQuest: Probability basics videos.
- [ ] Simulate coin flips/dice in Python; compare empirical vs theoretical probabilities.

**Deliverable:**

- [ ] `01-math/probability-stats/week7-probability.ipynb`.

### Week 8 – Conditional Probability & Bayes

- [ ] Khan Academy: Conditional probability, independence.
- [ ] Khan Academy: Bayes’ theorem.
- [ ] Implement a simple Bayesian update example (e.g., disease test).

**Deliverable:**

- [ ] `week8-bayes.ipynb`.

### Week 9 – Random Variables & Distributions

- [ ] Khan Academy: Random variables, discrete vs continuous.
- [ ] Khan Academy: Common distributions (normal, binomial, uniform).
- [ ] Sample from distributions using numpy; plot histograms.

**Deliverable:**

- [ ] `week9-distributions.ipynb`.

### Week 10 – Descriptive Statistics

- [ ] Khan Academy: Mean, median, mode, variance, std dev, percentiles.
- [ ] Compute stats on a dataset (e.g., housing prices) with pandas.

**Deliverable:**

- [ ] `week10-descriptive-stats.ipynb`.

### Week 11 – Correlation & Basic Inference

- [ ] Khan Academy: Correlation, covariance (intuition).
- [ ] Khan Academy: Confidence intervals, hypothesis testing (conceptual).
- [ ] Compute correlations, run simple hypothesis tests with scipy.

**Deliverable:**

- [ ] `week11-correlation-inference.ipynb`.

### Week 12 – Project: EDA + Probability Dashboard

- [ ] Choose a dataset (fintech transactions or health data).
- [ ] Perform EDA: distributions, correlations, outliers.
- [ ] Implement simple probability models (e.g., probability of high-value transaction).
- [ ] Build a small dashboard (Streamlit or Node + React) showing:
  - [ ] Histograms, box plots
  - [ ] Summary stats
  - [ ] Interactive filters
- [ ] Write README with insights.

**Deliverable:**

- [ ] `projects/eda-probability-dashboard/`.

---

## Course 1.3 – Calculus for ML (Weeks 13–16)

### Week 13 – Derivatives & Intuition

- [ ] Khan Academy: Derivatives as rate of change, basic rules.
- [ ] Watch 3Blue1Brown – Essence of Calculus #1–3.
- [ ] Implement numerical derivative (finite difference) for simple functions; plot.

**Deliverable:**

- [ ] `01-math/calculus/week13-derivatives.ipynb`.

### Week 14 – Chain Rule & Gradients

- [ ] Khan Academy: Chain rule, basic applications.
- [ ] Watch 3Blue1Brown #4–6.
- [ ] Compute gradients for simple multivariable functions numerically.

**Deliverable:**

- [ ] `week14-chain-rule-gradients.ipynb`.

### Week 15 – Gradient Descent Intuition

- [ ] Read short articles/blogs on gradient descent for ML.
- [ ] Implement gradient descent for minimizing a 1D quadratic function.
- [ ] Plot convergence.

**Deliverable:**

- [ ] `week15-gradient-descent.ipynb`.

### Week 16 – Project: Linear Regression from Scratch

- [ ] Implement univariate & multivariate linear regression using:
  - [ ] Closed-form solution (normal equation)
  - [ ] Gradient descent
- [ ] Use numpy only (no scikit-learn).
- [ ] Evaluate on a real dataset (e.g., housing prices).
- [ ] Visualize cost function convergence.
- [ ] Write README with math derivations and code explanation.

**Deliverable:**

- [ ] `projects/linear-regression-from-scratch/`.

---

# Phase 2: DSA Foundations (Weeks 17–28)

## Course 2.1 – DSA Fundamentals (Weeks 17–24)

Use: [NeetCode Roadmap](https://neetcode.io/roadmap) + LeetCode.

### Week 17 – Arrays & Strings

- [ ] Study patterns: two pointers, sliding window, prefix sums.
- [ ] Solve 8–10 problems (easy/medium) on arrays/strings.

**Deliverable:**

- [ ] `02-dsa/arrays-strings/` with solutions.

### Week 18 – Hash Maps & Sets

- [ ] Study frequency counting, two-sum patterns.
- [ ] Solve 8–10 problems.

**Deliverable:**

- [ ] `02-dsa/hash-maps/`.

### Week 19 – Linked Lists

- [ ] Implement singly/doubly linked list in Python.
- [ ] Solve 6–8 problems (reverse, cycle detection, etc.).

**Deliverable:**

- [ ] `02-dsa/linked-lists/`.

### Week 20 – Stacks & Queues

- [ ] Study valid parentheses, monotonic stacks, BFS-style queues.
- [ ] Solve 6–8 problems.

**Deliverable:**

- [ ] `02-dsa/stacks-queues/`.

### Week 21 – Binary Trees & BST

- [ ] Implement binary tree & BST classes.
- [ ] Study traversals (inorder, preorder, postorder).
- [ ] Solve 8–10 problems.

**Deliverable:**

- [ ] `02-dsa/trees/`.

### Week 22 – Heaps & Priority Queues

- [ ] Study top-k elements, merging intervals.
- [ ] Solve 6–8 problems.

**Deliverable:**

- [ ] `02-dsa/heaps/`.

### Week 23 – Graphs (BFS/DFS)

- [ ] Study representations, BFS, DFS, connected components.
- [ ] Solve 8–10 graph problems.

**Deliverable:**

- [ ] `02-dsa/graphs/`.

### Week 24 – Sorting, Searching, Recursion, DP Basics

- [ ] Study binary search, quick/merge sort (concept), recursion patterns, basic DP.
- [ ] Solve 8–10 mixed problems.

**Deliverable:**

- [ ] `02-dsa/sorting-searching-dp/`.

---

## Course 2.2 – DSA Integration & Mock Interviews (Weeks 25–28)

### Week 25 – Mixed Problem Solving (Arrays, Strings, Hash Maps)

- [ ] Solve 2–3 problems/day from NeetCode 150 (focus on these topics).

**Deliverable:**

- [ ] Updated LeetCode profile + notes.

### Week 26 – Trees, Graphs, Heaps

- [ ] 2–3 problems/day focused on trees, graphs, heaps.

**Deliverable:**

- [ ] Notes on patterns & mistakes.

### Week 27 – DP, Backtracking, Advanced Graphs

- [ ] 2–3 problems/day, including some medium/hard.

**Deliverable:**

- [ ] List of “hard patterns” and how you’re tackling them.

### Week 28 – Mock Interviews & Review

- [ ] Do 2–3 mock interviews (Pramp, interviewing.io, or a friend).
- [ ] Review weak areas; re-solve problematic patterns.

**Deliverable:**

- [ ] LeetCode/NeetCode profile with 120–150 solved problems.

---

# Phase 3: Core Machine Learning (Weeks 29–44)

## Course 3.1 – Machine Learning Fundamentals (Weeks 29–36)

Primary: [Andrew Ng – ML (Coursera)](https://www.coursera.org/learn/machine-learning) (audit)  
Supplement: [Hands-On ML notebooks](https://github.com/ageron/handson-ml2)

### Week 29 – Linear Regression & Gradient Descent

- [ ] Andrew Ng: Weeks 1–2 (linear regression, gradient descent).
- [ ] Implement linear regression with gradient descent in numpy.
- [ ] Compare with scikit-learn’s implementation.

**Deliverable:**

- [ ] `03-ml/ml-fundamentals/week29-linear-regression.ipynb`.

### Week 30 – Logistic Regression & Classification

- [ ] Andrew Ng: Logistic regression, classification, cost function.
- [ ] Implement logistic regression from scratch (numpy).
- [ ] Evaluate on a binary classification dataset.

**Deliverable:**

- [ ] `week30-logistic-regression.ipynb`.

### Week 31 – Regularization & Model Selection

- [ ] Andrew Ng: Overfitting, regularization (L1/L2).
- [ ] Use Ridge/Lasso in scikit-learn; compare models.

**Deliverable:**

- [ ] `week31-regularization.ipynb`.

### Week 32 – Neural Networks Basics

- [ ] Andrew Ng: Neural networks intuition.
- [ ] Build a simple MLP in PyTorch for MNIST or similar.

**Deliverable:**

- [ ] `week32-mlp-pytorch.ipynb`.

### Week 33 – Practical ML with scikit-learn

- [ ] Hands-On ML: End-to-end ML project chapters.
- [ ] Build end-to-end project on a tabular dataset.

**Deliverable:**

- [ ] `week33-end-to-end-ml.ipynb`.

### Week 34 – Decision Trees, Ensembles

- [ ] Hands-On ML: Decision trees, random forests, boosting.
- [ ] Train RF, XGBoost/LightGBM on a Kaggle dataset.

**Deliverable:**

- [ ] `week34-ensembles.ipynb`.

### Week 35 – Unsupervised Learning

- [ ] Hands-On ML: Clustering (k-means), PCA.
- [ ] Customer segmentation project using clustering.
- [ ] PCA on a dataset (e.g., MNIST digits, visualize 2D).

**Deliverable:**

- [ ] `week35-unsupervised.ipynb`.

### Week 36 – Project: End-to-End ML System

- [ ] Choose domain (fintech or health).
- [ ] Build:
  - [ ] EDA
  - [ ] Feature engineering
  - [ ] Multiple models (logistic regression, RF, XGBoost, MLP)
  - [ ] Proper evaluation (ROC-AUC, PR curves)
- [ ] Deploy as a service (FastAPI + Docker).
- [ ] Write README with methodology, results, how to run.

**Deliverable:**

- [ ] `projects/end-to-end-ml-system/`.

---

## Course 3.2 – MLOps & Production ML (Weeks 37–44)

Primary: [Full Stack Deep Learning](https://fullstackdeeplearning.com/) + [MLflow tutorials](https://mlflow.org/docs/latest/tutorials-and-examples/index.html)

### Week 37 – ML Pipelines & Experiment Tracking

- [ ] Learn ML pipelines, experiment tracking concepts.
- [ ] Integrate MLflow or W&B into your previous ML project.

**Deliverable:**

- [ ] `03-ml/mlops/week37-tracking/`.

### Week 38 – Model Registry & Versioning

- [ ] Learn model registries, versioning, staging.
- [ ] Use MLflow Model Registry to register models.

**Deliverable:**

- [ ] `week38-model-registry/`.

### Week 39 – Model Serving Patterns

- [ ] Learn batch vs real-time serving, model APIs.
- [ ] Serve a model with FastAPI + pickle/joblib.
- [ ] Add logging (latency, predictions).

**Deliverable:**

- [ ] `week39-model-serving/`.

### Week 40 – CI/CD for ML

- [ ] Learn CI/CD basics for ML.
- [ ] Add GitHub Actions CI to your ML project (run tests).

**Deliverable:**

- [ ] `.github/workflows/ml-ci.yml` + updated project.

### Week 41 – Monitoring & Drift Detection

- [ ] Learn model monitoring, data drift, concept drift.
- [ ] Use Evidently AI (or similar) to detect drift.

**Deliverable:**

- [ ] `week41-drift-detection/`.

### Week 42 – Data Engineering for ML (ETL/ELT)

- [ ] Learn ETL/ELT concepts, feature stores (high level).
- [ ] Build a simple Airflow/Dagster DAG:
  - [ ] Extract data from an API/CSV
  - [ ] Transform it
  - [ ] Load into a DB for training

**Deliverable:**

- [ ] `week42-etl-dag/`.

### Week 43 – Advanced MLOps Patterns

- [ ] Learn A/B testing for models, canary deployments (conceptual).
- [ ] Read case studies/blogs on MLOps in production.

**Deliverable:**

- [ ] Notes + links to 3–5 good articles.

### Week 44 – Project: ML System with MLOps

- [ ] Enhance your previous ML project:
  - [ ] Full experiment tracking
  - [ ] Model registry
  - [ ] Serving API
  - [ ] CI/CD
  - [ ] Basic monitoring/drift detection
- [ ] Write a system design doc (architecture, trade-offs).

**Deliverable:**

- [ ] `projects/ml-system-with-mlops/`.

---

# Phase 4: AI Engineering – LLMs, RAG, Agents (Weeks 45–68)

## Course 4.1 – LLM Fundamentals & Prompt Engineering (Weeks 45–50)

Primary: [DeepLearning.AI – Generative AI courses](https://www.deeplearning.ai/courses/) (audit) + [LangChain docs](https://python.langchain.com/)

### Week 45 – How LLMs Work (High Level)

- [ ] Learn tokens, embeddings, attention (conceptual).
- [ ] Read high-level blog posts on transformer architecture.

**Deliverable:**

- [ ] `04-ai/llm-fundamentals/week45-llm-basics.md`.

### Week 46 – Using LLM APIs

- [ ] Set up OpenAI/Anthropic (or open-source via HF).
- [ ] Implement simple completions, chat completions.
- [ ] Build a CLI chatbot.

**Deliverable:**

- [ ] `week46-llm-api-chatbot/`.

### Week 47 – Prompt Engineering Basics

- [ ] Learn zero-shot, few-shot, CoT, ReAct.
- [ ] Experiment with prompts for summarization, classification, Q&A.

**Deliverable:**

- [ ] `week47-prompt-experiments.ipynb`.

### Week 48 – LangChain Basics

- [ ] Learn models, prompts, chains, memory.
- [ ] Build:
  - [ ] A Q&A chain over a document
  - [ ] A chatbot with memory

**Deliverable:**

- [ ] `week48-langchain-examples/`.

### Week 49 – Advanced Prompt Patterns

- [ ] Learn structured outputs, tool-use prompts, function calling.
- [ ] Build prompts that output JSON, call “tools” (simulated).

**Deliverable:**

- [ ] `week49-advanced-prompts/`.

### Week 50 – Project: LLM-Powered Feature

- [ ] Build **Support Ticket Summarizer**:
  - [ ] Input: list of support tickets (text).
  - [ ] Output: summaries, categories, sentiment.
  - [ ] Use LLM API + LangChain.
  - [ ] Expose via API + simple UI.
- [ ] Write README with architecture.

**Deliverable:**

- [ ] `projects/ticket-summarizer-service/`.

---

## Course 4.2 – RAG & Vector Databases (Weeks 51–58)

Primary: [LangChain – RAG tutorials](https://python.langchain.com/docs/use_cases/question_answering/) + [LlamaIndex docs](https://docs.llamaindex.ai/)

### Week 51 – Embeddings & Similarity Search

- [ ] Learn text embeddings, cosine similarity.
- [ ] Embed documents; implement similarity search in numpy.

**Deliverable:**

- [ ] `04-ai/rag/week51-embeddings.ipynb`.

### Week 52 – Vector Databases

- [ ] Set up Pinecone free tier, Qdrant local, or `pgvector` (PostgreSQL vector extension).
- [ ] Index a small corpus; implement retrieval.

**Deliverable:**

- [ ] `week52-vector-db/`.

### Week 53 – RAG Basics

- [ ] Learn RAG architecture.
- [ ] Implement basic RAG with LangChain/LlamaIndex.

**Deliverable:**

- [ ] `week53-rag-basic/`.

### Week 54 – Chunking & Metadata Filtering

- [ ] Learn chunking strategies, metadata usage.
- [ ] Improve your RAG system with better chunking/filtering.

**Deliverable:**

- [ ] `week54-rag-chunking/`.

### Week 55 – Hybrid Search & Re-ranking

- [ ] Learn keyword + vector search, re-ranking strategies.
- [ ] Implement hybrid search in your RAG pipeline.

**Deliverable:**

- [ ] `week55-hybrid-search/`.

### Week 56 – RAG Evaluation

- [ ] Learn relevance, faithfulness, answer quality metrics.
- [ ] Build a simple evaluation harness.

**Deliverable:**

- [ ] `week56-rag-eval/`.

### Week 57 – Guardrails & Safety

- [ ] Learn input/output validation, PII detection, safety filters.
- [ ] Add guardrails to your RAG system.

**Deliverable:**

- [ ] `week57-guardrails/`.

### Week 58 – Project: Domain-Specific RAG Assistant

- [ ] Choose domain: **Health** or **Fintech**.
- [ ] Build:
  - [ ] Health Knowledge Assistant (WHO/CDC guidelines)  
         OR
  - [ ] Fintech Policy/FAQ Bot.
- [ ] Include indexing, RAG, evaluation, guardrails, API + UI.
- [ ] Write README with architecture & limitations.

**Deliverable:**

- [ ] `projects/domain-rag-assistant/`.

---

## Course 4.3 – Agents & Agentic Workflows (Weeks 59–66)

Primary: [LangGraph docs](https://langchain-ai.github.io/langgraph/) + [AutoGen](https://microsoft.github.io/autogen/) + [CrewAI](https://docs.crewai.com/)

### Week 59 – Tool Use Patterns

- [ ] Learn giving LLMs access to functions/tools.
- [ ] Build a simple agent that uses tools (calculator, DB query).

**Deliverable:**

- [ ] `04-ai/agents/week59-tool-use/`.

### Week 60 – Single-Agent Workflows

- [ ] Learn planning, reflection, multi-step reasoning.
- [ ] Enhance agent with memory and multi-step tasks.

**Deliverable:**

- [ ] `week60-single-agent/`.

### Week 61 – Multi-Agent Systems

- [ ] Learn multi-agent orchestration (CrewAI, AutoGen).
- [ ] Build a simple multi-agent workflow (researcher + writer).

**Deliverable:**

- [ ] `week61-multi-agent/`.

### Week 62 – Agentic Patterns for Real Apps

- [ ] Learn real-world patterns (support agent, data analyst agent).
- [ ] Read case studies/blogs on agentic systems in production.

**Deliverable:**

- [ ] Notes + 3–5 article links.

### Week 63 – Project: Personal Finance Assistant Agent

- [ ] Connect to mock transaction data.
- [ ] Agent can:
  - [ ] Summarize spending
  - [ ] Answer questions (“How much on food last month?”)
- [ ] Use tools for DB queries and calculations.
- [ ] API + UI.

**Deliverable:**

- [ ] `projects/finance-assistant-agent/`.

### Week 64 – Project: Health Triage Assistant (Informational Only)

- [ ] Ask symptom-related questions.
- [ ] Retrieve relevant guidelines via RAG.
- [ ] Provide general guidance with clear disclaimers.

**Deliverable:**

- [ ] `projects/health-triage-assistant/`.

### Week 65 – Production Patterns for Agents

- [ ] Learn rate limiting, cost control, monitoring for agents.
- [ ] Add logging, tracing, basic metrics to your agent.

**Deliverable:**

- [ ] Enhanced agent repo with observability.

### Week 66 – Project: Capstone Agentic System

- [ ] Combine RAG + agents + tools.
- [ ] Example: Fintech compliance assistant or health info assistant.
- [ ] Containerize with Docker.
- [ ] Add CI/CD (GitHub Actions).
- [ ] Write system design doc.

**Deliverable:**

- [ ] `projects/capstone-agentic-system/`.

---

# Phase 5: Specialization, Portfolio Polish, Job Hunt (Weeks 67–72+)

### Weeks 67–70 – Deepen Your Chosen Track

- [ ] Choose:
  - [ ] AI Engineer depth (advanced RAG, multi-tenant AI, cost/latency optimization)  
         OR
  - [ ] ML Engineer depth (fine-tuning LLMs, deeper MLOps, rigorous evaluation).
- [ ] Build 1–2 substantial projects in that track.

**Deliverable:**

- [ ] 1–2 new project repos with strong READMEs.

### Weeks 71–74 – Portfolio Polish & Brand Building

- [ ] Refine READMEs for all major projects.
- [ ] Write 3–5 blog posts (LinkedIn/Medium/Dev.to):
  - [ ] How you built your RAG system
  - [ ] Lessons from productionizing AI
  - [ ] Math-for-ML insights
- [ ] Ensure GitHub is clean and organized.

**Deliverable:**

- [ ] Updated GitHub + 3–5 published posts.

### Weeks 75–78 – Job Hunt Preparation

- [ ] Tailor CV:
  - [ ] Highlight back-end + AI/ML projects.
  - [ ] Use keywords: LLM, RAG, LangChain, vector DB, MLOps, AWS, Docker.
- [ ] Update LinkedIn:
  - [ ] Headline: “Back-End Engineer → AI/ML Engineer (LLMs, RAG, MLOps)”.
  - [ ] Post project write-ups.
- [ ] Apply to:
  - [ ] AI Engineer / GenAI Developer / LLM Engineer
  - [ ] ML Engineer (with GenAI/LLM focus)
  - [ ] Back-End roles with AI features
- [ ] Target healthtech & fintech companies.

**Deliverable:**

- [ ] Updated CV + LinkedIn + at least 10 applications sent.

---

# Project Briefs (Health & Fintech)

Use these as concrete specifications for your portfolio projects. Each brief includes:

- Goal
- Datasets/APIs
- Core features
- Stretch goals
- Tech suggestions
- Evaluation criteria

---

## Project Brief 1 – Health Knowledge RAG Assistant

**Goal:**  
Build a retrieval-augmented generation (RAG) assistant that answers general health questions using authoritative guidelines (not for diagnosis).

**Datasets / Sources:**

- Public health guidelines:
  - [WHO guidelines](https://www.who.int/publications)
  - [CDC guidelines](https://www.cdc.gov/)
- Optional (if you can get access):
  - [MIMIC-III notes](https://physionet.org/content/mimiciii/1.4/) – for advanced NLP experiments (requires credentialing).

**Core Features:**

- Ingest documents:
  - Scrape or download PDFs/HTML from WHO/CDC.
  - Convert to text, chunk with metadata (source, section, date).
- RAG pipeline:
  - Embed chunks (e.g., `text-embedding-3-small` or open-source embeddings).
  - Store in vector DB (Pinecone/Qdrant/pgvector).
  - At query time: retrieve top-k chunks, build prompt, call LLM.
- API + UI:
  - FastAPI or Node/Express backend.
  - Simple React or Streamlit UI.
  - Input: user question.
  - Output: answer + citations (links to source sections).
- Guardrails:
  - Clear disclaimer: “Not for medical diagnosis or treatment.”
  - Basic safety filter: refuse to answer high-risk diagnostic queries with a safe canned response.

**Stretch Goals:**

- Add:
  - Hybrid search (keyword + vector).
  - Re-ranking of retrieved chunks.
  - Evaluation harness:
    - Manually label 20–30 Q&A pairs with “good/bad” answers.
    - Compute simple metrics (e.g., % good answers).

**Tech Suggestions:**

- Backend: Python + FastAPI
- LLM: OpenAI/Anthropic or open-source via HF
- Vector DB: Qdrant (local) or Pinecone (free tier)
- Frontend: React or Streamlit

**Evaluation Criteria:**

- Answers are:
  - Relevant to the question.
  - Grounded in retrieved guidelines (citations match).
  - Safe (no diagnostic claims, proper disclaimers).
- System is:
  - Deployed (Dockerized, running locally or on a cheap cloud instance).
  - Documented (README with architecture diagram, how to run, limitations).

---

## Project Brief 2 – Fintech Fraud Detection ML System with MLOps

**Goal:**  
Build an end-to-end fraud detection system with proper MLOps (tracking, serving, CI/CD, monitoring).

**Datasets / Sources:**

- Kaggle credit card fraud datasets, e.g.:
  - [Credit Card Fraud Detection](https://www.kaggle.com/datasets/miadul/credit-card-fraud-detection-dataset)
  - [Credit Card Fraud 2025](https://www.kaggle.com/datasets/prince7489/credit-card-fraud-2025)
- Optional:
  - Synthetic transaction data generators (for extra volume/variety).

**Core Features:**

- Data pipeline:
  - Load CSV, perform EDA (class imbalance, feature distributions).
  - Split into train/validation/test with stratification.
- Modeling:
  - Baseline: logistic regression.
  - Stronger models: Random Forest, XGBoost/LightGBM.
  - Handle class imbalance (class weights, SMOTE, or similar).
- Evaluation:
  - Metrics: ROC-AUC, PR-AUC, precision/recall at specific thresholds.
  - Choose threshold based on business trade-off (false positives vs false negatives).
- Serving:
  - FastAPI service:
    - Endpoint: `POST /predict` with transaction features.
    - Returns fraud probability + recommended action.
- MLOps:
  - Experiment tracking with MLflow or W&B.
  - Model registry: register best model.
  - CI:
    - GitHub Actions to run tests and linting.
  - Basic monitoring:
    - Log predictions, latency.
    - Simulate drift by injecting synthetic “new” transaction patterns.

**Stretch Goals:**

- Add:
  - Batch inference job (e.g., nightly scoring of new transactions).
  - Simple dashboard (Metabase/Superset/Streamlit) showing:
    - Fraud rate over time
    - Model performance metrics
  - A/B test simulation: compare two models’ decisions on historical data.

**Tech Suggestions:**

- Python, scikit-learn, XGBoost/LightGBM
- MLflow or W&B for tracking
- FastAPI for serving
- Docker + GitHub Actions
- Optional: Airflow/Dagster for batch jobs

**Evaluation Criteria:**

- Model:
  - Has solid ROC-AUC/PR-AUC and justified threshold choice.
- System:
  - Is containerized and runnable via `docker compose up` or similar.
  - Has CI pipeline running tests.
  - Has basic monitoring/logging.
- README:
  - Explains data, modeling choices, metrics, and how to run everything.

---

## Project Brief 3 – Personal Finance Assistant Agent (Agentic RAG + Tools)

**Goal:**  
Build an agentic assistant that helps users understand their spending and answer questions about their transactions using tools + RAG.

**Datasets / Sources:**

- Mock transaction data:
  - Generate synthetic transactions (date, merchant, category, amount, currency).
  - Or use open transaction-like datasets from Kaggle.
- Optional:
  - Open Banking sandbox APIs (if available in your region) for realistic API integration.

**Core Features:**

- Data layer:
  - Store transactions in a database (Postgres/SQLite).
  - Provide functions/tools:
    - `get_transactions(user_id, date_range, category)`
    - `aggregate_spending(user_id, group_by=category/month)`
- Agent:
  - Use an LLM agent framework (LangGraph, AutoGen, or CrewAI).
  - Capabilities:
    - Answer questions like:
      - “How much did I spend on food last month?”
      - “What are my top 5 merchants by spend?”
      - “Show me my monthly spending trend.”
    - Use tools to query DB and compute aggregates.
- RAG component (optional but recommended):
  - Ingest personal finance tips / budgeting guidelines.
  - Allow agent to answer questions like:
    - “How much should I ideally spend on housing?”
    - “What’s a good emergency fund size?”
- API + UI:
  - REST API (FastAPI/Node) exposing agent endpoint.
  - Simple chat UI (React or Streamlit) where users ask questions.

**Stretch Goals:**

- Add:
  - Multi-turn conversations with memory (user context).
  - Budget suggestions:
    - Based on spending patterns, propose category budgets.
  - Guardrails:
    - Avoid giving specific investment advice; keep guidance general.
  - Observability:
    - Log agent actions, tool calls, latencies.

**Tech Suggestions:**

- Backend: Python + FastAPI
- Agent: LangGraph or CrewAI
- DB: Postgres or SQLite
- Frontend: React or Streamlit
- Optional: Docker + GitHub Actions for CI

**Evaluation Criteria:**

- Agent:
  - Correctly answers typical spending questions using tools.
  - Gracefully handles unknown/ambiguous queries.
- System:
  - Is containerized and documented.
  - Has basic logging/observability.
- README:
  - Describes architecture, tools, example queries, and limitations.
