---
title: Event Catalog
id: D23
version: 0.1
status: draft
---

# Event catalog

Envelope: [CloudEvents 1.0](https://cloudevents.io/). Transport: MSK. Schemas: [schemas/events](../../schemas/events/).

## Envelope

| Field | Value |
| --- | --- |
| specversion | 1.0 |
| id | UUID |
| source | `clap/{service}` |
| type | namespaced below |
| time | RFC3339 |
| dataschema | URL |
| subject | tenant_id |
| data | JSON |

All `data` include `tenant_id`.

## Types

| Type | When | Key payload |
| --- | --- | --- |
| `com.clap.offer.created` | Offer insert | offer_id, offer_type, status |
| `com.clap.offer.updated` | Mutation | offer_id, status |
| `com.clap.offer.live` | Status live | offer_id |
| `com.clap.decision.made` | Decide API | customer_id, placement, offer_ids, reasons, experiment_id |
| `com.clap.offer.granted` | Grant minted | grant_id, offer_id, customer_id, campaign_id |
| `com.clap.offer.redeemed` | Commerce webhook | grant_id, revenue_optional |
| `com.clap.campaign.scheduled` | Campaign saved | campaign_id |
| `com.clap.campaign.sent` | Message accepted by channel | campaign_id, customer_id, channel |
| `com.clap.campaign.failed` | Send fail | campaign_id, error_code |
| `com.clap.conversion.recorded` | Generic conversion | customer_id, name, value |
| `com.clap.consent.updated` | Preference | customer_id, purpose, allowed |
| `com.clap.abuse.flagged` | Rule hit | customer_id, rule, score |
| `com.clap.audience.materialized` | Job done | audience_id, count |

MVP subset: decision.made, offer.granted, campaign.sent, conversion.recorded, consent.updated.

## Ordering and delivery

At-least-once. Consumers idempotent on `id`. Grants uniquely constrained `(tenant_id, grant_id)`.

## Webhooks (external)

Same types signed HMAC-SHA256 header `X-Clap-Signature`. Retry 1m/5m/30m then DLQ.
