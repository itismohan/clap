---
title: Microservice Architecture
id: D18
version: 0.1
status: draft
---

# Microservice architecture

Hexagonal services, async via MSK, sync via REST/gRPC internally. API Gateway exposes external REST.

## Service catalog

| Service | Language (suggested) | Responsibility |
| --- | --- | --- |
| identity-gateway | NestJS | AuthN/Z, tenant context, API keys |
| tenant-admin | NestJS | Users, roles, brand kit, flags |
| customer-360 | Java Spring | Profiles, aliases, event API |
| offer-catalog | NestJS | Offers, creatives, lifecycle |
| eligibility-engine | Python FastAPI | Rule evaluation library + service |
| audience-service | Java Spring | Segments, imports, membership |
| decisioning-service | Python FastAPI | Real-time NBA |
| campaign-orchestrator | NestJS | Campaigns, schedule, triggers |
| channel-hub | NestJS | SES, SNS, webhook delivery |
| experimentation | Python | Holdout assignment, A/B (GA) |
| measurement | Python | Aggregates, scorecards |
| consent-privacy | Java Spring | Purposes, DSAR |
| promo-abuse | Python | Velocity, cases |
| notification-hub | NestJS | Transactional console alerts |
| copilot-gateway | Python FastAPI | Agents, tools, MCP |
| bff-console | Next.js | Marketer UI |

**MVP collapse:** offer-catalog + eligibility in one deploy; campaign + channel in one; experimentation as module inside decisioning.

## Secondary rails (later)

`referral-offer`, `loyalty-incentive` — not required to promote offers.

## Communication

- Sync: REST for CRUD; gRPC optional decide→eligibility.  
- Async: CloudEvents on MSK topics `offer`, `decision`, `campaign`, `conversion`, `consent`, `abuse`.  
- No chatty loops: decide does not call campaign-orchestrator.

## Data ownership

| Data | Owner |
| --- | --- |
| Offer, creative, budget counters | offer-catalog |
| Profile, events | customer-360 |
| Segment defs, membership | audience-service |
| Caps, last impression | decisioning (Redis) + measurement |
| Grants | offer-catalog ledger |
| Consent | consent-privacy |
| Campaign defs | campaign-orchestrator |

## Platform

EKS, Istio/mTLS, HPA, PodDisruptionBudgets. Feature flags AppConfig.
