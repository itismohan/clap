---
title: High-Fidelity UI Designs
id: D16
version: 0.1
status: draft
---

# High-fidelity UI designs

No Figma file in-repo. Implement Next.js + Tailwind using [design system](06-design-system.md). This spec defines visual intent for engineering.

## Layout

- **Shell:** 64px top bar, 240px collapsible sidenav (optional; MVP may use top nav only).  
- **Content max:** 1440px.  
- **Density:** 8px grid; table row 40–44px.  
- **Type:** Inter or tenant sans; 14px body, 12px meta, 20/24px titles.

## Color roles (defaults; overridden by brand kit)

| Role | Default | Usage |
| --- | --- | --- |
| Canvas | `#0B1220` / light `#F7F8FA` | Support dark+light; F100 often wants light |
| Surface | `#FFFFFF` | Cards, tables |
| Primary | Tenant `brand.primary` else `#1F4E8C` | Buttons, links |
| Success | `#1B7F4E` | Live, positive lift |
| Warning | `#B45309` | Budget 80% |
| Danger | `#B91C1C` | Exhausted, abuse |
| Border | `#E5E7EB` | |

**MVP default theme: light** for marketer console.

## Status chips

`draft` gray · `in_review` amber · `approved` blue · `live` green · `paused` slate · `expired` gray outline

## Offer type badges

Attract (teal) · Convert (indigo) · Retain (violet) · Partner (copper)

## Charts

Bar for take-rate treatment vs holdout; line for grants over time. No decoration 3D. Annotate holdout.

## Consumer module

Full-bleed card, 16:9 image optional, CTA 44px min height, tenant radius token (default 8px). Must work in 320px width.

## Motion

150–200ms ease for drawers (copilot). No auto-playing consumer animation that hides CTA.

## Empty and error

Catalog empty: illustration + “Create your first acquisition offer.”  
Decide empty: render nothing (SDK).  
API error: toast + retry; do not show stack traces.
