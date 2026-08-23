# Kheper MVP milestones and dependency map

**Status:** Versioned delivery map  
**Backlog ticket:** `KHEPER-005`  
**Sources:** [MVP backlog](../MVP_BACKLOG.md), [product specification](product-spec.md), [MVP scope](mvp-scope.md), and [release-success scorecard](release-success-scorecard.md)

## Purpose and authority

This document shows when the five MVP phases can exit and how the principal
design, content, drawing, application, quality, and release paths converge. It
does not replace ticket dependencies or statuses: `MVP_BACKLOG.md` remains the
authoritative execution record. A milestone is reached only when every named
gate has evidence and the responsible owner records the decision.

The indicative durations assume the staffing model in Section 14.1 of the
product specification. They are planning ranges, not release commitments.
Specialist review capacity and drawing calibration remain schedule-critical.

## Milestone sequence

| Milestone | Indicative phase | Required outcomes | Governing tickets and decision |
| --- | --- | --- | --- |
| M0 — Delivery baseline | Phase 0, week 0 | Scope, success measures, roles, milestones, readiness rules, risks, and kickoff are versioned. | `KHEPER-001`–`KHEPER-009`; maintainer confirms the delivery baseline. |
| M1 — Canon and prototype gate | Phase 0, weeks 1–2 | Linguistic, construction, mastery, sourcing, editorial, licensing, and style policies support five fully reviewed sign prototypes; learner flows and the vertical-slice design are approved. | Canon: `KHEPER-010`–`KHEPER-019`; design: `KHEPER-020`–`KHEPER-032`; gate decisions: `KHEPER-019` and `KHEPER-032`. |
| M2 — Engineering foundation | Phase 1 entry | The technical stack and boundaries are recorded; the repository, Ubuntu development workflow, locked dependencies, CI, tests, platform matrix, reproducible builds, and versioning policy are ready for feature delivery. | `KHEPER-033`–`KHEPER-043`. Ubuntu is the active development preview after `KHEPER-036`; Android/iOS build validation enters through `KHEPER-040`, `KHEPER-041`, and later release gates. |
| M3 — Offline vertical slice | Phase 1, weeks 3–6 | One reviewed four-sign unit travels through authoring, packaging, lesson runtime, drawing, mastery, review, reference, local persistence, accessibility smoke checks, and content rollback without runtime connectivity. | Design gates `KHEPER-019`, `KHEPER-032`; authoring/content `KHEPER-044`–`KHEPER-054`; local data `KHEPER-055`–`KHEPER-065`; runtime paths in `KHEPER-066`–`KHEPER-109`; drawing feasibility `KHEPER-080`; first content unit `KHEPER-110`, `KHEPER-115`. |
| M4 — Feature and content complete | Phase 2, weeks 7–12 | All MVP capabilities are implemented and the complete 24-sign course, words, lessons, reviews, assessments, readings, and redistributable assets form an approved rollback-capable candidate bundle. | Application `KHEPER-056`–`KHEPER-109`; curriculum `KHEPER-110`–`KHEPER-128`; content freeze decision `KHEPER-128`. |
| M5 — Calibration and alpha gate | Phase 3, weeks 13–15 | Drawing, accessibility, supported devices, performance, offline/privacy, durability, backup/restore, import, rollback, content integrity, specialist review, and beginner usability gates pass with no release blocker. | Hardening `KHEPER-129`–`KHEPER-136`; evidence `KHEPER-137`–`KHEPER-148`; closed-alpha decision `KHEPER-149`. |
| M6 — Closed beta learning gate | Phase 4, weeks 16–18 | The separately consented beta study measures delayed recognition, production, direction, and contextual reading; targets pass or a specialist-approved revision is recorded before release. | Assessment `KHEPER-125`; alpha `KHEPER-149`; study `KHEPER-150`; educational decision `KHEPER-151`. |
| M7 — Release-candidate decision | Phase 4 exit | Final regression, public documentation, legal attribution, store material, signed reproducible artifacts, security/privacy review, and specialist sign-off all refer to the exact candidate. | Regression `KHEPER-152`; release preparation `KHEPER-153`–`KHEPER-158`; maintainer go/no-go `KHEPER-159`; store submission and handoff `KHEPER-160`, `KHEPER-161`. |

## Principal dependency paths

Work may run in parallel within a phase, but none of these paths can be omitted.
An arrow means the downstream gate cannot close until the upstream ticket or
range has passed.

### Product, design, and vertical-slice gate

```text
KHEPER-005–009 delivery baseline
        ↓
KHEPER-010–019 scholarly canon ───────┐
                                     ├─→ KHEPER-032 design package
KHEPER-020–031 learner experience ───┘
                                             ↓
                         KHEPER-033–043 engineering foundation
                                             ↓
                              M3 offline vertical slice
```

The Phase 0 gate is intentionally dual: `KHEPER-019` approves the reviewed
five-sign canon and `KHEPER-032` approves the learner experience. Engineering
work beyond the already accepted Ubuntu foundation must not treat either gate
as implicit.

### Content critical path

