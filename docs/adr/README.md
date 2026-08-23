# Architecture decision records

Record durable architectural, product-boundary, security, data-format, and release decisions here.

Use one file per decision: `NNNN-short-title.md`.

Copy [`0000-template.md`](0000-template.md) when creating an ADR. Replace
`0000` with the next unused four-digit sequence and keep the related
`KHEPER-xxx` ticket explicit.

Each ADR must include:

- context and the decision to make;
- chosen option and rationale;
- alternatives considered;
- consequences, migration/rollback impact, and owner;
- date, status, and related `KHEPER-xxx` ticket.

Do not create an ADR merely to restate an implementation detail. Create one when a decision would otherwise be costly, hard to reverse, or easy to misunderstand.
