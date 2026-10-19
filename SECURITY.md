# Security Policy

## Supported versions

| Version | Supported |
| --- | --- |
| 1.0.x | ✅ |

## Reporting a vulnerability

Please do **not** open a public issue for security problems.

Use GitHub's [private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)
for this repository, or contact the maintainer through the email listed on the GitHub profile.

Please include:

- a description of the issue and its impact;
- steps to reproduce;
- affected version and environment;
- any suggested remediation.

You can expect an initial response within 7 days.

## Scope notes

- The demo login (`123 / 123`) is not an authentication implementation and must not be used in production.
- The backend endpoints in `common/AppConfig.ets` point to expired course-project services and should be replaced.
- Signing certificates, passwords and `local.properties` are intentionally excluded from this repository.