```text
KHEPER-010–019 policies and prototypes
        ↓
KHEPER-044–052 schemas, validation, authoring, review, bundle assembly
        ↓
KHEPER-110 curriculum map
        ↓
KHEPER-115 → 116 → 117 → 118 → 119 → 120 six uniliteral units
        ↓                         ├─→ KHEPER-121 words → KHEPER-122 readings
KHEPER-123 reviews                └─→ KHEPER-091 calibrated sign profiles
        ↓
KHEPER-124 mastery checks → KHEPER-125 final assessment
        ↓
KHEPER-126 exercise inventory → KHEPER-127 assets → KHEPER-128 content freeze
        ↓
KHEPER-143 integrity → KHEPER-147 specialist review → KHEPER-149 alpha
```

The sequential unit chain protects deliberate interleaving and review. Draft
content may be prepared in parallel, but it cannot bypass source, rights,
accessibility, linguistic, instructional, or calligraphic approval gates.

### Drawing calibration path

```text
KHEPER-011 construction policy + KHEPER-018 prototypes + KHEPER-025 interaction design
        ↓
KHEPER-048 construction-profile editor + KHEPER-080 feasibility spike
        ↓
KHEPER-081 renderer → 082 animation → 083 capture → 084 preprocessing
        ↓
KHEPER-085 shape ─┬─ KHEPER-086 topology ─┬─ KHEPER-088 feedback
KHEPER-087 sequence┘                       └─ KHEPER-089 accessible controls
        ↓
KHEPER-090 runtime budgets → KHEPER-091 all 24 profiles
        ↓
KHEPER-139 benchmark corpus → KHEPER-140 accuracy gate
        ↓
KHEPER-147 specialist calibration → KHEPER-149 alpha
```

`KHEPER-140` is a release-blocking quantitative gate. Specialist-approved
natural drawings, structurally wrong fixtures, critical omissions, input
classes, and the locked scorer version must remain traceable together.

### Alpha, beta, and release-decision path

```text
KHEPER-128 content freeze + KHEPER-129–136 hardening
        ↓
KHEPER-137–148 quality and review evidence
        ↓
KHEPER-149 closed alpha
        ↓
KHEPER-150 closed beta → KHEPER-151 educational gate
        ↓
KHEPER-152 exact-candidate regression
        ↓
KHEPER-153–158 release evidence and sign-offs
        ↓
KHEPER-159 maintainer go/no-go
        ↓
KHEPER-160 store submission → KHEPER-161 MVP-ready handoff
```

Alpha cannot be replaced by desktop-only validation: its acceptance evidence
uses representative supported iOS and Android devices. The Ubuntu preview is
the current rapid-development environment; mobile toolchain, device, store,
accessibility, performance, offline, and packet-capture evidence is deferred to
the named platform and release gates, not waived.

## Gate evidence and ownership

| Gate | Minimum retained evidence | Decision owner |
| --- | --- | --- |
| Phase 0 canon | Approved policies, five complete prototypes, resolved review notes, source and rights records | Maintainer with appointed Egyptology, calligraphy, instructional-design, product, and design reviewers |
| Vertical slice | Candidate revision/content version, offline run, attempt/mastery persistence, drawing results, accessibility smoke results, rollback result | Maintainer with engineering, QA, design, content, and accessibility reviewers |
| Content freeze | Validated manifest, stable IDs, approvals, sources, licences, checksums, signature, compatibility and rollback parent | Maintainer / release editor and specialist reviewers |
| Calibration and alpha | Raw benchmark results, device/OS/input matrix, audit reports, defect disposition, privacy/network evidence, study protocol and findings | Maintainer with QA, accessibility, privacy/security, and specialist reviewers |
| Closed beta | Approved protocol, consent/retention record, numerator/denominator and exclusions for every learning threshold, app/content/scorer versions | Maintainer with instructional-design, Egyptology, and calligraphy reviewers |
| Release go/no-go | Exact revision and bundle, regression results, reproducible artifacts, checksums, SBOM, licences, legal/privacy review, rollback plan, all sign-offs | Repository maintainer |

An unavailable specialist or missing measurement keeps its gate closed. Targets
may be revised only through the documented specialist decision path; absence of
evidence is not a pass.

## Schedule control rules

### Maintainer-approved implementation fast track

On 23 August 2026, the maintainer selected the sequence `KHEPER-035` →
`KHEPER-037` → `KHEPER-038` following completion of the Ubuntu application
foundation in `KHEPER-036`. This sequence prioritizes a reviewable repository,
locked dependencies, and continuous integration so Flutter feature delivery can
resume quickly. Planning tickets `KHEPER-007`–`KHEPER-034` remain deferred
unless they become a direct dependency of selected work or are required to
close a named phase or release gate. This is sequencing authority only: it does
not mark deferred work complete or waive any product, scholarly, accessibility,
offline/privacy, licensing, design, quality, or release gate.

- Review this map when a dependency, phase boundary, critical-path ticket, or
  release gate changes; update the backlog in the same approved change.
- Report progress from completed gate evidence, not elapsed indicative weeks.
- Preserve the MVP boundary in `docs/mvp-scope.md`; post-MVP work does not enter
  a critical path without an explicit selected ticket and maintainer approval.
- Keep the app offline-only. Build, study, store, and repository workflows may
  use external systems, but the installed learner experience must not acquire a
  runtime network dependency.
- If a critical-path ticket is blocked, record the blocker and affected
  milestone in its commit or review record rather than silently resequencing it.
