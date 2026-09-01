---
title: Database Design
id: D21
version: 0.1
status: draft
---

# Database design

## Store assignment

| Store | Use |
| --- | --- |
| RDS PostgreSQL | Tenants, users, offers, campaigns, grants, consent, audit, RBAC |
| DocumentDB | Flexible context, creative blobs, copilot traces (no PII) |
| Redis | Session, candidates, caps, budget approx, feature flags cache |
| OpenSearch | Marketer search, later semantic offers |
| S3 | CSV imports, exports, event archive |
| SageMaker Feature Store | Online features for decide (GA) |
| Neptune | Optional lookalike graph (post-MVP) |

DDL sketches: [schemas/database/001_core.sql](../../schemas/database/001_core.sql).

## Tenancy

Every table: `tenant_id UUID NOT NULL`. RLS policy `tenant_id = current_setting('app.tenant_id')::uuid`. App sets GUCs per request.

## Core ER (logical)

```
tenants 1--* users
tenants 1--* offers 1--* offer_creatives
offers 1--* offer_versions
offers 1--* offer_grants
tenants 1--* audiences 1--* audience_memberships
tenants 1--* campaigns
campaigns *--* offers (campaign_offers)
customers (profile) 1--* events
customers 1--* consents
customers 1--* experiment_assignments
```

## Partitioning

`offer_grants` and `events` partitioned by month. Indexes: `(tenant_id, customer_id, created_at)`.

## Budget

`offer_budgets (offer_id, cap_type, cap_value)` + `offer_budget_counters` reconciled from grants.

## PII minimization

Marketer DB searches use hashed email where possible. Raw email in customer-360 with field-level encryption option (F100 tier).

## Migrations

Flyway/Liquibase; expand-contract. No breaking OpenAPI without versioning.
