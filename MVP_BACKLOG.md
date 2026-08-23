# Kheper — MVP delivery backlog

**Document status:** Planning draft
**Source of truth:** `docs/product-spec.md` (Draft v0.2, migrated 22 August 2026)
**Scope:** Planning only. This file defines work; it does not authorize or contain implementation.
**Target:** An open-source, offline-only iOS and Android MVP that teaches the 24 Middle Egyptian uniliteral values in monumental hieroglyphic and Hieratic forms.

## 1. How to use this backlog

The identifiers below are proposed versioned ticket keys. Epics use `KHEPER-EPxx`; child issues use `KHEPER-xxx`. Estimates are intentionally omitted until the delivery team refines the tickets. A ticket may be split during refinement, but its acceptance criteria must remain covered.

### Issue types

- **Epic:** A release outcome containing multiple independently deliverable issues.
- **Story:** Learner, author, reviewer, or maintainer-visible value.
- **Task:** Product, design, content, engineering, research, or release work.
- **Spike:** Time-boxed investigation ending in a recorded decision or evidence.

### Priorities

- **P0:** Required for MVP release.
- **P1:** Important enabling work; required when listed in an MVP phase, but may be simplified without violating a P0 contract.
- **P2:** Explicitly outside the MVP and therefore not represented as delivery work in this backlog.

### Ticket status

The **Status** column is the versioned record of execution state. Git history records every transition.

- **Not started:** No work is authorized or active. This is the default.
- **Selected:** The maintainer explicitly authorized the ticket; no active implementation branch yet.
- **In progress:** Work is active on a ticket branch.
- **Blocked:** Work cannot proceed; record the blocker in the ticket row’s pull request or commit history.
- **Ready for maintainer review:** The requested work and verification are complete; only a maintainer decision remains.
- **Done:** The maintainer accepted the work, normally after merging it into `main`.

Only the maintainer may mark a ticket **Selected** or **Done**. Agents may update an authorized ticket between **In progress**, **Blocked**, and **Ready for maintainer review**, with a commit or pull-request reference.

### Fast-start decision

The original fast-start decision allowed `KHEPER-036` to begin after
`KHEPER-002` and `KHEPER-004` while `KHEPER-005` through `KHEPER-035` remained
planned. Deferred work must still be completed before the later feature,
content, quality, and release gates that depend on it.

On 23 August 2026, the maintainer approved an implementation-first continuation
after `KHEPER-036`: deliver `KHEPER-035`, then `KHEPER-037`, then `KHEPER-038`
to establish the public repository baseline, locked dependencies, and CI before
resuming Flutter feature work. `KHEPER-007` through `KHEPER-034` remain deferred
unless a selected implementation ticket depends on them directly or a named
phase/release gate requires them. Deferral does not waive their acceptance
criteria or permit dependent gates to close early.

### Delivery phases

| Phase | Indicative duration | Exit outcome |
|---|---:|---|
| 0 — Canon and prototype | 2 weeks | Product canon, content policy, five approved sign prototypes, and validated interaction direction |
| 1 — Vertical slice | 4 weeks | One complete unit works fully offline from authored content |
| 2 — MVP production | 6 weeks | All P0 features and all MVP content are feature/content complete |
| 3 — Calibration and alpha | 3 weeks | Accessibility, device, privacy, reliability, and drawing gates pass |
| 4 — Closed beta and release readiness | 3 weeks | Learning targets pass or are explicitly revised; release candidate is approved |

## 2. Scope guardrails

The MVP includes orientation, 24 uniliterals, approximately 30 reviewed words, approximately 40 lessons, six mixed reviews, three mastery checks, one final assessment, at least ten mini-readings, eight exercise families, deterministic vector drawing feedback, spaced review, local goals/streaks, an offline sign reference, local backup/restore, and English content.

The MVP excludes accounts, backend services, telemetry, advertising, runtime network access, arbitrary photo translation, free-form catalogue recognition, public user content, social features, leagues, placement testing, reminders, biliterals/triliterals as a curriculum stage, determinatives as a curriculum stage, full grammar, French/Arabic releases, camera-assisted identification, and classroom management.

## 3. Global Definition of Ready

The operational evidence, review, decision, and exception rules are maintained
in [`docs/definition-of-ready-and-done.md`](docs/definition-of-ready-and-done.md).

An issue may enter active delivery only when:

- its intended user or operational outcome is explicit;
- acceptance criteria are testable and the required evidence is named;
- dependencies, content inputs, designs, and specialist approvals are identified;
- accessibility, offline, privacy, localization, and migration impacts have been considered;
- unresolved scholarly claims or licenses are flagged rather than assumed;
- the issue is small enough to complete within one iteration, or has been split;
- the responsible discipline and required reviewers are assigned.

## 4. Global Definition of Done

The operational evidence, review, decision, and exception rules are maintained
in [`docs/definition-of-ready-and-done.md`](docs/definition-of-ready-and-done.md).

Unless a ticket narrows the requirement, delivery work is done only when:

- its acceptance criteria pass and evidence is linked in the relevant branch, pull request, or release record;
- applicable automated tests and documented manual checks pass;
- it works with airplane mode enabled and introduces no runtime network dependency;
- accessibility labels, reduced-motion behavior, dynamic text, contrast, and non-drawing alternatives are covered where relevant;
- learner-visible strings use localization keys and English copy is reviewed;
- relevant content carries sources, provenance, licenses, and specialist approvals;
- local data changes include migration, backup/restore, interruption, and rollback consideration;
- public documentation and architectural/content decisions are updated;
- no analytics, tracking, advertising, authentication, or remote configuration dependency is introduced;
- product, design, QA, and specialist reviewers sign off when applicable.

---

## EP01 — Product initiation and delivery governance

**Epic key:** `KHEPER-EP01`
**Primary phase:** 0
**Outcome:** The team has an approved, bounded, and operable MVP plan.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-001 | Done | Task | P0 | Ratify the product charter | Charter states target learners, problem, product promise, offline/open-source/privacy constraints, MVP outcome, and decision owners; sponsor and discipline leads approve it. | — |
| KHEPER-002 | Done | Task | P0 | Freeze MVP scope and exclusions | Every item in Sections 1.3, 1.4, and 14.3 of the specification is classified as MVP, later, or excluded; no P2 item appears on the MVP critical path. | KHEPER-001 |
| KHEPER-003 | Done | Task | P0 | Define measurable release success | Product, learning, drawing, privacy, accessibility, reliability, and performance thresholds are recorded with an evidence owner and collection method. | KHEPER-001 |
| KHEPER-004 | Done | Task | P0 | Establish delivery roles and RACI | Product, design, two app engineers, content/illustration, Egyptology, calligraphy, instructional design, QA, security/privacy, and release responsibilities have named owners and backups. | KHEPER-001 |
| KHEPER-005 | Done | Task | P0 | Publish milestones and dependency map | Phases 0–4, content critical path, drawing calibration path, design gates, alpha, beta, and release decision are represented in versioned project documentation with dependency links. | KHEPER-002, KHEPER-004 |
| KHEPER-006 | Done | Task | P0 | Agree Definition of Ready and Done | Team approves the criteria in this document, including required evidence, review roles, and exception process. | KHEPER-004 |
| KHEPER-007 | Not started | Task | P0 | Create risk and decision registers | Principal risks from the specification have owner, probability, impact, trigger, mitigation, and review date; decisions use durable ADR/product-decision records. | KHEPER-002 |
| KHEPER-008 | Not started | Task | P1 | Define defect severity and release-blocker policy | Severity levels cover learning harm, scholarly inaccuracy, data loss, privacy/network violations, accessibility blockers, scoring errors, crashes, and visual defects; release-blocker authority is named. | KHEPER-003 |
| KHEPER-009 | Not started | Task | P0 | Run MVP kickoff and baseline review | All leads review the specification, backlog, risks, assumptions, milestones, and scope-change process; unresolved items have owners and dates. | KHEPER-002–KHEPER-008 |

