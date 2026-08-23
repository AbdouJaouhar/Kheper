# Kheper Definition of Ready and Definition of Done

**Status:** Approved operating standard  
**Backlog ticket:** `KHEPER-006`  
**Applies to:** All `KHEPER-xxx` delivery tickets  
**Sources:** [MVP backlog](../MVP_BACKLOG.md), [product specification](product-spec.md), [delivery roles and RACI](delivery-roles.md), [milestones and dependency map](milestones-and-dependencies.md), and [release-success scorecard](release-success-scorecard.md)

## Decision

The checklists in Sections 3 and 4 of `MVP_BACKLOG.md` are the global minimum
Definition of Ready (DoR) and Definition of Done (DoD). This document makes
those criteria operational by naming the evidence, review roles, decision
rules, and exception process.

Readiness authorizes work; it does not predict that the work is easy or free of
risk. Done means the accepted outcome and applicable verification are present
on the merged revision. A commit, successful build, elapsed schedule, or agent
report alone is not evidence that a ticket is Done.

## Status and decision rules

- Only the repository maintainer selects work, accepts an exception, marks a
  ticket `Done`, merges a branch, or approves a release decision.
- A ticket moves from `Selected` to `In progress` only after the DoR check is
  recorded. Creating a branch is not a substitute for that check.
- If a required input disappears after work begins, record the ticket as
  `Blocked` and name the affected milestone rather than weakening its criteria.
- A ticket reaches `Ready for maintainer review` only when its acceptance
  criteria and all applicable DoD evidence pass.
- The maintainer marks it `Done` after accepting the result, normally on merge
  into `main`. Specialist or independent approvals remain mandatory when the
  ticket controls a later production or release gate.

## Definition of Ready

Before active delivery, the ticket or its linked planning record must answer
each applicable question below.

| Area | Ready when | Required record |
| --- | --- | --- |
| Outcome | The learner, maintainer, author, reviewer, or operational outcome is explicit and bounded. | Ticket summary and acceptance criteria |
| Acceptance | Each criterion is observable or testable; manual evidence is named where automation is unsuitable. | Acceptance checklist or test reference |
| Scope | Included behavior, exclusions, and any relationship to the MVP boundary are clear. | Ticket plus `mvp-scope.md` update if the boundary changes |
| Dependencies | Predecessor tickets, designs, schemas, content, assets, toolchains, devices, and external appointments are available or explicitly staged. | Backlog dependency and linked inputs |
| Ownership | Responsible discipline, accountable decision owner, required consultees, and reviewers match the RACI. | Ticket/review record; appointment record where required |
| Scholarly claims | Linguistic, transliteration, pronunciation, historical, visual-form, and construction claims are sourced or explicitly draft-only. | Source/review plan and confidence state |
| Rights | Any third-party source or asset has a plausible redistributable licence path; unknown rights are a blocker, not an assumption. | Provenance/licence record or planned audit reference |
| Accessibility | Semantics, text scaling, contrast, reduced motion, touch targets, handedness, and equivalent non-drawing access are considered where affected. | Acceptance criteria or a reasoned not-applicable note |
| Offline and privacy | Runtime connectivity, permissions, dependencies, data flows, collection, export, and local-only behavior are considered. | Privacy/offline impact statement |
| Data safety | Persistence, migration, interruption, backup/restore, import, rollback, and deletion risks are considered where state changes. | Data/migration impact statement and test plan |
| Localization and direction | Learner-visible strings and the separation of UI, inscription, and glyph direction are considered where affected. | Localization/direction impact statement |
| Delivery size | The ticket is small enough for one reviewable branch, or has been split without losing acceptance coverage. | Named split/follow-up tickets if needed |
| Evidence environment | Required fixtures, devices, OS/toolchains, controllable clocks, packet capture, or specialist samples are identified and obtainable. | Verification plan |

### Ready decision record

The minimum readiness record contains:

- ticket key and revision of its acceptance criteria;
- date and maintainer decision;
- intended outcome and explicit exclusions;
- dependency status and affected milestone;
- evidence plan and environments;
- responsible owner and required reviewers;
- accessibility, offline/privacy, migration, localization, scholarly, and
  licensing impact, using `Not applicable — <reason>` where appropriate;
