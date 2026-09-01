---
title: Acceptance Criteria
id: D11
version: 0.1
status: draft
---

# Acceptance criteria

Given/when/then for **MVP** stories. Additional criteria inherit NFRs.

## AC-OFF-001 (US-OFF-001)

- Given a Marketer in tenant Acme  
- When they POST an offer with name, type `acquisition`, value, start/end, creative  
- Then the offer is stored as `draft` and appears in catalog list  
- And OpenAPI schema validation fails if end &lt; start  

## AC-OFF-002 (US-OFF-002)

- Given a live offer with `budget.grants = 2`  
- When decisioning has already granted 2 times globally  
- Then subsequent decisions omit the offer with reason `budget_exhausted`  

## AC-OFF-003 (US-OFF-003)

- Given an offer in `draft`  
- When a Marketer sets status `live` without Legal role approval  
- Then API returns 409/403 and status remains draft  
- When Legal approves, Marketer can set `live`  

## AC-AUD-001 (US-AUD-001)

- Given events `purchase` in profile store  
- When a segment rule `purchase.count == 0 AND last_seen < 30d` is saved  
- Then preview returns an estimated count (± configured error)  
- And materialize job produces membership used by campaigns  

## AC-AUD-002 (US-AUD-002)

- Given CSV of 100 crm_ids (90 valid, 10 malformed)  
- When import completes  
- Then report shows 90 loaded, 10 errors  
- And campaign can target the loaded set  

## AC-DEC-001 (US-DEC-001)

- Given a live eligible offer and a consented profile  
- When `POST /v1/decide` with placement `home_hero`  
- Then 200 with `offers[]` sorted by rank  
- And p99 budget test meets NFR-PRF-001 in staging load test  

## AC-DEC-002 (US-DEC-002)

- Given cap 3 / 7 days  
- When the same customer receives 3 impressions  
- Then 4th decide returns empty or fallback with reason `frequency_capped`  

## AC-DEC-003 (US-DEC-003)

- Given campaign holdout 10% sticky by customer_id  
- When decide is called  
- Then holdout members never receive promo offers for that experiment id  
- And measurement can split metrics  

## AC-CAM-001 (US-CAM-001)

- Given approved offer + audience + email template  
- When campaign is scheduled  
- Then send job runs in tenant timezone  
- And unsubscribed users are skipped  
- And `campaign.sent` events emit  

## AC-CHN-002 (US-CHN-002)

- Given SDK configured with placement  
- When the app requests decisioning  
- Then response includes creative payload for rendering  
- And impression event can be posted  

## AC-MEA-001 (US-MEA-001)

- Given treatment and holdout traffic  
- When redemptions are ingested  
- Then dashboard shows take-rate both groups  
- And copilot cannot return raw emails  

## AC-COP-001 (US-COP-001)

- Given catalog with welcome offer  
- When marketer asks who should receive it  
- Then copilot returns a suggested rule or existing segment + estimate  
- And does not auto-publish  

## AC-CON-001 (US-CON-001)

- Given email consent false  
- When campaign send runs  
- Then user is not emailed  
- And in-app decisioning still allowed if `in_app_personalization` true  

## AC-ABU-001 (US-ABU-001)

- Given velocity rule 20 grants / hour / device  
- When 21st grant attempted  
- Then grant denied and case opened  

## AC-ADM-001 (US-ADM-001)

- Given Admin invite  
- When Jordan accepts  
- Then role Marketer cannot delete tenant or rotate master keys  