## EP02 — Scholarly canon, pedagogy, and content governance

**Epic key:** `KHEPER-EP02`
**Primary phase:** 0
**Outcome:** Educational claims and drawing guidance are consistent, reviewable, and honest about uncertainty.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-010 | Not started | Task | P0 | Approve linguistic and notation policy | Middle Egyptian scope, monumental-hieroglyphic and Hieratic forms, transliteration scheme, keyboard fallback, pronunciation disclaimer, Gardiner-code use, direction, grouping, script relationships, variants, and translation layers are documented and approved by the lead Egyptologist. | KHEPER-001 |
| KHEPER-011 | Not started | Task | P0 | Approve pedagogical construction policy | Policy consistently says “recommended construction sequence,” defines when alternatives are accepted, and prohibits claims of universal historical stroke order. | KHEPER-010 |
| KHEPER-012 | Not started | Task | P0 | Define mastery evidence policy | Recognition, phonetic/semantic recall, written production, and contextual use mappings are approved for every MVP exercise family; XP cannot count as mastery. | KHEPER-010 |
| KHEPER-013 | Not started | Task | P0 | Define content sourcing standard | Required source types, item-level citations, confidence labels, chronology, authentic-example rules, and unacceptable sources are documented. | KHEPER-010 |
| KHEPER-014 | Not started | Task | P0 | Define editorial roles and approval workflow | Author, content QA, instructional design, linguistic review, calligraphy review, and release-editor transitions and permissions are explicit; unapproved content cannot reach production. | KHEPER-004, KHEPER-013 |
| KHEPER-015 | Not started | Task | P0 | Define scholarly dispute and correction process | Disagreements, alternative approved representations, confidence changes, errata, versioning, and learner-impact review have a documented resolution path. | KHEPER-014 |
| KHEPER-016 | Not started | Task | P0 | Approve content and terminology style guide | Beginner language, technical terms, transliteration formatting, uncertainty, feedback tone, mnemonics, source notes, and accessible text conventions have examples and prohibited patterns. | KHEPER-010–KHEPER-015 |
| KHEPER-017 | Not started | Task | P0 | Audit source and asset licensing | Each planned source/asset has owner, license, redistribution status, attribution requirement, and replacement plan; incompatible assets are excluded. | KHEPER-013 |
| KHEPER-018 | Not started | Task | P0 | Create five fully reviewed sign prototypes | Five representative signs include complete identity, language, vector, construction, alternatives, anchors, topology, tolerance, feedback, examples, accessibility, provenance, and approvals. | KHEPER-011, KHEPER-014, KHEPER-016 |
| KHEPER-019 | Not started | Task | P0 | Hold Phase 0 canon gate | Egyptology, calligraphy, instructional design, product, design, and engineering approve the five prototypes and record required changes before scaling production. | KHEPER-018 |

## EP03 — Learner research and experience design

**Epic key:** `KHEPER-EP03`
**Primary phases:** 0–1
**Outcome:** Core flows are validated for beginners before full production.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-020 | Not started | Task | P0 | Validate primary learners and jobs | Curious beginner, serious independent learner, museum/travel learner, and teacher/student needs are mapped to MVP journeys; unsupported needs are flagged as later scope. | KHEPER-001 |
| KHEPER-021 | Not started | Task | P0 | Define information architecture | Learn, Review, Signs, Read, and Settings destinations include required content, navigation, offline states, and deep-link/back behavior. | KHEPER-020 |
| KHEPER-022 | Not started | Task | P0 | Design no-account onboarding | Flow explains course scope, direction, construction-sequence honesty, local-only data, and captures daily target, transliteration visibility, audio preference, handedness, and reduced motion without a consent wall. | KHEPER-010, KHEPER-021 |
| KHEPER-023 | Not started | Task | P0 | Design course path and mastery gates | Current unit, next lesson, reviews due, locked/unlocked states, mastery thresholds, and restart persistence are specified for all states. | KHEPER-012, KHEPER-021 |
| KHEPER-024 | Not started | Task | P0 | Design lesson player | One-task-per-screen flow covers teach, guide, retrieve, apply, close, progress, hints, exit/resume, feedback, and lesson completion evidence. | KHEPER-012, KHEPER-021 |
| KHEPER-025 | Not started | Task | P0 | Design drawing interactions | Trace, copy, recall, replay, speed, undo, clear, feedback overlay, handed controls, error recovery, and non-drawing fallback are specified for finger and stylus. | KHEPER-011, KHEPER-024 |
| KHEPER-026 | Not started | Task | P0 | Design review experience | Due count, estimated duration, 8–15 prompt session, modality mix, weak/overdue priority, empty state, and optional practice behavior are specified. | KHEPER-012, KHEPER-021 |
| KHEPER-027 | Not started | Task | P0 | Design sign reference and detail | Browse/search, canonical sign, replay, Gardiner/Unicode identity, functions, variants, examples, mastery dimensions, practice, source, and review note have beginner and advanced presentations. | KHEPER-016, KHEPER-021 |
| KHEPER-028 | Not started | Task | P0 | Design Read and mini-reading flow | Direction, grouping, hints, staged annotation, transliteration/gloss/translation layers, sources, and completion evidence are specified for controlled fragments. | KHEPER-010, KHEPER-021 |
| KHEPER-029 | Not started | Task | P0 | Design settings and local-data controls | Daily goal, streak, achievements, transliteration/audio preferences, accessibility, licenses/source revision, backup, restore preview/conflict, rollback, and destructive reset states are specified. | KHEPER-021 |
| KHEPER-030 | Not started | Task | P0 | Define accessible design system | Tokens/components cover 44×44 targets, contrast, color-independent status, 200% text, screen readers, switch access, reduced motion, one-handed use, smallest screens, and RTL preparedness. | KHEPER-021 |
| KHEPER-031 | Not started | Task | P0 | Test the interactive prototype with beginners | 5–8 representative beginners complete onboarding, one sign lesson, a direction task, review, and lookup; findings are prioritized and P0 usability failures are resolved in designs. | KHEPER-022–KHEPER-030 |
| KHEPER-032 | Not started | Task | P0 | Approve vertical-slice design package | Product, design, accessibility, content, and engineering approve annotated flows, component states, copy, assets, and acceptance references for one complete unit. | KHEPER-031 |

