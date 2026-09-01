---
title: Non-Functional Requirements
id: D09
version: 0.1
status: draft
---

# Non-functional requirements

## Availability and resilience

| ID | Requirement |
| --- | --- |
| NFR-AVL-001 | Production SLO 99.95% monthly for decisioning and ingest APIs (excluding planned maintenance). |
| NFR-AVL-002 | Multi-AZ EKS and RDS; no single-AZ dependency for control plane. |
| NFR-AVL-003 | RPO ≤ 15 minutes (database); RTO ≤ 4 hours for regional failover (see DR). |
| NFR-AVL-004 | Kafka/MSK consumer lag alerted; decisioning degrades to rules+cache if ranker down. |

## Performance

| ID | Requirement |
| --- | --- |
| NFR-PRF-001 | Decisioning p99 ≤ 100ms at tenant contracted QPS (cached features). |
| NFR-PRF-002 | CRUD APIs p99 ≤ 200ms read, ≤ 500ms write. |
| NFR-PRF-003 | Event ingest ≥ 10k events/sec per large tenant (horizontal). |
| NFR-PRF-004 | Campaign send throughput sized per tenant (email) without blocking decisioning pool. |

## Scale

| ID | Requirement |
| --- | --- |
| NFR-SCL-001 | Design for 10M MAU per large tenant; 100M profiles in shared cell with partitioning. |
| NFR-SCL-002 | Horizontal pod autoscaling on CPU, QPS, and Kafka lag. |
| NFR-SCL-003 | Tenant noisy-neighbor limits (rate limits per API key). |

## Security

| ID | Requirement |
| --- | --- |
| NFR-SEC-001 | TLS 1.2+ everywhere; mTLS in mesh. |
| NFR-SEC-002 | Encryption at rest (KMS); secrets in Secrets Manager. |
| NFR-SEC-003 | Enterprise SSO (OIDC/SAML) at GA; Cognito for MVP. |
| NFR-SEC-004 | RBAC + ABAC on PII fields. |
| NFR-SEC-005 | Immutable audit for offer and consent changes. |
| NFR-SEC-006 | Vulnerability scan in CI; no critical CVEs in prod images. |

## Privacy

| ID | Requirement |
| --- | --- |
| NFR-PRI-001 | GDPR/CCPA: access, delete, export (DSAR) APIs. |
| NFR-PRI-002 | Purpose limitation on decisioning features. |
| NFR-PRI-003 | Logs default to tokenized identifiers. |
| NFR-PRI-004 | Data residency control (region pin) for F100 tier. |

## Compliance (baseline)

SOC 2 Type II path, GDPR, CCPA/CPRA. PCI-DSS in-scope **only** if CLAP stores PAN (out of scope for MVP; no card numbers in CLAP).

## Observability

| ID | Requirement |
| --- | --- |
| NFR-OBS-001 | OpenTelemetry traces on decisioning path. |
| NFR-OBS-002 | RED/USE metrics; SLO burn alerts. |
| NFR-OBS-003 | AI: latency, token cost, guardrail hits, tool errors. |

## Usability and a11y

WCAG 2.2 AA on marketer console. Keyboard complete for primary offer and campaign flows.

## Localization

MVP: en-US. GA: tenant locale for offer copy; console en-US first.

## Configurability

Feature flags (AppConfig). Offer rules and campaign definitions as data, not deploys.
