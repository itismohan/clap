---
title: Wireframes
id: D15
version: 0.1
status: draft
---

# Wireframes

ASCII wireframes for MVP screens. High-fidelity tokens in [design system](06-design-system.md).

## W1 — Console home

```
+------------------------------------------------------------------+
| CLAP  Acme          Offers  Audiences  Campaigns  Analytics  [?] |
+------------------------------------------------------------------+
| Promo pulse                                                      |
| Live offers: 12   Budget 62%   Alerts: 1 offer expiring 48h     |
| [Needs approval: 3]  [Holdout: exp_welcome running]              |
|                                                                  |
| Top offers (7d)          |  Channel mix                         |
| 1. Welcome 15%  4.2% TR  |  email ##### in-app ###              |
+------------------------------------------------------------------+
```

## W2 — Offer catalog

```
+------------------------------------------------------------------+
| Offers                    [New offer]  [Calendar]                |
| Filter: status=live  type=acquisition                            |
| ID     Name            Type        Budget left   Status  Updated |
| o_91   Welcome 15%     Attract     41,002        Live    2h      |
| o_88   Cart 10%        Convert     9,100         Live    1d      |
+------------------------------------------------------------------+
```

## W3 — Offer editor

```
+------------------------------------------------------------------+
| <- Catalog   Welcome 15%     draft          [Submit legal]       |
| Tabs: Details | Eligibility | Budget | Creative | History        |
| Name [________________]  Type [Attract v]                        |
| Start [date] End [date]  Stack group [percent_off v]             |
| Eligibility JSON / form: first_purchase == false                 |
| Budget: grants [50000]                                           |
| Creative: headline, body, CTA, image URL, code source            |
+------------------------------------------------------------------+
```

## W4 — Campaign builder

```
+------------------------------------------------------------------+
| Campaign: Spring welcome                                         |
| Audience [seg_new_7d v]  Offer [o_91 v]  Channel [email v]       |
| Schedule: 2026-09-12 10:00 America/New_York                      |
| Holdout [10%]   Quiet hours [21:00-08:00]                        |
| [Save draft] [Submit]                                            |
+------------------------------------------------------------------+
```

## W5 — Decisioning simulator

```
+------------------------------------------------------------------+
| Simulator                                                        |
| customer_id [crm_123]  placement [home_hero]  [Decide]           |
| Result: o_91 rank 0.81  reasons: eligible, not_capped            |
| Alt: o_88 filtered stacking                                      |
+------------------------------------------------------------------+
```

## W6 — Consumer in-app module

```
+--------------------------------------+
| Acme                                 |
| ------------------------------------ |
| |  Welcome: 15% off first order    | |
| |  Use at checkout  [Get offer]    | |
| ------------------------------------ |
|  Featured products ...               |
+--------------------------------------+
```

## W7 — Copilot sidecar

```
+---------------------------+
| Copilot                   |
| Who should get Welcome 15%|
| → Suggest: no_purchase AND|
|   created < 7d  ~120k     |
| [Insert as audience]      |
+---------------------------+
```
