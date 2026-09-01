---
title: Low-Level Design
id: D19
version: 0.1
status: draft
---

# Low-level design (selected components)

## Decisioning service

**API:** `POST /v1/decide`  
**Input:** `tenant_id` (from auth), `customer_id` | `anonymous_id`, `channel`, `placement`, `context` (cart_value, page_type, locale).  
**Output:** `request_id`, `experiment_id`, `offers[]` `{offer_id, rank, creative, grant_token, reasons[]}`.

**Algorithm (MVP):**

1. Authenticate, rate-limit.  
2. Resolve profile (miss → anonymous traits only).  
3. Load placement policy (Redis).  
4. Candidate generation: live offers tagged to placement or campaign always-on.  
5. Filter: schedule, budget (approx counter), eligibility, stacking, consent, abuse denylist, frequency, holdout.  
6. Score: priority field + optional propensity trait.  
7. Take top K (usually 1 for hero).  
8. Optionally mint `grant_token` (TTL) if placement is grant-on-view vs grant-on-click (tenant config).  
9. Async event.

**Idempotency:** `Idempotency-Key` for grant-on-decide.

**Caching:** offer candidates per tenant 30–60s; profile 5–30s.

## Eligibility engine

JSON rules: `{ "all": [ { "path": "traits.first_purchase", "op": "eq", "value": false } ] }`  
Ops: eq, neq, gt, in, exists, time_window.  
Sandboxed evaluator; no user JS. Version pinned on offer.

## Grant ledger

Append-only `offer_grants` (event sourced). Status: granted, redeemed (from webhook), expired, revoked. Budget counters: Redis INCR with DB reconcile job.

## Campaign worker

Quartz/K8s CronJob or temporal-like (MVP: EventBridge + worker). Chunks audience IDs, respects quiet hours, calls channel-hub. Partial failure: retry batch, poison to DLQ.

## Copilot gateway

LangGraph supervisor. Tools: `search_offers`, `estimate_audience`, `get_campaign_metrics`, `draft_campaign`. Bedrock Claude. Guardrails: no raw PII tool. Publish is a separate authenticated API the UI calls after confirm.

## Console BFF

Next.js App Router; server actions call internal APIs with user JWT. No direct RDS from BFF.

## Failure modes

| Failure | Behavior |
| --- | --- |
| Redis down | Decide 503 or stale local cache short TTL |
| RDS down | CRUD fail; decide if candidates cached |
| SES down | Campaign retry; decide unaffected |
| Bedrock down | Copilot error; rest of product live |