## EP04 — Open-source architecture and engineering foundation

**Epic key:** `KHEPER-EP04`
**Primary phases:** 0–1
**Outcome:** The project can build, test, and ship one auditable cross-platform offline application.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-033 | Not started | Spike | P0 | Validate the reference technical stack | A time-boxed Flutter/Dart, vector canvas, SQLite, signed-bundle, and browser-authoring assessment proves or revises the stack against performance, accessibility, offline, licensing, and staffing constraints; decision is recorded. | KHEPER-019, KHEPER-032 |
| KHEPER-034 | Not started | Task | P0 | Record architecture and privacy-boundary decisions | ADRs define module boundaries, absence of learner-feature networking, local storage, content loading, scoring, backup/import, localization, testing, and version ownership. | KHEPER-033 |
| KHEPER-035 | Done | Task | P0 | Establish the public repository baseline | MPL-2.0 license, README, contribution guide, code of conduct, security reporting, DCO/signed-commit policy, issue templates, decision-record structure, and public roadmap are present and reviewed. | KHEPER-017, KHEPER-034 |
| KHEPER-036 | Done | Task | P0 | Create cross-platform application foundation | A stable Ubuntu development preview launches from one command, displays embedded content without runtime connectivity, and supports repeatable Flutter hot reload without restarting the process. The same Flutter codebase retains generated iOS/Android runners; their platform builds are validated after the Ubuntu foundation stabilizes. | KHEPER-002, KHEPER-004 |
| KHEPER-037 | Not started | Task | P0 | Configure locked dependency management | Dependencies are pinned; license and vulnerability policies reject forbidden SDKs and incompatible licenses; update ownership is documented. | KHEPER-035, KHEPER-036 |
| KHEPER-038 | Not started | Task | P0 | Establish continuous integration | Formatting, static analysis, unit, schema, content, accessibility smoke, dependency, license, and build checks run for changes and protected release branches. | KHEPER-036, KHEPER-037 |
| KHEPER-039 | Not started | Task | P0 | Define automated and manual test strategy | Test pyramid, fixtures, golden tests, end-to-end flows, device matrix, offline inspection, packet capture, performance harness, accessibility checks, and evidence retention are documented. | KHEPER-003, KHEPER-034 |
| KHEPER-040 | Not started | Task | P0 | Configure supported platform matrix | iOS 15+, Android 8/API 26+, 2 GB RAM Android, 320 logical-pixel width, phone/tablet, finger/stylus, and older supported devices are represented in CI or manual labs. | KHEPER-039 |
| KHEPER-041 | Not started | Task | P0 | Establish reproducible build pipeline | Clean documented environments produce installable iOS and Android artifacts from a tagged revision with locked inputs, checksums, source archive, dependency report, and SBOM. | KHEPER-037, KHEPER-038 |
| KHEPER-042 | Not started | Task | P0 | Create versioning and migration policy | App, content schema, curriculum, scoring algorithm, construction profile, database, and backup versions have compatibility, migration, rollback, and deprecation rules. | KHEPER-034 |
| KHEPER-043 | Not started | Task | P0 | Add localization-ready application shell | All initial UI strings resolve through localization keys; layout separates UI direction from inscription direction and survives representative French/Arabic expansion fixtures. | KHEPER-030, KHEPER-036 |

## EP05 — Versioned content and authoring system

**Epic key:** `KHEPER-EP05`
**Primary phases:** 0–2
**Outcome:** Specialists can create, validate, approve, preview, package, and roll back course content without changing application code.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-044 | Not started | Task | P0 | Define versioned content schemas | Typed schemas cover course, unit, lesson, glyph, lexeme, reading, exercise, source, asset, review, construction, tolerance, feedback, localization, and manifest records with stable IDs. | KHEPER-018, KHEPER-042 |
| KHEPER-045 | Not started | Task | P0 | Define content-bundle manifest and signature contract | Schema/curriculum versions, checksums, assets, approvals, signature, channel, rollback parent, and compatibility are specified with valid and invalid examples. | KHEPER-042, KHEPER-044 |
| KHEPER-046 | Not started | Task | P0 | Build automated content validation | Validation covers unique IDs/codes, Unicode, paths, accepted sequences, answers, distractors, references, sources, approvals, localization, accessibility alternatives, checksums, and signature; failures block production bundles. | KHEPER-044, KHEPER-045 |
| KHEPER-047 | Not started | Task | P0 | Build structured authoring workflow | Authors can create/revise records with stable IDs, sources, changelog, confidence, and explicit review states; permissions enforce the editorial lifecycle. | KHEPER-014, KHEPER-044 |
| KHEPER-048 | Not started | Task | P0 | Build vector and construction-profile editor | Authorized users can define normalized paths, segment groups, direction/timing, pen lifts, alternatives, anchors, topology, tolerance, and feedback regions with validation. | KHEPER-018, KHEPER-047 |
| KHEPER-049 | Not started | Task | P0 | Build lesson and exercise authoring | Authors can assemble objectives, 8–14 scored interactions, hints, remediation, answer policies, mastery mappings, prerequisites, and close state from reusable schemas. | KHEPER-012, KHEPER-024, KHEPER-047 |
| KHEPER-050 | Not started | Task | P0 | Build authoring preview | Reviewers can preview lessons and drawings at representative phone/tablet sizes, handedness, text scale, reduced motion, and inscription direction before approval. | KHEPER-030, KHEPER-048, KHEPER-049 |
| KHEPER-051 | Not started | Task | P0 | Implement review and approval gates | Linguistic and calligraphic approvals are attributable and dated; unresolved or changed approved fields return to review; production packaging rejects incomplete approval. | KHEPER-014, KHEPER-046–KHEPER-050 |
| KHEPER-052 | Not started | Task | P0 | Build deterministic bundle assembly | Approved records and redistributable assets produce a versioned, signed, checksummed package reproducibly; the previous production package remains identifiable. | KHEPER-017, KHEPER-045, KHEPER-051 |
| KHEPER-053 | Not started | Task | P0 | Validate content-only lesson updates | A valid modified lesson bundle loads without a client release, preserves stable learner references, and rejects incompatible schema changes with a clear error. | KHEPER-052, KHEPER-057 |
| KHEPER-054 | Not started | Task | P0 | Document contributor authoring process | Setup, schemas, style, preview, validation, specialist review, asset licensing, bundle build, release, correction, and rollback are reproducible by a new contributor. | KHEPER-035, KHEPER-046–KHEPER-052 |

