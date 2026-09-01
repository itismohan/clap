---
title: Product Requirements Document
id: D07
version: 0.1
status: draft
---

# Product requirements document (PRD)

## Summary

Build CLAP as a multi-tenant **personalization and promotional engine** for Fortune 100 brands: offer catalog, audiences, real-time decisioning, campaign promotion, measurement, copilot, consent, and promo-abuse. Optional loyalty/referral/gamification as offer rails.

## Goals and non-goals

**Goals**

- Attract customers with acquisition offers (welcome, referral, trial).  
- Promote the right offer to the right person (decisioning + campaigns).  
- Govern eligibility, budget, frequency, consent, and legal approval.  
- Prove take-rate and incremental conversion.

**Non-goals (v1)**

- Standalone consumer super-app as the sold product.  
- Full CDP, ESP, or commerce replacement.  
- Credit scoring, bureau data, identity-protection SKUs.  
- Visual journey canvas (YAML/config journeys in MVP).  
- Paid-media DSP (export audiences later).

## Users

See [Personas](04-customer-personas.md). Primary UI: **Brand Marketer Console**. Consumer: **brand-hosted surfaces** via SDK/API.

## Scope by phase

| Phase | Scope |
| --- | --- |
| MVP (1 month) | See [MVP plan](../09-implementation/02-mvp-plan.md) |
| GA | SSO/SCIM, more channels, approvals, experiments, dedicated tenant option |
| Later | Paid media, partner catalog, autonomous optimization under approval |

## Functional themes (requirement IDs)

IDs are used in stories and APIs: `REQ-OFF-*`, `REQ-AUD-*`, `REQ-DEC-*`, `REQ-CAM-*`, `REQ-CHN-*`, `REQ-C360-*`, `REQ-MEA-*`, `REQ-COP-*`, `REQ-CON-*`, `REQ-ABU-*`, `REQ-ADM-*`, `REQ-RAIL-*`.

### Offer catalog — REQ-OFF

- CRUD offers: name, type (acquisition/conversion/retention/partner), value, creative variants, legal copy, start/end, timezone.  
- Eligibility rules (attributes, segments, first-time, geo, channel).  
- Stacking policy; mutual exclusion groups.  
- Budget (count, amount, or both); hard stop when exhausted.  
- Inventory / code pool optional.  
- Status: draft, in-review, approved, live, paused, expired.  
- Versioning and audit.

### Audience — REQ-AUD

- Rule-based segments; include/exclude.  
- CSV / S3 / CDP segment import.  
- Suppression lists (legal, unsubscribe, recent converters).  
- Lookalike (post-MVP).

### Decisioning — REQ-DEC

- `POST /v1/decide` returns ranked offers for a customer + context (page, cart, channel).  
- Policies: frequency cap, cooldown, consent, holdout assignment.  
- Fallback offer or empty.  
- Explanation payload for copilot/debug (feature flags to hide from consumer).  
- p99 &lt; 100ms for cached-feature path.

### Campaigns — REQ-CAM

- Attach audience + offer(s) + channel + schedule or event trigger.  
- Always-on vs. one-shot.  
- Budget and send caps.  
- Holdout % .  
- A/B on creative (GA).  
- Approval gate before live.

### Channels — REQ-CHN

- Email (SES), push (SNS/FCM/APNs later), in-app/web SDK.  
- Webhooks for “offer granted.”  
- SMS and paid-media export post-MVP.

### Customer 360 — REQ-C360

- Tenant-scoped profile: identifiers, traits, consents, events, offer history, propensity scores (optional).  
- Merge keys configurable (email, crm_id, device).  
- No bureau attributes in core.

### Measurement — REQ-MEA

- Impressions, clicks, grants, redemptions, revenue (if event provided).  
- Per offer, campaign, audience.  
- Holdout comparison.  
- Executive scorecard.

### Copilot — REQ-COP

- Natural language: generate campaign brief, suggest audience, explain last campaign, “who should receive this offer.”  
- Grounded in tenant data + policy; no PII in logs by default.  
- Human confirm before publish.

### Consent — REQ-CON

- Purposes: email, push, SMS, in-app personalization, sale/share if applicable.  
- Preference center API.  
- Honor suppression in decisioning and send.

### Promo abuse — REQ-ABU

- Velocity, duplicate accounts, code brute force, referral fraud (if rail enabled).  
- Risk score; manual queue.

### Admin — REQ-ADM

- Tenants, users, RBAC, brand kit, feature flags, audit export.  
- Enterprise SSO (GA).

### Offer rails — REQ-RAIL (secondary)

- Referral codes as acquisition offer type.  
- Points/cashback as incentive fields on an offer.  
- Light mechanic (e.g. one promo game) post-MVP.

## Metrics

See [Success metrics](../09-implementation/06-success-metrics.md).

## Dependencies

- Client CDP or CRM IDs and events.  
- Brand app/web for SDK.  
- ESP can be CLAP SES or client ESP via webhook (document both).

## Open questions

- Default identity spine (email vs. CRM ID) per tenant.  
- Whether checkout redemption is in CLAP or commerce-only with conversion events back.  
**Decision for MVP:** CLAP grants offers; commerce redeems; conversion webhook required.