- unresolved risks, with owner and trigger.

No signature ceremony is required for a ticket with no specialist or release
impact: a versioned backlog transition plus its branch/commit history is enough
when all fields above are recoverable. Production content, specialist claims,
security/privacy boundaries, dependencies, platform support, and release gates
require their named review records.

## Definition of Done

Every ticket must satisfy the core evidence below. The impact matrix that
follows adds evidence; it never removes the core requirements.

### Core evidence for every ticket

- The accepted behavior or operational outcome satisfies every ticket
  criterion, and the evidence identifies the tested revision.
- The change remains inside the selected ticket. Any necessary expansion was
  approved and recorded before implementation.
- Applicable automated checks and named manual checks pass; skipped checks have
  an approved exception, never a silent omission.
- Documentation, backlog status, durable decisions, and public instructions
  match the implemented behavior.
- No unrelated user work, secret, learner data, generated build output, signing
  material, or local database is included.
- The handoff reports files changed, user-visible outcome, checks and results,
  accessibility/offline/privacy/migration/licensing impact, content review
  status where relevant, and remaining limitations.
- Required reviewers approve, or the ticket remains short of the gate that
  needs their approval.

### Impact-specific evidence

| Change impact | Additional Done evidence | Required review |
| --- | --- | --- |
| Flutter/UI behavior | Static analysis, relevant unit/widget/integration tests, documented manual flow, smallest relevant layout, semantics, text scale, contrast, reduced motion, 44×44 controls, and handedness where affected | Maintainer; design/accessibility review at the named gate |
| Ubuntu development workflow | Clean launch command, stable window/process, repeatable hot reload after a real Dart edit, clean shutdown, and documented limitations versus mobile devices | Maintainer / application engineering |
| iOS/Android behavior | Supported toolchain build plus applicable device/emulator flow; platform permissions and runtime network boundary inspected | Maintainer / device engineering; accessibility and privacy review at the named gate |
| Local data or migration | Schema/version record, transactional and interruption fixtures, upgrade/downgrade or rollback behavior, backup/restore impact, and data-loss review | Maintainer / engineering and QA |
| Backup, restore, import, reset, or content activation | Valid, corrupt, incompatible, interrupted, replace/merge, rollback, and explicit-confirmation cases as applicable | Maintainer / engineering, QA, privacy/security |
| Dependency or build tooling | Necessity, version lock, maintenance/security status, licence, offline/privacy effect, reproducibility impact, and removal of unused alternatives | Maintainer; explicit approval before a production dependency is added |
| Learner content or scholarly claim | Stable IDs, sources, provenance, confidence, accessibility text, rights, approval state, correction impact, and the required linguistic/calligraphic/instructional review | Appointed specialist reviewers; maintainer records approval |
| Vector, construction, or scoring data | Deterministic fixtures, alternatives, anchors/topology/tolerances, explainable feedback, provenance, accessibility alternative, and calligraphy review | Appointed calligraphy reviewer plus other named specialists |
| Privacy or security boundary | Permission/dependency inspection, threat and data-flow impact, zero-collection/zero-runtime-request evidence where applicable, failure handling, and no secret exposure | Maintainer / security and privacy review |
| Release or gate decision | Exact app/content/scorer revisions, complete gate checklist, retained raw evidence, owners, known issues, rollback plan, artefact integrity, and formal decision | Roles named in the milestone map and scorecard; maintainer decides |
| Documentation/planning only | Cross-reference and internal-consistency checks, valid ticket/source links, no invented facts or approvals, and explicit operational owner | Maintainer and affected discipline owner |

### Non-applicable evidence

`Not applicable` is a scoped conclusion, not a shortcut. State the reason in the
handoff or review record. For example, a planning-only Markdown change may have
no runtime migration impact, but it still requires consistency checks and must
not weaken offline, privacy, accessibility, licensing, or scholarly gates.

## Review roles

The current appointments and absence rules in `delivery-roles.md` are
authoritative. Until a specialist is appointed, the maintainer may prepare and
review drafts but cannot convert that review into specialist approval.