## EP06 — Local content, learner data, backup, and privacy controls

**Epic key:** `KHEPER-EP06`
**Primary phases:** 1–2
**Outcome:** All learning state remains durable, auditable, offline, and under learner control.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-055 | Not started | Task | P0 | Define local database model | Profile, course references, attempts, mastery, goals/streaks, settings, content releases, and administrative events have keys, constraints, indexes, retention, and version fields. | KHEPER-034, KHEPER-042, KHEPER-044 |
| KHEPER-056 | Not started | Task | P0 | Implement packaged course loader | First launch opens the complete embedded course without network/font dependencies and exposes typed records; missing/corrupt packaged content fails safely. | KHEPER-036, KHEPER-044, KHEPER-045 |
| KHEPER-057 | Not started | Task | P0 | Implement active-bundle repository and rollback | Only a fully validated bundle activates atomically; incompatible/invalid imports retain the current bundle; at least one compatible prior bundle can be restored. | KHEPER-045, KHEPER-046, KHEPER-056 |
| KHEPER-058 | Not started | Task | P0 | Persist immutable attempt events | Submitted attempts receive local UUID, timestamps/local date/offset, response summary or drawing data, scores, hints, latency, and all content/scoring versions; history is never silently rewritten. | KHEPER-055 |
| KHEPER-059 | Not started | Task | P0 | Make attempt and projection update transactional | A submitted attempt and its mastery/streak effects commit once as one transaction; forced termination before/after commit causes neither loss nor duplication. | KHEPER-058, KHEPER-092 |
| KHEPER-060 | Not started | Task | P0 | Persist settings and local profile | Locale, timezone, handedness, accessibility, transliteration/audio preferences, and created date survive restart and never leave the sandbox. | KHEPER-055 |
| KHEPER-061 | Not started | Task | P0 | Define versioned progress-backup format | Format documents scope, versions, integrity protection, compatibility, privacy warning, attempts, mastery, settings, goals, and streak evidence; raw data behavior is explicit. | KHEPER-042, KHEPER-055 |
| KHEPER-062 | Not started | Story | P0 | Export progress to a learner-selected file | Export occurs only after explicit action, requires no service, produces an integrity-protected documented archive, and reports success/failure without losing state. | KHEPER-061 |
| KHEPER-063 | Not started | Story | P0 | Preview and restore a local backup | Restore validates integrity/versions, shows date/content/scope, supports explicit replace or documented merge behavior, creates a rollback snapshot, and is interruption-safe. | KHEPER-057, KHEPER-061, KHEPER-062 |
| KHEPER-064 | Not started | Story | P0 | Reset all local learner data | A clearly confirmed action deletes attempts, mastery, preferences, goals, streaks, and sandbox backups entirely offline while retaining the packaged application course. | KHEPER-055, KHEPER-060 |
| KHEPER-065 | Not started | Task | P0 | Verify the zero-collection dependency boundary | Release dependency graph contains no analytics, crash reporting, ads, authentication, tracking, push registration, or remote config; application permissions are limited to explicit file actions. | KHEPER-037, KHEPER-056–KHEPER-064 |

## EP07 — Course path and lesson runtime

**Epic key:** `KHEPER-EP07`
**Primary phases:** 1–2
**Outcome:** Every MVP exercise and lesson can run, score, remediate, resume, and complete from content.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-066 | Not started | Story | P0 | Display the recommended course path | Stages, units, lessons, reviews, assessments, prerequisites, current position, mastery gate, due reviews, content version, and stable restart state render from content. | KHEPER-023, KHEPER-056 |
| KHEPER-067 | Not started | Task | P0 | Implement content-driven lesson state machine | Teach, guide, retrieve, apply, remediation, close, retry, hint, submit, exit, and resume states are deterministic and schema-driven. | KHEPER-024, KHEPER-049, KHEPER-058 |
| KHEPER-068 | Not started | Story | P0 | Preserve partial lesson progress | Exiting, backgrounding, interruption, or restart resumes at the next unanswered interaction without duplicating completed attempts. | KHEPER-059, KHEPER-067 |
| KHEPER-069 | Not started | Story | P0 | Run sign-introduction exercises | Animation, value, role, mnemonic, example, source-access path, audio convention, reduced-motion text, and exposure-only evidence render correctly. | KHEPER-016, KHEPER-067, KHEPER-082 |
| KHEPER-070 | Not started | Story | P0 | Run trace-construction exercises | Guide, animated start cues, broad tolerance corridor, stroke capture, feedback, retry, and hint accounting work for touch/stylus and accessibility alternatives. | KHEPER-025, KHEPER-067, KHEPER-082–KHEPER-089 |
| KHEPER-071 | Not started | Story | P0 | Run copy-construction exercises | Static reference beside a blank canvas, no overlay corridor, scoring, feedback, replay hint, retry, and mastery evidence follow authored rules. | KHEPER-070 |
| KHEPER-072 | Not started | Story | P0 | Run draw-from-memory exercises | Blank-canvas recall with post-submit feedback, optional recorded hints, remediation, and production evidence works without exposing the answer early. | KHEPER-071 |
| KHEPER-073 | Not started | Story | P0 | Run sign-recognition exercises | Sign/value/role prompts use reviewed plausible distractors, explicit multi-answer policy where needed, feedback, and recognition evidence. | KHEPER-046, KHEPER-067 |
| KHEPER-074 | Not started | Story | P0 | Run typed-recall exercises | Transliteration entry and symbol keyboard accept approved variants/plain-keyboard fallback, distinguish concept from input errors, support hints, and record phonetic evidence. | KHEPER-010, KHEPER-067 |
| KHEPER-075 | Not started | Story | P0 | Run reading-direction exercises | Learner chooses start point/order for left-to-right and right-to-left groups; UI direction stays independent; feedback explains facing cues. | KHEPER-010, KHEPER-067 |
| KHEPER-076 | Not started | Story | P0 | Run build-a-word exercises | Learner arranges signs into an authored valid group; grouping, orientation, answer variants, feedback, and contextual mastery score correctly. | KHEPER-010, KHEPER-067 |
| KHEPER-077 | Not started | Task | P0 | Implement feedback, hints, retries, and remediation | First failure permits retry, second reveals a partial guide, third replays construction/schedules earlier review; one useful correction is shown; hints reduce evidence but not completion. | KHEPER-016, KHEPER-067 |
| KHEPER-078 | Not started | Story | P0 | Present lesson completion evidence | Close view reports strengthened signs, mastery changes, weakest dimension, misconceptions, due count, and next path node separately from XP. | KHEPER-066, KHEPER-067, KHEPER-092 |
| KHEPER-079 | Not started | Task | P0 | Validate all exercise schemas end to end | Every MVP schema renders, scores, retries, remediates, persists, resumes, completes, and records the correct mastery dimensions from fixed fixtures. | KHEPER-069–KHEPER-078 |

