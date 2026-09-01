---
title: Design System
id: D17
version: 0.1
status: draft
---

# Design system — CLAP Console

## Principles

Enterprise, accessible, **themeable per tenant**. Components are React + Tailwind. Tokens as CSS variables.

## Tokens

```css
:root {
  --color-bg: #F7F8FA;
  --color-surface: #FFFFFF;
  --color-text: #111827;
  --color-muted: #6B7280;
  --color-primary: #1F4E8C;
  --color-primary-fg: #FFFFFF;
  --color-border: #E5E7EB;
  --radius: 8px;
  --font-sans: Inter, ui-sans-serif, system-ui;
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-6: 24px;
}
```

Tenant brand kit overwrites `--color-primary`, logo URL, `--radius`.

## Components (MVP)

| Component | States | Notes |
| --- | --- | --- |
| Button | primary, secondary, ghost, destructive; loading; disabled | 36px height |
| Input / Select / Date | error, disabled | Labels always visible |
| DataTable | sort, filter, pagination | Row actions menu |
| StatusChip | see hifi | |
| Tabs | | Offer editor |
| Drawer | copilot | 400px right |
| Modal | confirm publish | Focus trap |
| PageHeader | title, crumbs, primary action | |
| MetricCard | value, delta vs holdout | |
| CodeBlock | JSON campaign | Copy |
| EmptyState | | |
| Toast | | |

## Form patterns

- Inline validation on blur.  
- Eligibility: form mode + JSON expert mode.  
- Dangerous actions: type offer name to pause all.

## Iconography

Outline 20px (Heroicons or equivalent). Status never icon-only.

## Voice

UI strings: “Promote offer”, “Attract customers”, “Holdout”, “Take-rate”. Avoid “points club” language in primary nav.
