# Kheper delivery roles and RACI

**Status:** Draft — pending maintainer approval
**Backlog ticket:** `KHEPER-004`
**Operating model:** Maintainer-only until appointments are explicitly recorded below.

## Interim staffing decision

The repository maintainer is the sole currently appointed delivery owner. There is no implicit deputy and no agent, automated system, or unappointed specialist may substitute for the maintainer or claim a review approval.

For every role that requires independent expertise, the maintainer may prepare drafts and coordinate evidence, but the relevant production gate remains closed until a qualified reviewer is appointed. If the maintainer is unavailable, the fallback is to pause work; no authority transfers automatically.

## Role coverage

| Function | Current responsible and accountable owner | Backup / absence rule | Appointment needed before |
| --- | --- | --- | --- |
| Product sponsor, scope, priorities, and merge/release decision | Repository maintainer | Pause decisions; no automatic substitute. | None for planning; maintainer approval for every merge/release. |
| Product and interaction design | Repository maintainer | Pause decisions; no automatic substitute. | Production design freeze. |
| Flutter/Dart application engineering | Repository maintainer | Pause implementation; no automatic substitute. | Production implementation beyond maintainer capacity. |
| iOS and Android device engineering | Repository maintainer | Pause platform-specific decisions; no automatic substitute. | Device-matrix and store release validation. |
| Content authoring and illustration | Repository maintainer, draft-only | Pause publication; no automatic substitute. | Production content freeze. |
| Egyptology and linguistic review | Vacant — future lead Egyptologist | Gate remains closed; no substitute. | Any learner-facing linguistic claim or authentic example. |
| Calligraphy and Hieratic-form review | Vacant — future calligraphy reviewer | Gate remains closed; no substitute. | Canonical vectors, construction sequences, alternatives, and drawing fixtures. |
| Instructional-design review | Vacant — future instructional-design reviewer | Gate remains closed; no substitute. | Assessment and curriculum production freeze. |
| Content QA | Repository maintainer | Pause production-bundle activation; no automatic substitute. | Production content freeze. |
| Accessibility and device QA | Repository maintainer | Pause release; no automatic substitute. | Candidate freeze. |
| Security and privacy review | Repository maintainer | Pause release; no automatic substitute. | Candidate freeze and release. |
| Release editor and rollback owner | Repository maintainer | Pause release; no automatic substitute. | Any content activation or public release. |

## RACI matrix

`R` = performs the work; `A` = makes the decision and records it; `C` = must be consulted; `I` = informed. “Appointed reviewer” means the relevant vacant role above, once explicitly appointed.

| Activity | R | A | C | I |
| --- | --- | --- | --- | --- |
| Product scope, roadmap, ticket selection, and merge/release decisions | Repository maintainer | Repository maintainer | Appointed reviewers where scope is affected | All appointed roles |
| UX flows, visual design, and accessibility design | Repository maintainer | Repository maintainer | Accessibility reviewer, instructional designer | Appointed engineers and QA |
| Flutter architecture, dependencies, local-data model, and build tooling | Repository maintainer | Repository maintainer | Security/privacy and accessibility reviewers | Appointed engineers and QA |
| iOS/Android implementation and device support | Repository maintainer | Repository maintainer | Accessibility and security/privacy reviewers | Product sponsor and QA |
| Original lesson, vector, illustration, and exercise drafts | Repository maintainer | Repository maintainer for drafts only | Egyptologist, calligraphy reviewer, instructional designer | Content QA and release editor |
| Linguistic claims, translations, source use, and authentic examples | Appointed lead Egyptologist | Repository maintainer records approval | Calligraphy reviewer and instructional designer | Content QA and release editor |
| Monumental and Hieratic forms, construction, alternatives, and scoring fixtures | Appointed calligraphy reviewer | Repository maintainer records approval | Lead Egyptologist and instructional designer | Content QA and release editor |
| Curriculum sequence, retrieval practice, remediation, and assessment validity | Appointed instructional designer | Repository maintainer records approval | Lead Egyptologist and calligraphy reviewer | Content QA and release editor |
| Content validation, accessibility text, and bundle readiness | Repository maintainer | Repository maintainer | Appointed specialist reviewers | Release editor |
| Security/privacy verification and offline/network inspection | Repository maintainer | Repository maintainer | Appointed security/privacy reviewer | Release editor |
| Candidate release, signing, publication, rollback, and correction | Repository maintainer | Repository maintainer | Release editor, QA, and required specialist reviewers | All appointed roles |

## Required appointment record

Before a named person assumes a vacant specialist role, record their name or organization, competence basis, conflict-of-interest disclosure, scope of authority, start date, backup/absence arrangement, and the specific gates they may approve. Update this document and the product charter in the same approved change.

## Approval record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer | Approve the interim delivery-role and RACI model | Pending | — |