## EP08 — Vector drawing and explainable scoring

**Epic key:** `KHEPER-EP08`
**Primary phases:** 0–3
**Outcome:** Natural finger/stylus drawings receive fast, tolerant, deterministic, sign-specific feedback.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-080 | Not started | Spike | P0 | Prove drawing feasibility with five signs | Prototype covers simple/complex/open/enclosed/multi-component signs, finger/stylus capture, replay, deterministic scoring, and explainable feedback on minimum hardware; risks and thresholds are recorded. | KHEPER-018, KHEPER-025, KHEPER-033 |
| KHEPER-081 | Not started | Task | P0 | Implement canonical vector renderer | Bundled vectors render consistently across supported sizes/platforms without OS hieroglyph fonts; orientation and grouping transforms preserve authored intent. | KHEPER-036, KHEPER-044 |
| KHEPER-082 | Not started | Story | P0 | Animate authored construction sequences | Segment groups, starts/ends, directions, timing, pen lifts, pause, replay, manual step, and three speeds are deterministic; reduced motion uses stepwise/text alternatives. | KHEPER-048, KHEPER-081 |
| KHEPER-083 | Not started | Task | P0 | Capture raw drawing input | Coordinates, timestamps, available pressure, pen-up boundaries, canvas size, and input type reproduce the visible path within one display pixel after normalization. | KHEPER-081 |
| KHEPER-084 | Not started | Task | P0 | Preprocess drawing input deterministically | Accidental taps are removed; points are resampled and lightly smoothed without erasing corners; translation/scale normalization is bounded; reflection/orientation are not freely normalized. | KHEPER-083 |
| KHEPER-085 | Not started | Task | P0 | Score shape, proportion, and placement | Component metrics implement the approved 40/20/15 weighting and per-sign tolerances; fixed fixtures produce stable component and overall scores. | KHEPER-048, KHEPER-084 |
| KHEPER-086 | Not started | Task | P0 | Score topology and completeness | Required components, connections, enclosures, intersections, containment, and omissions implement the approved 15% weighting; critical omissions cap acceptance. | KHEPER-048, KHEPER-084 |
| KHEPER-087 | Not started | Task | P0 | Score sequence and direction alternatives | Primary and approved alternative groups implement the 10% weighting; alternatives receive no penalty; final structure outweighs noncritical order. | KHEPER-048, KHEPER-084 |
| KHEPER-088 | Not started | Story | P0 | Return localized corrective drawing feedback | Failing fixtures map to a single reviewed issue code, plain-language correction, and region/overlay where applicable; result is more informative than red/green. | KHEPER-016, KHEPER-085–KHEPER-087 |
| KHEPER-089 | Not started | Story | P0 | Provide complete drawing controls and fallback | Undo, clear, replay, speed, handed layout, reduced motion, screen-reader labels, switch/keyboard access where supported, and an equivalent non-drawing exercise are always available. | KHEPER-025, KHEPER-030, KHEPER-082–KHEPER-088 |
| KHEPER-090 | Not started | Task | P0 | Meet drawing runtime budgets | On minimum devices, input-to-ink is under 50 ms p95 while targeting 60 fps and final scoring is under 150 ms p95; method and raw benchmark evidence are retained. | KHEPER-040, KHEPER-083–KHEPER-088 |
| KHEPER-091 | Not started | Task | P0 | Calibrate all 24 construction profiles | Two specialist reviewers approve each sign’s canonical form, sequences, alternatives, anchors, topology, tolerance, feedback, and test fixtures; false-reject/accept targets pass. | KHEPER-019, KHEPER-048, KHEPER-080–KHEPER-090, KHEPER-120 |

## EP09 — Mastery, review, goals, and motivation

**Epic key:** `KHEPER-EP09`
**Primary phases:** 1–2
**Outcome:** Progress reflects durable, multidimensional learning rather than activity alone.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-092 | Not started | Task | P0 | Implement four-dimensional mastery projection | R/P/W/C values remain in 0.00–1.00; displayed mastery uses 25/25/30/20 weights; fixtures prove M ≥ 0.80 and each required component ≥ 0.65 for completion. | KHEPER-012, KHEPER-058 |
| KHEPER-093 | Not started | Task | P0 | Implement prerequisite and mastery gates | Required lessons, unit threshold, weakest required component, and content prerequisites deterministically control unlock state; XP changes cannot unlock content. | KHEPER-066, KHEPER-092 |
| KHEPER-094 | Not started | Task | P0 | Implement offline review scheduler | Stability, difficulty, last review, due time, correctness, latency, hints, and modality weakness generate deterministic intervals and due queues from a controllable clock. | KHEPER-058, KHEPER-092 |
| KHEPER-095 | Not started | Story | P0 | Run mixed due-review sessions | Sessions contain 8–15 prompts, prioritize overdue then weak modalities, interleave controlled newer content, keep production/context due separately, and persist interruption safely. | KHEPER-026, KHEPER-079, KHEPER-094 |
| KHEPER-096 | Not started | Story | P0 | Offer review empty-state practice | With no due items, learner can choose mixed practice, reading practice, or continue the path without corrupting due dates or mastery history. | KHEPER-028, KHEPER-095 |
| KHEPER-097 | Not started | Story | P0 | Configure and track a daily goal | Learner selects meaningful exercises or minutes with one short lesson as default; progress is calculated locally and displayed separately from mastery. | KHEPER-022, KHEPER-060 |
| KHEPER-098 | Not started | Task | P0 | Calculate offline streaks robustly | Goal completion, local date, timezone change, clock anomalies, and restart reconcile without duplicate days, network time, punishment/payment, or content unlock effects. | KHEPER-058, KHEPER-097 |
| KHEPER-099 | Not started | Story | P0 | Award XP and MVP achievements | XP reflects completed learning/challenge difficulty; achievements represent durable outcomes; neither changes mastery or gates; all state is device-local. | KHEPER-092, KHEPER-097 |
| KHEPER-100 | Not started | Story | P0 | Surface learning status on home | Continue lesson, due foundational review, path progress, goal, streak, XP, and mastery are distinct, accessible, and consistent after restart. | KHEPER-023, KHEPER-093–KHEPER-099 |

## EP10 — Sign reference, Read, and settings experiences

