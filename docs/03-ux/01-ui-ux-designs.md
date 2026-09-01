---
title: UI/UX Designs
id: D12
version: 0.1
status: draft
---

# UI/UX designs

## Experience principles

1. **Offer-first navigation** — catalog and calendar before vanity dashboards.  
2. **Decisioning is visible** — marketers see placements and live policies, not a black box.  
3. **Promote with confidence** — status, budget remaining, legal, and holdout always in view.  
4. **Copilot is a sidecar** — never the only way to ship; always reviewable JSON/forms.  
5. **Brand-safe consumer** — surfaces inherit tenant brand kit; CLAP chrome is not consumer-facing.  
6. **F100 density** — tables, filters, bulk actions; not a consumer-startup aesthetic as default.

## Primary surfaces

| Surface | Users | Purpose |
| --- | --- | --- |
| Marketer console | P1–P4, P7–P8 | Offers, audiences, campaigns, ROI, copilot, approvals |
| Consumer offer module | P5 | Homepage/cart/inbox rendered by brand app |
| Ops / abuse | P7 | Cases, velocity |
| Developer portal | P6 | Keys, webhooks, logs, OpenAPI |
| Executive scorecard | P4 | Weekly lift and spend |

## Console IA (top nav)

Offers · Audiences · Campaigns · Decisioning · Analytics · Copilot · Settings

## Key interaction: create and promote an offer

1. New offer (type: Attract vs Convert vs Retain).  
2. Value, eligibility, budget, creative.  
3. Submit for legal.  
4. Attach to campaign and/or always-on placement.  
5. Monitor take-rate vs holdout.

## Consumer placements (SDK)

- `home_hero`, `offer_inbox`, `checkout_offer`, `email_hero`  
Empty state: no dummy coupons; hide module.

## Accessibility

AA contrast on tenant themes (warn if brand kit fails). Focus order: primary actions first. Do not rely on color for offer status (use labels).

## Content tone

Marketer: precise, numeric. Consumer copy: supplied by brand; CLAP provides placeholders and length limits.
