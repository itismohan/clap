---
title: Product Vision
id: D01
version: 0.1
status: draft
audience: Executive, Product, Architecture
---

# Product vision

## One-sentence vision

CLAP is the **decisioning and promotional layer** Fortune 100 brands use to attract the next customer and put the **right offer in front of the right person, on the right channel, at the right time**—with enterprise governance and measurable lift.

## Problem

Large brands already have CDPs, CRMs, commerce platforms, and marketing clouds. What they still fail at:

- **Offer chaos:** promotions live in spreadsheets, merchandising tools, and agency decks with no single eligibility or budget source of truth.
- **Spray-and-pray:** campaigns blast the same coupon to millions, destroying margin and teaching customers to wait for discounts.
- **Slow personalization:** “next best offer” is a quarterly model dump, not a sub-100ms decision in the app or on the site.
- **Broken measurement:** marketers cannot prove incremental conversion versus cannibalized full-price demand.
- **Governance risk:** F100 legal, brand, and privacy teams block launches because consent, frequency, and approvals are afterthoughts.

## Solution

An **AI-native personalization and promotional engine** that:

1. Holds a governed **offer catalog** (creative, eligibility, stacking, inventory, budget, calendar, legal copy).
2. Builds and activates **audiences** (rules, imports, suppression, lookalikes) without replacing the client CDP.
3. **Decides in real time** which offer, creative, and channel a person should see (next-best-offer / next-best-action).
4. **Orchestrates promotion** (scheduled campaigns, triggered journeys, always-on decisioning via SDK and APIs).
5. **Measures** take-rate, incremental conversion, promo ROI, fatigue, and abuse.
6. Gives marketers an **AI copilot** to generate campaigns, explain performance, and recommend who should receive an offer.

## North-star outcome

For each tenant brand: **more acquired customers per promo dollar**, **higher offer conversion with less wasted discount**, and **board-level proof of incremental lift**.

## What we are not

- Not a full CDP replacement.
- Not a loyalty points catalog as the product center (loyalty is an optional incentive rail on an offer).
- Not a consumer super-app sold to shoppers; consumers see CLAP through the **brand’s** app, web, email, and ads.
- Not a credit, bureau, or identity-protection product.

## Design principles

1. **Offer is a first-class object** — every promotion has eligibility, budget, and an audit trail.
2. **Decisioning is a product** — real-time API and SDK, not a batch file.
3. **Complement the stack** — ingest identity and events; export audiences and conversions.
4. **Personalization with guardrails** — frequency caps, consent, holdouts, brand safety.
5. **Marketer-speed, F100-safe** — copilot and low-code rules with approval workflows.
6. **Prove incrementality** — holdout and experiment design baked into campaigns.

## 3-year vision

| Horizon | Outcome |
| --- | --- |
| Year 1 | Pilot + enterprise GA: catalog, audiences, decisioning, email/in-app, measurement |
| Year 2 | Always-on decisioning across web/app, paid-media export, multi-cell incrementality, multi-brand portfolios |
| Year 3 | Autonomous campaign optimization under human approval; partner offer marketplace as a catalog source |

## Success snapshot

See [Success metrics](../09-implementation/06-success-metrics.md). Leading indicators: decisioning p99, offer take-rate, incremental conversion, promo margin, time-to-launch a campaign.