**Epic key:** `KHEPER-EP10`
**Primary phase:** 2
**Outcome:** Learners can inspect signs, apply skills, and control the app entirely offline.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-101 | Not started | Story | P0 | Browse the packaged sign catalogue | Offline list supports unlocked/all-content policy, visual categories, stable navigation, empty/error states, and bundled thumbnails without OS glyph dependence. | KHEPER-027, KHEPER-056, KHEPER-081 |
| KHEPER-102 | Not started | Story | P0 | Search signs offline | Search resolves beginner label, transliteration/value, category, and Gardiner code with lossless special symbols, deterministic ranking, and no network call. | KHEPER-043, KHEPER-101 |
| KHEPER-103 | Not started | Story | P0 | View complete sign detail | Each MVP sign shows canonical construction/replay, identities, category, values/functions, mnemonic, confusions, alternatives, variants, words, lesson links, four mastery values, due date, practice, source, and review note. | KHEPER-027, KHEPER-091, KHEPER-092, KHEPER-101 |
| KHEPER-104 | Not started | Story | P0 | Practice from sign detail | Focused practice launches an appropriate learned exercise, records normal evidence, returns safely, and never bypasses course prerequisites. | KHEPER-079, KHEPER-094, KHEPER-103 |
| KHEPER-105 | Not started | Story | P0 | Complete controlled mini-readings | Read flow supports authored direction/grouping tasks, staged hints, source details, annotation layers, and contextual evidence for at least ten MVP fragments. | KHEPER-028, KHEPER-079, KHEPER-122 |
| KHEPER-106 | Not started | Story | P0 | Control learner preferences | Daily goal, transliteration visibility, audio, handedness, reduced motion, text/accessibility preferences, and advanced Gardiner display apply consistently and persist locally. | KHEPER-029, KHEPER-060 |
| KHEPER-107 | Not started | Story | P0 | Manage local backup and restore in Settings | Learner can export, inspect/restore, resolve conflicts, see rollback status, and recover from invalid/interrupted files using plain privacy-preserving language. | KHEPER-029, KHEPER-062, KHEPER-063 |
| KHEPER-108 | Not started | Story | P0 | View privacy, licenses, and source revision offline | Embedded screens accurately describe zero collection, local data, permissions, licenses/attributions, app/content versions, source revision, and public project/security routes without fetching content. | KHEPER-017, KHEPER-035, KHEPER-041, KHEPER-065 |
| KHEPER-109 | Not started | Story | P0 | Reset local progress safely in Settings | UI explains irreversible scope, requires explicit confirmation, completes offline, reports result, and returns to a valid fresh state. | KHEPER-029, KHEPER-064 |

## EP11 — MVP curriculum and educational assets

**Epic key:** `KHEPER-EP11`
**Primary phases:** 1–3
**Outcome:** The complete reviewed foundational course ships inside the application.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-110 | Not started | Task | P0 | Finalize MVP curriculum map | Approximately 40 lessons map objectives, prerequisites, new material limits, exercise counts, mastery dimensions, reviews, assessments, words, and readings; no later-stage curriculum is required. | KHEPER-012, KHEPER-019 |
| KHEPER-111 | Not started | Task | P0 | Author and approve Orientation lesson 1 | Language vs. script and periods are taught in 3–7 minutes with reviewed claims, accessible assets, exercises, sources, and approvals. | KHEPER-016, KHEPER-049, KHEPER-110 |
| KHEPER-112 | Not started | Task | P0 | Author and approve Orientation lesson 2 | Sign functions and the distinction among phonograms, logograms, determinatives, and related concepts are introduced without overstating MVP breadth. | KHEPER-111 |
| KHEPER-113 | Not started | Task | P0 | Author and approve Orientation lesson 3 | Reading direction and facing cues cover left-to-right and right-to-left independently of UI direction and meet final direction-assessment prerequisites. | KHEPER-112 |
| KHEPER-114 | Not started | Task | P0 | Author and approve Orientation lesson 4 | Quadrat grouping, transliteration convention, plain-keyboard fallback, and pronunciation uncertainty are introduced and assessed accessibly. | KHEPER-113 |
| KHEPER-115 | Not started | Task | P0 | Produce and approve uniliteral Unit 1 | Four signs and associated introduction, construction, recognition, production, words, context, remediation, accessibility, sources, and review content pass all gates. | KHEPER-019, KHEPER-110 |
| KHEPER-116 | Not started | Task | P0 | Produce and approve uniliteral Unit 2 | Next four signs meet the same complete-record and lesson requirements and intentionally interleave earlier signs. | KHEPER-115 |
| KHEPER-117 | Not started | Task | P0 | Produce and approve uniliteral Unit 3 | Next four signs meet the complete-record, lesson, review, and specialist-approval requirements. | KHEPER-116 |
| KHEPER-118 | Not started | Task | P0 | Produce and approve uniliteral Unit 4 | Next four signs meet the complete-record, lesson, review, and specialist-approval requirements. | KHEPER-117 |
| KHEPER-119 | Not started | Task | P0 | Produce and approve uniliteral Unit 5 | Next four signs meet the complete-record, lesson, review, and specialist-approval requirements. | KHEPER-118 |
| KHEPER-120 | Not started | Task | P0 | Produce and approve uniliteral Unit 6 | Final four signs meet the complete-record, lesson, review, and specialist-approval requirements; all 24 signs are covered exactly as intended. | KHEPER-119 |
| KHEPER-121 | Not started | Task | P0 | Produce approximately 30 reviewed words | Words are selected for instructional value, have stable records, sign grouping, transliteration, gloss/translation, functions, sources, pronunciation policy, difficulty, and lesson references. | KHEPER-010, KHEPER-110, KHEPER-115–KHEPER-120 |
| KHEPER-122 | Not started | Task | P0 | Produce at least ten controlled mini-readings | Each fragment has direction/grouping activities, appropriate learned signs, staged layers, source or controlled-example label, provenance, accessibility text, and specialist approval. | KHEPER-010, KHEPER-110, KHEPER-121 |
| KHEPER-123 | Not started | Task | P0 | Produce six mixed review lessons | Reviews interleave units and modalities, prioritize durable retrieval, contain no unintroduced requirement, and map correct evidence/remediation. | KHEPER-094, KHEPER-110, KHEPER-115–KHEPER-120 |
| KHEPER-124 | Not started | Task | P0 | Produce three mastery checks | Checks cover documented thresholds and required dimensions with reviewed answer policies, minimal cues, accessibility alternatives, and no XP-based pass path. | KHEPER-012, KHEPER-110, KHEPER-123 |
| KHEPER-125 | Not started | Task | P0 | Produce final foundational assessment | Assessment measures 24-sign recognition/production, direction, and controlled contextual reading using approved criteria and supports delayed-study reuse. | KHEPER-003, KHEPER-110, KHEPER-121–KHEPER-124 |
| KHEPER-126 | Not started | Task | P0 | Complete all reusable exercise instances | The curriculum contains approximately 450–600 valid authored instances across all eight MVP families; answer, distractor, hint, remediation, mastery, accessibility, and source validation pass. | KHEPER-046, KHEPER-115–KHEPER-125 |
| KHEPER-127 | Not started | Task | P0 | Produce reviewed visual and audio assets | Canonical vectors, thumbnails, variants, mnemonics, construction animations, and any pedagogical audio are redistributable, attributed, compressed, accessible, and honest about pronunciation. | KHEPER-017, KHEPER-091, KHEPER-115–KHEPER-126 |
| KHEPER-128 | Not started | Task | P0 | Freeze the content-complete MVP bundle | Release editor verifies inventory, stable IDs, links, approvals, sources, licenses, localizations, checksums, signature, schema compatibility, and rollback parent; no draft content remains. | KHEPER-051, KHEPER-052, KHEPER-091, KHEPER-110–KHEPER-127 |