| Decision | Responsible evidence producer | Required approver or recorder |
| --- | --- | --- |
| Ticket readiness, priority, scope, merge, and Done status | Maintainer or assigned implementer prepares the record | Repository maintainer |
| Product and interaction behavior | Product/design owner | Repository maintainer; appointed accessibility/instructional reviewers at their gates |
| Architecture, dependencies, data, build, and platform behavior | Application/device engineering | Repository maintainer; security/privacy and accessibility reviewers where affected |
| Linguistic claims, translation, sources, and authentic examples | Appointed lead Egyptologist | Repository maintainer records the specialist approval |
| Monumental/Hieratic form, recommended construction sequence, alternatives, and drawing fixtures | Appointed calligraphy reviewer | Repository maintainer records the specialist approval |
| Curriculum, remediation, mastery evidence, and assessment validity | Appointed instructional-design reviewer | Repository maintainer records the specialist approval |
| Candidate quality, accessibility, privacy/security, and release evidence | QA and the relevant appointed reviewers | Repository maintainer records the gate decision |

When one person currently fills several operational roles, the record must name
which role made each judgment. It must not imply independent review. A role
vacancy keeps the corresponding production gate closed.

## Exception process

An exception handles a temporary, explicit deviation from an otherwise
applicable DoR or DoD criterion. It does not silently redefine the ticket.

1. Before the status transition that needs the exception, create a versioned
   exception record using the template below in the ticket, pull request, or a
   dedicated planning document.
2. Name the unmet criterion, reason, evidence already available, learner or
   release risk, affected milestone, compensating control, owner, expiry or
   resolving ticket, and rollback/review trigger.
3. Obtain maintainer approval and every specialist approval whose gate is
   affected. Silence or unavailable reviewers is not approval.
4. Keep the ticket short of any production/release gate whose essential
   evidence is deferred. Link the exception wherever the affected evidence
   would normally be recorded.
5. Close the exception only with the missing evidence or an approved scope or
   policy change. Expired exceptions become blockers.

### Exception record template

| Field | Required value |
| --- | --- |
| Exception ID | `KHEPER-xxx-EXC-nn` |
| Ticket and revision | Ticket key plus commit/review revision |
| Criterion not met | Exact DoR, DoD, or ticket criterion |
| Reason and alternatives considered | Why compliance is not currently practical and what was rejected |
| Risk and affected milestone | Learner, content, data, accessibility, privacy, security, schedule, or release consequence |
| Existing evidence | What has passed, with revision/environment |
| Compensating control | Temporary containment; never presented as equivalent evidence |
| Owner and resolver | Named owner and resolving ticket/action |
| Expiry or trigger | Date, milestone, toolchain/device availability, or other objective trigger |
| Required approvals | Maintainer and affected specialist/gate owners |
| Decision | Approved/rejected, date, decision maker, and rationale |
| Closure | Missing evidence supplied or approved policy/scope change, with link |

### Criteria that cannot be waived for production or release

No exception may authorize a production bundle or public release that:

- adds an account, backend, telemetry, analytics, advertising, tracking, remote
  configuration, push registration, or learner-app runtime network dependency;
- permits learner data, handwriting, progress, or secrets to leave the device
  without the learner's explicit local export action;
- publishes unlicensed or non-redistributable material, or omits required
  attribution;
- presents unreviewed linguistic, historical, translation, pronunciation,
  visual-form, or recommended-construction claims as approved fact;
- risks silent loss or corruption of attempts, mastery, backups, active
  content, or rollback state;
- removes the equivalent non-drawing exercise or another required accessibility
  path;
- treats missing release-gate measurement, specialist approval, security/privacy
  evidence, or mobile platform evidence as a pass.

Resolving such a conflict requires a separately selected scope/policy ticket,
updates to all governing documents, the required reviewers, and maintainer
approval. Until then, the affected ticket or gate is `Blocked`.

## Approval record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer | Approve this DoR/DoD operating standard | Approved | 2026-08-23 |
| Future lead Egyptologist | Confirm scholarly evidence and exception boundaries | Pending appointment | — |
| Future calligraphy reviewer | Confirm construction/scoring evidence and exception boundaries | Pending appointment | — |
| Future instructional-design reviewer | Confirm learning and assessment evidence and exception boundaries | Pending appointment | — |
