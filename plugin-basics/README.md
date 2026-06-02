# Plugin Basics

A Claude Code plugin that bundles practical engineering workflows for everyday repository work: onboarding, documentation lookup, decision records, knowledge operations, CLAUDE.md maintenance, visual playgrounds, session reporting, and code simplification.

## What is included

### Skills

- **codebase-onboarding** — Analyze an unfamiliar repository and produce a structured onboarding guide with architecture, entry points, conventions, and starter CLAUDE.md guidance.
- **documentation-lookup** — Use current library and framework documentation through Context7 instead of relying on stale model knowledge.
- **architecture-decision-records** — Capture architectural decisions as ADRs with context, alternatives, and rationale.
- **knowledge-ops** — Manage ingestion, synchronization, deduplication, and retrieval across knowledge stores.
- **content-hash-cache-pattern** — Apply SHA-256 content-hash caching for expensive file-processing pipelines.
- **regex-vs-llm-structured-text** — Choose deterministic regex parsing first, adding LLM handling only for low-confidence edge cases.
- **claude-md-improver** — Audit and improve CLAUDE.md files so Claude Code has better project context.
- **canvas-design** — Create original static visual designs as PNG/PDF artifacts.
- **playground** — Build self-contained interactive HTML playgrounds for visual exploration and prompt generation.
- **session-report** — Generate HTML reports from Claude Code transcript usage data.

### Commands

- **code-review** — Review GitHub pull requests with parallel agent checks and confidence filtering.
- **revise-claude-md** — Reflect on a session and propose targeted CLAUDE.md updates.

### Agent

- **code-simplifier** — Simplify recently modified code while preserving behavior and project conventions.

## Installation

Install this plugin from its directory with Claude Code's plugin tooling, or publish it through your configured Claude Code plugin marketplace workflow.

## Use cases

Use this plugin when you want Claude Code to:

- understand a repository quickly;
- ground library answers in current documentation;
- record durable engineering decisions;
- improve Claude-specific project instructions;
- build reusable visual exploration tools;
- review or simplify recently changed code.
