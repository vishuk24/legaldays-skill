# LegalDays Output Template

Copy this structure for every user-facing brief. Replace placeholders. Do not invent effective dates or statute numbers without a P0/P1 citation.

```
⚖️ legaldays v{VERSION} · {WINDOW} · synced {YYYY-MM-DD}

Jurisdiction: {EU | UK | US | IN | SG | AE | MULTI}
Topic: {topic}
Query type: {NEWS | JURISDICTION | SECTOR | COMPARISON | CLIENT}

## What changed
{2-4 sentences. Only confirmed changes, not rumor.}

## Authority & effective date
- Primary: [{instrument name}]({url}) — effective {date or TBD}
- Secondary: [{analysis title}]({url}) — {outlet}, {date}

## Who is affected
- {entity types: exporters, SaaS, banks, Indian subsidiaries, etc.}

## India / NCR business angle
{How this lands for Indian companies, NRIs, or Ghaziabad/NCR operators. Write "No direct India nexus identified" if true.}

## Recommended actions
1. {Board / compliance / contract action}
2. {Second action}
3. {Optional counsel review flag}

## Confidence
- Primary source cited: {Yes | Partial | No}
- Secondary only: {Yes | No}
- Needs qualified counsel before reliance: {Yes | No}

---
Research saved: {LEGALDAYS_MEMORY_DIR}/{slug}-brief.md
Raw notes: {LEGALDAYS_MEMORY_DIR}/{slug}-raw.md

*LegalDays provides regulatory intelligence, not legal advice. Verify primary sources before client or filing use.*
```

## COMPARISON variant

For `X vs Y` queries, add after "What changed":

```
## Side-by-side
| Axis | {X} | {Y} |
|------|-----|-----|
| Governing regime | … | … |
| Cross-border data | … | … |
| Penalty exposure | … | … |
| India nexus | … | … |
```