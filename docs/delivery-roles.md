# Kheper delivery roles and RACI

**Status:** Approved by maintainer
**Backlog ticket:** `KHEPER-004`
**Operating model:** Maintainer-only with explicitly recorded role declarations.

## Interim staffing decision

The repository maintainer is the sole currently appointed delivery owner. There
is no implicit deputy, and no agent or automated system may claim a review
approval.

The maintainer may self-declare a specialist role without publishing personal
identity, credentials, or conflict-of-interest information. The declaration
must still record the role, scope, start date, and absence rule. Every resulting
decision is labelled **maintainer self-review** and never counts as independent
review. Any gate that explicitly requires independent or multiple reviewers
remains closed until that separate requirement is met. If the maintainer is
unavailable, the fallback is to pause work; no authority transfers
automatically.

## Role coverage

| Function | Current responsible and accountable owner | Backup / absence rule | Appointment needed before |
| --- | --- | --- | --- |
| Product sponsor, scope, priorities, and merge/release decision | Repository maintainer | Pause decisions; no automatic substitute. | None for planning; maintainer approval for every merge/release. |
| Product and interaction design | Repository maintainer | Pause decisions; no automatic substitute. | Production design freeze. |
| Flutter/Dart application engineering | Repository maintainer | Pause implementation; no automatic substitute. | Production implementation beyond maintainer capacity. |
| iOS and Android device engineering | Repository maintainer | Pause platform-specific decisions; no automatic substitute. | Device-matrix and store release validation. |
| Content authoring and illustration | Repository maintainer, draft-only | Pause publication; no automatic substitute. | Production content freeze. |
| Egyptology and linguistic review | Repository maintainer — self-declared lead Egyptologist | Pause review; no automatic substitute. | Independent-review gates only. |
| Calligraphy and Hieratic-form review | Vacant — future calligraphy reviewer | Gate remains closed; no substitute. | Canonical vectors, construction sequences, alternatives, and drawing fixtures. |
| Instructional-design review | Vacant — future instructional-design reviewer | Gate remains closed; no substitute. | Assessment and curriculum production freeze. |
| Content QA | Repository maintainer | Pause production-bundle activation; no automatic substitute. | Production content freeze. |
| Accessibility and device QA | Repository maintainer | Pause release; no automatic substitute. | Candidate freeze. |
| Security and privacy review | Repository maintainer | Pause release; no automatic substitute. | Candidate freeze and release. |
| Release editor and rollback owner | Repository maintainer | Pause release; no automatic substitute. | Any content activation or public release. |

## RACI matrix

`R` = performs the work; `A` = makes the decision and records it; `C` = must be consulted; `I` = informed. “Specialist reviewer” includes a recorded maintainer self-declaration unless the applicable gate explicitly requires an appointed independent reviewer.

| Activity | R | A | C | I |
| --- | --- | --- | --- | --- |
| Product scope, roadmap, ticket selection, and merge/release decisions | Repository maintainer | Repository maintainer | Appointed reviewers where scope is affected | All appointed roles |
| UX flows, visual design, and accessibility design | Repository maintainer | Repository maintainer | Accessibility reviewer, instructional designer | Appointed engineers and QA |
| Flutter architecture, dependencies, local-data model, and build tooling | Repository maintainer | Repository maintainer | Security/privacy and accessibility reviewers | Appointed engineers and QA |
| iOS/Android implementation and device support | Repository maintainer | Repository maintainer | Accessibility and security/privacy reviewers | Product sponsor and QA |
| Original lesson, vector, illustration, and exercise drafts | Repository maintainer | Repository maintainer for drafts only | Egyptologist, calligraphy reviewer, instructional designer | Content QA and release editor |
| Linguistic claims, translations, source use, and authentic examples | Recorded lead Egyptologist | Repository maintainer records approval and whether it is self-review | Calligraphy reviewer and instructional designer | Content QA and release editor |
| Monumental and Hieratic forms, construction, alternatives, and scoring fixtures | Appointed calligraphy reviewer | Repository maintainer records approval | Lead Egyptologist and instructional designer | Content QA and release editor |
| Curriculum sequence, retrieval practice, remediation, and assessment validity | Appointed instructional designer | Repository maintainer records approval | Lead Egyptologist and calligraphy reviewer | Content QA and release editor |
| Content validation, accessibility text, and bundle readiness | Repository maintainer | Repository maintainer | Appointed specialist reviewers | Release editor |
| Security/privacy verification and offline/network inspection | Repository maintainer | Repository maintainer | Appointed security/privacy reviewer | Release editor |
| Candidate release, signing, publication, rollback, and correction | Repository maintainer | Repository maintainer | Release editor, QA, and required specialist reviewers | All appointed roles |

## Required role record

Before anyone other than the maintainer assumes a vacant specialist role,
record their name or organization, competence basis, conflict-of-interest
disclosure, scope of authority, start date, backup/absence arrangement, and the
specific gates they may approve. A maintainer self-declaration needs only the
role, scope, start date, and backup/absence arrangement, and cannot satisfy an
independence requirement. Update this document and the product charter in the
same approved change.

| Role holder | Role | Scope | Start date | Backup / absence | Review class |
| --- | --- | --- | --- | --- | --- |
| Repository maintainer | Lead Egyptologist | Linguistic and notation policy; linguistic claims, transliterations, translations, sign roles, sources, and authentic examples | 25 August 2026 | Pause; no automatic substitute | Maintainer self-review; not independent |

## Approval record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer | Approve maintainer specialist self-declaration rule | Approved | 25 August 2026 |
