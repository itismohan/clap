---
title: Information Architecture
id: D13
version: 0.1
status: draft
---

# Information architecture

## Sitemap — Marketer console

```
/
├── Home (promo pulse: live offers, budget burn, alerts)
├── Offers
│   ├── Catalog
│   ├── Offer detail / versions
│   ├── Calendar
│   └── Approvals inbox
├── Audiences
│   ├── Segments
│   ├── Imports
│   └── Suppressions
├── Campaigns
│   ├── List
│   ├── Campaign builder
│   └── Send calendar
├── Decisioning
│   ├── Placements
│   ├── Policies (caps, holdouts)
│   └── Simulator (preview decide)
├── Analytics
│   ├── Offers
│   ├── Campaigns
│   ├── Experiments / holdouts
│   └── Executive
├── Copilot
├── Abuse
└── Settings
    ├── Users & roles
    ├── Brand kit
    ├── Consent purposes
    ├── API keys & webhooks
    └── Audit log
```

## Sitemap — Developer portal

```
/dev
├── Getting started
├── API reference (OpenAPI render)
├── SDKs
├── Webhooks
├── Sandbox
└── Status
```

## Object model (UX)

Tenant → Brand kit → Offers → Creatives  
Audience → Membership  
Campaign → Audience + Offers + Channel + Schedule  
Placement → Decision policy  
Customer (internal) → not a marketer list of PII by default (search is permissioned)

## Navigation rules

- Deep links to offer and campaign IDs.  
- Breadcrumbs on detail.  
- Global search: offers, campaigns, placements (not raw PII unless Analyst+ with purpose).
