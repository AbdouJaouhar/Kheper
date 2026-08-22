# Kheper MVP scope register

**Status:** Draft — pending maintainer approval
**Backlog ticket:** `KHEPER-002`
**Source:** [product-spec.md](product-spec.md), Sections 1.3, 1.4, and 14.3

## Decision

This register freezes the delivery boundary for the first Kheper release. Any item not classified as **MVP** below is outside the MVP critical path. Moving an item into MVP requires an explicit ticket, an update to this register and the product specification, and maintainer approval.

## Goals

All eight goals in Section 1.3 are MVP goals. The table makes their release interpretation testable.

| ID | Goal | Classification | MVP interpretation |
| --- | --- | --- | --- |
| G1 | Accessible entry | MVP | A complete beginner can start and complete the core path without prior Egyptology, linguistics, or calligraphy knowledge. |
| G2 | Durable learning | MVP | The course includes delayed review and the learning measures specified for the closed beta. |
| G3 | Productive skill | MVP | All 24 uniliteral values support reviewed, tolerant, explainable construction feedback in monumental-hieroglyphic and Hieratic forms. |
| G4 | Authentic reading | MVP | Controlled words, formulae, cartouches, and at least ten sourced or clearly labelled controlled mini-readings provide contextual reading; arbitrary-inscription translation is excluded. |
| G5 | Scholarly honesty | MVP | Claims distinguish conventions from historical certainty and carry source/review metadata. |
| G6 | Sustainable content | MVP | The shipped course uses versioned local content; the MVP may support signed local bundle import as specified, but has no online catalogue or service. |
| G7 | Universal availability | MVP | The English core course is free, works offline on supported iOS and Android devices, and contains no subscription, account, advertising, or runtime networking. |
| G8 | Public stewardship | MVP | Public source, documented licences, reproducible-build material, issue tracking, security route, and the maintainer-only governance policy are available at release. |

## Explicit exclusions

Every Section 1.4 non-goal is excluded from MVP delivery. These are not partial MVP features.

| Non-goal | Classification | Boundary |
| --- | --- | --- |
| Automatic translation of arbitrary photographs or complete inscriptions | Excluded | No camera recognition, OCR, or general translation workflow. |
| Comprehensive dictionary of every encoded or attested sign | Excluded | The MVP reference is limited to the taught sign set and reviewed course content. |
| Reconstructed spoken Egyptian presented as certain | Excluded | Educational pronunciation remains labelled as a convention where used. |
| Demotic, Coptic, cryptographic, or Ptolemaic specialist writing | Excluded | The MVP teaches only Middle Egyptian monumental hieroglyphic and Hieratic forms. |
| Public user-generated lessons, social feeds, leagues, or live tutoring | Excluded | No community, ranking, or live-service feature. |
| Generic English-to-hieroglyph conversion | Excluded | No letter-for-letter transliteration/conversion tool. |

## Release boundary register

| Capability | Classification | Release commitment |
| --- | --- | --- |
| Orientation; 24 uniliteral values in paired monumental-hieroglyphic and Hieratic forms; approximately 30 words; approximately 40 lessons | MVP | Complete English foundational course packaged with the application; each taught value has reviewed paired-script learning material. |
| Eight exercise families; deterministic drawing feedback; review; goals/streak | MVP | All specified exercise types and local progress features work offline. |
| Local backup; taught-sign reference; public source; no account or telemetry | MVP | Local-only data control, traceable content, and open publication materials. |
| Common biliterals/triliterals; determinatives; core grammar; 80–120 signs | V1 | First substantial expansion after the MVP; none is required for MVP release. |
| Richer readings; placement; focused review; French/Arabic; teacher progress export | V1 | Deferred until the MVP is stable and its content/review workflow is proven. |
| 200+ signs; authentic inscription lab; camera-assisted identification; advanced grammar; classroom management; specialist modules | V2 | Explicitly beyond V1 and unavailable in the MVP. |

## Deferred-requirement guard

The only current `P2` functional requirements are excluded from the MVP critical path:

| Requirement | Classification | Reason |
| --- | --- | --- |
| `FR-DRW-07` — catalogue-wide freehand sign recognition | V2 / P2 | It is a camera/recognition-scale capability beyond deterministic practice of the 24 taught signs. |
| `FR-CNT-03` — photograph and real-inscription annotation | V2 / P2 | It belongs to the authentic inscription lab, not the controlled MVP mini-readings. |

No MVP ticket may depend on, require, or silently implement a P2 requirement. A reference to an authentic object may provide source context, but it must not introduce annotation, image-analysis, or unrestricted interpretation functionality.

## Approval record

| Role | Decision | Status | Date |
| --- | --- | --- | --- |
| Repository maintainer | Approve this MVP boundary | Pending | — |