## EP12 — Accessibility, localization readiness, performance, and resilience

**Epic key:** `KHEPER-EP12`
**Primary phases:** 2–3
**Outcome:** The complete application meets its inclusive, offline, device, and responsiveness contracts.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-129 | Not started | Task | P0 | Complete semantic accessibility implementation | Every screen, sign, exercise, control, state, error, and progress value has correct names, roles, states, order, instructions, and text alternatives for VoiceOver/TalkBack. | KHEPER-030, KHEPER-079, KHEPER-101–KHEPER-109 |
| KHEPER-130 | Not started | Task | P0 | Support text scaling, contrast, and touch targets | Core flows pass at 200% text, high contrast, bold text, color-independent feedback, and minimum 44×44 logical targets without clipped essential content. | KHEPER-030, KHEPER-129 |
| KHEPER-131 | Not started | Task | P0 | Support reduced motion and manual construction | All motion respects the preference; construction has manual step and text description; no essential information depends on animation. | KHEPER-030, KHEPER-082, KHEPER-129 |
| KHEPER-132 | Not started | Task | P0 | Support motor and alternative input access | Core flows pass one-handed, left/right-handed, switch/keyboard access where supported, and equivalent non-drawing exercises without mastery penalty for device class. | KHEPER-089, KHEPER-129 |
| KHEPER-133 | Not started | Task | P0 | Validate localization and mixed-direction architecture | All learner strings are externalized; Gardiner codes/transliteration/Unicode remain lossless; pseudo-localized French expansion and Arabic RTL fixtures do not confuse UI, inscription, or glyph direction. | KHEPER-043, KHEPER-079, KHEPER-101–KHEPER-109 |
| KHEPER-134 | Not started | Task | P0 | Meet startup and lesson-load budgets | On minimum devices, cold start is below 2.5 seconds target and cached lesson opens below 300 ms p95; test method and evidence are linked. | KHEPER-040, KHEPER-056, KHEPER-079 |
| KHEPER-135 | Not started | Task | P0 | Harden low-memory and interruption behavior | Backgrounding, OS termination, low storage/memory, rotation/resize where applicable, and repeated reopen preserve submitted attempts and recover to a valid state. | KHEPER-059, KHEPER-068, KHEPER-134 |
| KHEPER-136 | Not started | Task | P0 | Verify complete airplane-mode operation | Install, onboarding, course, all exercises, review, reference, Read, scoring, progress, licenses, backup, restore, import, rollback, and reset work indefinitely without connectivity. | KHEPER-057–KHEPER-109, KHEPER-128 |

## EP13 — Quality assurance, calibration, and learning validation

**Epic key:** `KHEPER-EP13`
**Primary phases:** 1–4
**Outcome:** Objective evidence shows the MVP is correct, safe, usable, accessible, private, and educationally credible.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-137 | Not started | Task | P0 | Create end-to-end P0 acceptance suite | Every P0 functional requirement and MVP release-checklist item maps to automated or named manual tests, owners, environments, evidence, and defect severity. | KHEPER-008, KHEPER-039 |
| KHEPER-138 | Not started | Task | P0 | Create deterministic learning fixtures | Fixed clocks and attempt histories verify path unlocks, mastery weights/thresholds, hints, remediation, review order, modality weakness, goals, streaks, and XP independence. | KHEPER-092–KHEPER-100 |
| KHEPER-139 | Not started | Task | P0 | Create drawing benchmark corpus | Consented or specialist-created fixtures cover correct natural variation, structural errors, finger/stylus, handedness, phone/tablet, simple/complex signs, alternatives, and critical omissions with labels. | KHEPER-003, KHEPER-091 |
| KHEPER-140 | Not started | Task | P0 | Pass drawing accuracy gate | Fewer than 5% of specialist-approved natural drawings are rejected, fewer than 10% of structurally wrong drawings are accepted, and no critical missing component is accepted. | KHEPER-090, KHEPER-139 |
| KHEPER-141 | Not started | Task | P0 | Pass data durability and migration suite | Forced termination and upgrades cannot lose/duplicate submitted attempts; migrations preserve history/versions; content corrections remain auditable. | KHEPER-042, KHEPER-058, KHEPER-059, KHEPER-135 |
| KHEPER-142 | Not started | Task | P0 | Pass backup, restore, import, and rollback suite | Round-trip preserves all required state; corrupt/incompatible/interrupted files are safe; conflict choice and rollback work; zero service contact is observed. | KHEPER-057, KHEPER-061–KHEPER-063 |
| KHEPER-143 | Not started | Task | P0 | Pass content integrity regression suite | Full bundle passes schemas, references, glyphs, paths, answers, distractors, assets, localizations, accessibility, approvals, sources, licenses, signatures, and representative lesson replays. | KHEPER-046, KHEPER-128 |
| KHEPER-144 | Not started | Task | P0 | Pass supported-device and performance matrix | All P0 flows pass iOS/Android minimum versions, 2 GB Android, 320-width screen, phone/tablet, finger/stylus, and performance budgets; exceptions are release-blocking or scoped out explicitly. | KHEPER-040, KHEPER-090, KHEPER-134–KHEPER-136 |
| KHEPER-145 | Not started | Task | P0 | Pass formal accessibility audit | VoiceOver, TalkBack, switch access, 200% text, reduced motion, bold/high contrast, touch targets, one-handed use, and non-drawing alternatives pass core flows with no release blocker. | KHEPER-129–KHEPER-132 |
| KHEPER-146 | Not started | Task | P0 | Pass privacy and zero-network verification | Dependency/permission inspection and packet capture during a full automated course run show no tracking SDK and zero outbound requests; privacy text matches behavior. | KHEPER-065, KHEPER-108, KHEPER-136 |
| KHEPER-147 | Not started | Research | P0 | Run specialist calibration review | Two independent Egyptology/calligraphy reviewers approve every MVP sign form, sequence policy, scoring fixture, linguistic record, authentic example, and uncertainty statement; disagreements are resolved/documented. | KHEPER-015, KHEPER-128, KHEPER-139 |
| KHEPER-148 | Not started | Research | P0 | Run beginner usability study | 8–12 beginners complete orientation, one sign lesson, delayed recall, lookup, backup understanding, and accessibility-relevant tasks; P0 findings are fixed and retested. | KHEPER-031, KHEPER-136, KHEPER-145 |
| KHEPER-149 | Not started | Task | P0 | Run closed alpha | Representative iOS/Android users validate offline continuity, content rollback, backup/restore, drawing, accessibility, and data reset; no open release blocker remains. | KHEPER-140–KHEPER-148 |
| KHEPER-150 | Not started | Research | P0 | Run closed beta learning study | Approved protocol measures delayed recognition, seven-day production, direction, contextual reading, usability, and drawing outcomes without production telemetry; consent/retention are outside the public app. | KHEPER-125, KHEPER-149 |
| KHEPER-151 | Not started | Task | P0 | Decide against educational success gates | Evidence is compared with 80% recognizing 20/24 after 24h, 70% producing 18/24 after 7d, 90% direction, and 75% on 4/5 contextual items; failures are fixed or targets are revised by documented specialist decision before release. | KHEPER-150 |
| KHEPER-152 | Not started | Task | P0 | Complete release-candidate regression | Final code/content/artifact revisions rerun all P0, content, drawing, performance, device, accessibility, privacy, durability, backup, and learning gates; no release blocker is open. | KHEPER-140–KHEPER-151 |

