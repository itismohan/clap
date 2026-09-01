---
title: Product Strategy
id: D02
version: 0.1
status: draft
---

# Product strategy

## Category

CLAP sits at the intersection of **offer management**, **real-time personalization / decisioning**, and **cross-channel campaign orchestration**, with a **thin CDP-like** profile sufficient for promotions.

## Who we sell to

- **Economic buyer:** CMO, CDO, or VP Growth at Fortune 100 / Global 2000 consumer brands (retail, CPG, telco, travel, QSR, streaming, marketplaces).
- **Champion:** CRM / lifecycle / digital marketing lead.
- **Blockers:** CIO (stack duplication), CISO, legal/privacy, procurement.

## GTM motion

1. **Land:** 8–12 week paid pilot (one brand, one market, in-app/web + email).
2. **Expand:** additional brands in the portfolio, extra channels (SMS, push, paid media), incrementality packages.
3. **Standardize:** enterprise agreement, dedicated VPC/cluster, SSO/SCIM, data residency.

Pricing hypothesis (for business case, not a quote): platform fee + MAU or decision-call volume + optional professional services. Confirm in commercial review.

## Strategic bets

| Bet | Why |
| --- | --- |
| Offer catalog as system of record | F100 pain is governance and margin, not another email blaster |
| Sub-100ms decisioning | In-session conversion (cart, homepage, app) is where lift lives |
| Copilot for marketers | Reduces agency and analyst bottleneck without removing approvals |
| Integrate, don’t replace CDP | Shortens sales cycle; uses existing identity |
| Promo abuse + consent first | Required to pass F100 security and legal |

## Product pillars (priority)

1. Offer catalog & lifecycle  
2. Audience & suppression  
3. Real-time decisioning  
4. Campaign / journey promotion  
5. Measurement & incrementality  
6. Marketer copilot  
7. Promo-abuse and consent  
8. Offer rails: referral, loyalty incentive, light gamification (later)

## Segmentation of offers we support

- Acquisition: welcome, first-purchase, referral reward, trial  
- Conversion: cart, browse, category, bundle  
- Retention / win-back: lapse, renewal, win-back coupon  
- Partner: co-brand, marketplace SKU as an offer type  

## Moat

- Decisioning + offer governance in one product (most stacks split these).  
- Experiment and holdout as default, not a science project.  
- Enterprise packaging (SSO, audit, approvals, residency) from day one of GA.

## Anti-strategy

- Building a consumer social app.
- Competing as a full CDP or full commerce platform.
- Leading with points, badges, or wellness scores.

## Roadmap themes

See [Implementation roadmap](../09-implementation/01-roadmap.md). Theme order: **Pilot decisioning → Enterprise channels → Intelligence & incrementality → Portfolio & partners.**
