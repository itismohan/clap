---
title: User Stories
id: D10
version: 0.1
status: draft
---

# User stories

Format: `US-<context>-<nnn>`. MVP stories marked **[MVP]**.

## Offers

- **US-OFF-001 [MVP]** As Priya, I create a 15% welcome offer with start/end dates so acquisition campaigns have a governed object.  
- **US-OFF-002 [MVP]** As Priya, I set a grant budget of 50,000 so we cannot overspend.  
- **US-OFF-003 [MVP]** As Legal, I must approve copy before status can be live.  
- **US-OFF-004** As Priya, I prevent stacking with other percent-off offers.

## Audiences

- **US-AUD-001 [MVP]** As Jordan, I build a segment “no purchase 30 days” from events.  
- **US-AUD-002 [MVP]** As Jordan, I upload a CSV of CRM IDs for a VIP blast.  
- **US-AUD-003 [MVP]** As Jordan, I exclude unsubscribes automatically.

## Decisioning

- **US-DEC-001 [MVP]** As Diego, I call decide with `placement=home_hero` and receive a ranked offer JSON.  
- **US-DEC-002 [MVP]** As Maya, frequency cap is max 3 impressions / 7 days per offer.  
- **US-DEC-003 [MVP]** As Maya, 10% holdout sees no promotional offer.  
- **US-DEC-004** As Jordan, I inspect why a customer did not receive an offer (debug, PII-gated).

## Campaigns

- **US-CAM-001 [MVP]** As Jordan, I schedule an email campaign for Friday 10:00 tenant TZ using an approved offer and audience.  
- **US-CAM-002 [MVP]** As Jordan, I attach the same offer to in-app placement as always-on.  
- **US-CAM-003** As Jordan, cart_abandon event triggers an email after 1 hour (GA).

## Channels

- **US-CHN-001 [MVP]** As Samira, I receive an email with a valid offer code merge.  
- **US-CHN-002 [MVP]** As Samira, homepage shows the decided offer module.  
- **US-CHN-003 [MVP]** As Diego, I receive HMAC-signed webhooks.

## Measurement

- **US-MEA-001 [MVP]** As Maya, I see take-rate for offer X vs holdout.  
- **US-MEA-002 [MVP]** As Alex, I see a weekly scorecard: grants, redemptions, estimated promo cost.  
- **US-MEA-003** As Maya, I export CSV for finance.

## Copilot

- **US-COP-001 [MVP]** As Jordan, I ask “who should receive the welcome offer?” and get a segment suggestion + estimated size.  
- **US-COP-002 [MVP]** As Jordan, I generate a campaign brief that I can edit and publish.  
- **US-COP-003** As Maya, I ask why last week’s campaign underperformed (aggregates only).

## Consent & abuse

- **US-CON-001 [MVP]** As Samira, I opt out of email and stop receiving promo email.  
- **US-ABU-001 [MVP]** As Riley, velocity > 20 grants/hour from one device is blocked.

## Admin

- **US-ADM-001 [MVP]** As Admin, I invite Jordan with Marketer role.  
- **US-ADM-002 [MVP]** As Diego, I create a sandbox API key.

## Rails

- **US-RAIL-001** As Jordan, I create a referral offer with unique codes (post-MVP unless time allows).
