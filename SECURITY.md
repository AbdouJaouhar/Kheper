# Security policy

## Reporting a vulnerability

Do not disclose a security vulnerability in a public issue, pull request, or discussion. Contact the repository maintainer privately through the GitHub profile associated with this repository and include:

- a clear description of the issue;
- affected files, versions, or devices;
- reproduction steps or a proof of concept where safe;
- potential impact; and
- any suggested mitigation.

The maintainer will acknowledge the report, assess impact, and coordinate a fix or disclosure timeline. Do not include learner data, secrets, or private credentials in a report.

## Security boundaries

Kheper’s learner application is offline-only. Any outbound request, tracking dependency, account flow, cloud-state dependency, unsafe local-file import, or exposure of local learner data is security-sensitive and must be treated as a release blocker.
