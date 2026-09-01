---
title: Functional Requirements
id: D08
version: 0.1
status: draft
---

# Functional requirements

Bounded contexts map to services in [microservice architecture](../04-architecture/01-microservice-architecture.md).

## OfferCatalog

| ID | Requirement |
| --- | --- |
| REQ-OFF-001 | Tenant users can create an offer with type, value, schedule, and at least one creative variant. |
| REQ-OFF-002 | Eligibility is expressed as a versioned rule document (JSON) evaluated at decision and send time. |
| REQ-OFF-003 | Budget may be impression, grant, or monetary cap; system stops promotion when cap hit. |
| REQ-OFF-004 | Stacking groups prevent incompatible offers in one decision. |
| REQ-OFF-005 | Lifecycle states: draft → in_review → approved → live → paused → expired. |
| REQ-OFF-006 | Every mutation is audited (actor, before, after). |
| REQ-OFF-007 | Legal copy fields are mandatory before approved (configurable). |

## Audience

| ID | Requirement |
| --- | --- |
| REQ-AUD-001 | Rule builder: AND/OR on traits and events (recency, count). |
| REQ-AUD-002 | Import audience from CSV (email or crm_id) with validation report. |
| REQ-AUD-003 | Suppression lists apply to campaigns and can apply to decisioning. |
| REQ-AUD-004 | Segment membership is materializable on a schedule and queryable as IDs. |

## Decisioning

| ID | Requirement |
| --- | --- |
| REQ-DEC-001 | Decision API accepts customer_id (or anonymous_id), channel, placement, and context blob. |
| REQ-DEC-002 | Returns 0..N ranked offers with reasons codes (eligible, ranked, capped, holdout). |
| REQ-DEC-003 | Frequency cap per offer, per campaign, per channel. |
| REQ-DEC-004 | Holdout customers receive control experience (no promo or baseline). |
| REQ-DEC-005 | Decision events are emitted for measurement (sampled if needed). |
| REQ-DEC-006 | Feature flags can disable AI ranking (rules-only). |

## CampaignOrchestration

| ID | Requirement |
| --- | --- |
| REQ-CAM-001 | Campaign binds audience, offer set, channel, and schedule or event trigger. |
| REQ-CAM-002 | Trigger examples: signup, first_purchase_missing, cart_abandon (event name configurable). |
| REQ-CAM-003 | Send-time consent check. |
| REQ-CAM-004 | Quiet hours and timezone per profile or tenant default. |
| REQ-CAM-005 | Pause/resume; kill switch tenant-wide. |

## ChannelDelivery

| ID | Requirement |
| --- | --- |
| REQ-CHN-001 | Email via SES with template + offer merge tags. |
| REQ-CHN-002 | In-app/web placement IDs served by decisioning. |
| REQ-CHN-003 | Webhook `offer.granted` and `campaign.sent`. |
| REQ-CHN-004 | Bounce/unsubscribe ingestion updates consent. |

## Customer360

| ID | Requirement |
| --- | --- |
| REQ-C360-001 | Profile store keyed by tenant + primary id; aliases supported. |
| REQ-C360-002 | Event ingest API (purchase, view, click, redeem). |
| REQ-C360-003 | Offer history: impressions, grants, redemptions. |
| REQ-C360-004 | Optional score fields (propensity) written by batch/ML jobs. |

## Measurement

| ID | Requirement |
| --- | --- |
| REQ-MEA-001 | Dashboards: offer, campaign, placement. |
| REQ-MEA-002 | Holdout vs treatment metrics. |
| REQ-MEA-003 | Export CSV for finance. |
| REQ-MEA-004 | Copilot can query aggregated metrics only. |

## Copilot

| ID | Requirement |
| --- | --- |
| REQ-COP-001 | Marketer chat grounded on tenant catalog + last 90 days aggregates. |
| REQ-COP-002 | Tools: search offers, estimate audience size, draft campaign JSON, explain campaign. |
| REQ-COP-003 | Publish actions require explicit confirm + RBAC. |
| REQ-COP-004 | Prompt injection and PII leakage controls. |

## Consent

| ID | Requirement |
| --- | --- |
| REQ-CON-001 | Purpose-based consent flags on profile. |
| REQ-CON-002 | Preference center read/write API. |
| REQ-CON-003 | Decisioning and send honor consent. |

## PromoAbuse

| ID | Requirement |
| --- | --- |
| REQ-ABU-001 | Velocity rules on grants and code attempts. |
| REQ-ABU-002 | Device/IP signals optional via adapter. |
| REQ-ABU-003 | Case management: open, allow, block. |

## Admin & Developer

| ID | Requirement |
| --- | --- |
| REQ-ADM-001 | RBAC roles: Admin, Marketer, Analyst, Engineer, Legal, ReadOnly. |
| REQ-ADM-002 | API keys scoped to tenant; rotation. |
| REQ-ADM-003 | Sandbox tenant. |
| REQ-ADM-004 | Brand kit: logo, colors, from-name. |
| REQ-ADM-005 | OpenAPI published; webhooks signed (HMAC). |

## Offer rails (secondary)

| ID | Requirement |
| --- | --- |
| REQ-RAIL-001 | Referral offer type: unique code, single-level reward, fraud velocity. |
| REQ-RAIL-002 | Incentive fields: points or cashback amount on offer (ledger optional post-MVP). |