## EP14 — Open-source publication and mobile release readiness

**Epic key:** `KHEPER-EP14`
**Primary phase:** 4
**Outcome:** A traceable, auditable MVP release candidate is ready for public distribution on iOS and Android.

| Key | Status | Type | Pri. | Summary | Acceptance criteria | Depends on |
|---|---|---|---:|---|---|---|
| KHEPER-153 | Not started | Task | P0 | Finalize public build and contributor documentation | A new contributor can clone, validate content, run tests, build both platforms, understand architecture/privacy, and follow scholarly/release governance from tagged docs. | KHEPER-035, KHEPER-041, KHEPER-054 |
| KHEPER-154 | Not started | Task | P0 | Finalize legal and attribution package | MPL-2.0 code, CC BY-SA 4.0 original content/assets, third-party notices, machine-readable attribution, source citations, privacy notice, and export/import warnings are complete and consistent. | KHEPER-017, KHEPER-108, KHEPER-128 |
| KHEPER-155 | Not started | Task | P0 | Prepare store metadata and review notes | iOS/Android listings, screenshots, descriptions, accessibility details, age/content declarations, privacy answers, offline/no-account claims, reviewer instructions, and support/source links match the candidate. | KHEPER-146, KHEPER-152, KHEPER-154 |
| KHEPER-156 | Not started | Task | P0 | Prepare signed release artifacts | Tagged source, reproducible iOS/Android builds, packaged course, checksums, SBOM, dependency-license report, source archive, release notes, versions, and rollback bundle are generated and verified. | KHEPER-041, KHEPER-128, KHEPER-152 |
| KHEPER-157 | Not started | Task | P0 | Complete security and privacy release review | Threat model, local file parsing/signature verification, dependency vulnerabilities, permissions, data reset, backup exposure, security-reporting route, and packet-capture evidence receive sign-off. | KHEPER-142, KHEPER-146, KHEPER-156 |
| KHEPER-158 | Not started | Task | P0 | Complete product and specialist content sign-off | Product, lead Egyptologist, calligraphy, instructional design, design, accessibility, QA, privacy/security, and release editor approve the exact app/content versions. | KHEPER-147, KHEPER-151, KHEPER-152, KHEPER-156 |
| KHEPER-159 | Not started | Task | P0 | Hold MVP go/no-go review | Every item in the release checklist has evidence or was explicitly removed before freeze; no blocker remains; rollback/support owners and decision are recorded. | KHEPER-153–KHEPER-158 |
| KHEPER-160 | Not started | Task | P0 | Submit release candidate to both stores | The exact approved artifacts are submitted with traceable build/version identifiers; store questions and required corrections follow controlled change and regression. | KHEPER-159 |
| KHEPER-161 | Not started | Task | P0 | Approve MVP-ready handoff | Store-submittable/approved state, public source release, known non-blocking issues, support process, rollback procedure, content correction route, and post-release monitoring without in-app telemetry are documented and accepted. | KHEPER-160 |

---

## 5. Epic dependency chain

```text
EP01 Product initiation
  ├── EP02 Scholarly canon
  └── EP03 Experience design
          ↓
EP04 Engineering foundation
  ├── EP05 Content/authoring system ──→ EP11 MVP curriculum
  ├── EP06 Local data/privacy
  ├── EP07 Lesson runtime
  ├── EP08 Drawing/scoring
  ├── EP09 Mastery/review/motivation
  └── EP10 Reference/Read/settings
          ↓
EP12 Accessibility/performance/resilience
          ↓
EP13 QA/calibration/learning validation
          ↓
EP14 Release readiness
```

## 6. Phase exit checklists

### Phase 0 — Canon and prototype

- `KHEPER-001` through `KHEPER-019` are complete.
- The design prototype and five-sign drawing feasibility evidence are approved.
- The team can estimate content throughput using complete, reviewed examples.
- No unresolved product claim or license blocks the vertical slice.

### Phase 1 — Vertical slice

- One four-sign unit runs from authored, packaged content in airplane mode.
- Trace, copy, recall, recognition, typed recall, direction, and word-building interactions record attempts.
- Mastery, review, path gates, sign detail, resume, and basic accessibility work end to end.
- The slice passes minimum-device drawing latency and content rollback smoke tests.

### Phase 2 — MVP production complete

- All P0 learner and authoring capabilities are feature complete.
- All 24 signs, approximately 30 words, approximately 40 lessons, reviews, checks, assessment, and mini-readings are content complete.
- The production candidate bundle is approved, signed, embedded, and rollback-capable.
- Local backup/restore, goals/streaks, reference, settings, and privacy controls are complete.

### Phase 3 — Alpha complete

- Drawing accuracy/performance, accessibility, device, offline, privacy, data durability, import, backup, and rollback gates pass.
- Every linguistic record and authentic example has specialist approval and sources.
- No P0 defect or release-blocking scholarly issue remains.

### Phase 4 — MVP ready

- Closed beta and delayed learning measurements pass or have an explicit documented specialist revision.
- Final regression, legal, security/privacy, open-source, reproducible-build, and store packages are approved.
- The exact release candidate has go/no-go approval and is ready for or submitted to both stores.

## 7. Explicit post-MVP parking lot

Create separate future epics only after MVP scope is protected. The following are intentionally not hidden inside the tickets above:

- placement diagnostic and focused review filters;
- on-device reminders;
- biliterals, triliterals, determinatives, grammar, formulae, and extended readings;
- 80–120 then 200+ sign expansion;
- French and Arabic product/content releases;
- authentic photograph annotation and inscription lab;
- free-drawn catalogue recognition and camera-assisted identification;
- teacher progress export and classroom management;
- public user-generated lessons, social systems, competition, backend, accounts, or cloud sync.
