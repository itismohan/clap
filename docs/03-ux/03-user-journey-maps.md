---
title: User Journey Maps
id: D14
version: 0.1
status: draft
---

# User journey maps

## J1 — Attract: welcome offer (marketer + consumer)

```
Jordan: create audience "new 7d" → Priya: create welcome offer → Legal: approve
→ Jordan: campaign email + always-on home_hero → Maya: set 10% holdout
→ Samira (new user): email + app hero → redeem in commerce → conversion webhook
→ Maya: take-rate vs holdout
```

**Emotions:** Marketer anxious at legal; consumer happy if offer works at checkout.  
**Failure points:** offer live on email but expired in commerce; consent false.

## J2 — Promote: in-session next-best-offer

```
Diego: SDK on home → Decisioning uses RFM + eligibility
→ Samira sees one ranked offer → impression → click → grant
→ If capped, module hides
```

**Failure points:** p99 latency → timeout empty; wrong stacking.

## J3 — Copilot-assisted campaign

```
Jordan: "Promote leftover bundle SKU this weekend"
→ Copilot: draft audience + offer attach + schedule
→ Jordan edits budget → Legal if new copy → publish
```

**Guardrail:** no auto-send.

## J4 — Abuse

```
Riley: spike in grants → case → block device → offer remains live for others
```

## J5 — Executive

```
Alex: Monday scorecard → incremental customers, promo cost, top offers
→ asks Maya to kill underperforming blast
```

## Journey SLAs (product)

- Legal SLA: configurable, default 1 business day.  
- Decisioning: NFR p99.  
- Preference update: honored on next decide/send (near real time).
