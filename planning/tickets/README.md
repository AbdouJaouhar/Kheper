# Versioned ticket-status workflow

`JIRA_MVP_BACKLOG.md` is the immutable planning inventory and defines the authoritative `KHEPER-xxx` keys, scope, dependencies, and acceptance criteria.

This directory tracks execution state without a SaaS issue tracker. Create a ticket file only after the maintainer explicitly selects a backlog item.

## Lifecycle

1. Copy `TEMPLATE.md` to `KHEPER-xxx.md`.
2. Set status to `Selected` and record the selected backlog ticket exactly.
3. Add decisions, links to branches/commits/pull requests, scope changes, and verification evidence as work proceeds.
4. Set status to `Ready for maintainer review` when complete.
5. Only the maintainer may set status to `Done` after deciding to merge.

Do not edit ticket identity, priority, dependencies, or acceptance criteria here. Propose planning changes in `JIRA_MVP_BACKLOG.md` with an explicit rationale.
