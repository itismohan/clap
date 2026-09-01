---
title: Business Case
id: D03
version: 0.1
status: draft
---

# Business case

## Executive summary

A Fortune 100 brand typically spends **high-single to double-digit percent of revenue** on promotions and paid acquisition. Waste comes from untargeted discounts, unmeasured campaigns, and slow cycle time. CLAP’s case is **incremental customers and margin recovered**, not software cost reduction alone.

Illustrative (not a customer quote): if a brand spends $500M/year on promotional discounting and paid media tied to offers, a **1–3% improvement in promo efficiency** is $5–15M/year—well above platform cost.

## Value levers

| Lever | Mechanism | Example KPI |
| --- | --- | --- |
| Acquisition | Better welcome/referral offers to high-propensity prospects | New customers / promo $ |
| Conversion | Next-best-offer in session | Offer take-rate, AOV |
| Margin | Suppress discount-sensitive-only blasts; eligibility | Promo margin, discount rate |
| Speed | Copilot + catalog + approvals | Days to launch campaign |
| Risk | Consent, caps, abuse | Chargebacks, coupon fraud $ |
| Measurement | Holdouts | Incremental conversion |

## Cost to serve (order of magnitude)

See [Cost estimation](../09-implementation/04-cost-estimation.md) for AWS + team. Directional Year-1 platform run for a 10M MAU tenant: **mid-six to low-seven figures USD** cloud + support depending on decision QPS and channel volume—validate with a sizing worksheet per RFP.

## 3-year TAM framing (category)

Addressable spend is a slice of **enterprise marketing technology + promotion operations** (journey orchestration, personalization, offer management). Use analyst “personalization and campaign orchestration” category growth in the RFP; do not claim a single TAM number without finance sign-off.

SAM: F100/G2000 consumer brands with owned apps/sites.  
SOM (Year 3): 10–25 named logos if land-and-expand executes.

## ROI model (pilot)

**Inputs (tenant provides):** baseline conversion, discount rate, campaign volume, MAU, email/push reach.

**Outputs after 90 days:**

- Lift in offer take-rate vs. control  
- Incremental new customers from acquisition offers  
- Change in average discount per order  
- Time-to-launch vs. baseline  

**Investment:** pilot license + implementation (CDP/event mapping, SDK, 2–3 offers, 2 campaigns).

**Payback target:** within two fiscal quarters of GA for the first brand if incrementality is positive.

## Risks to the case

- CDP/identity quality too poor to personalize.  
- Legal blocks real-time use of certain attributes.  
- Brand continues blast-coupon culture; decisioning unused.  
- Attribution fights with agency of record.

Mitigations in [Risk assessment](../09-implementation/05-risk-assessment.md).

## Recommendation

Fund a **one-brand, one-month technical MVP** (see [MVP plan](../09-implementation/02-mvp-plan.md)) then a **paid F100 pilot** with holdout design before enterprise rollout.
