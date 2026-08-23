# Kheper public roadmap

Kheper is building an open-source, offline-only learning application for
Middle Egyptian monumental-hieroglyphic and Hieratic forms. This roadmap is a
public summary; [`MVP_BACKLOG.md`](MVP_BACKLOG.md) remains authoritative for
ticket dependencies and statuses.

## Current focus

The Ubuntu Flutter development foundation is complete. The maintainer approved
this implementation-first sequence on 23 August 2026:

1. `KHEPER-035` — complete the public repository baseline;
2. `KHEPER-037` — lock and govern dependencies;
3. `KHEPER-038` — establish continuous integration;
4. resume selected Flutter feature work from the stable Ubuntu workflow.

Planning tickets `KHEPER-007`–`KHEPER-034` are deferred unless selected work
depends on them or a named milestone requires them. They are not cancelled or
implicitly complete. Android and iOS toolchain/device validation is deferred
until the Ubuntu version stabilizes and remains required at the named mobile,
alpha, and release gates.

## MVP milestones

| Phase | Outcome |
| --- | --- |
| 0 — Canon and prototype | Approve the product canon, content policies, five representative signs, and interaction direction. |
| 1 — Vertical slice | Run one complete reviewed four-sign unit fully offline through authoring, learning, drawing, persistence, and review. |
| 2 — MVP production | Complete all P0 features and the reviewed 24-sign foundational course. |
| 3 — Calibration and alpha | Pass drawing, accessibility, device, performance, privacy, durability, backup, and rollback gates. |
| 4 — Closed beta and release | Pass or explicitly revise the learning targets, complete release evidence, and approve the exact candidate. |

The detailed milestone dependencies and evidence gates are in
[`docs/milestones-and-dependencies.md`](docs/milestones-and-dependencies.md).

## MVP boundary

The MVP includes the 24 uniliteral values in monumental-hieroglyphic and
Hieratic forms, orientation, controlled vocabulary and readings, eight exercise
families, deterministic drawing feedback, spaced review, local progress,
backup/restore, and an offline sign reference.

Accounts, cloud sync, telemetry, advertising, runtime network access, arbitrary
photo translation, camera recognition, public user content, social features,
French/Arabic releases, and later grammar breadth are outside the MVP. See
[`docs/mvp-scope.md`](docs/mvp-scope.md) for the frozen classification.

## How decisions appear here

- The maintainer selects work and records status in `MVP_BACKLOG.md`.
- Durable architecture and boundary decisions use `docs/adr/`.
- A roadmap change does not authorize implementation by itself.
- Missing specialist review keeps the corresponding content or release gate
  closed.
- The installed learner application remains offline-only and collects no
  learner data.

Kheper is currently maintainer-only. See [`CONTRIBUTING.md`](CONTRIBUTING.md)
before preparing work and [`SECURITY.md`](SECURITY.md) for private vulnerability
reporting.
