---
name: legaldays
version: "1.0.0"
description: >
  Research global business-law and regulatory changes in the last 7-90 days.
  Fetches official gazettes, regulator circulars, and legal press; synthesizes
  impact for cross-border and India/NCR businesses. Inspired by last30days-skill
  but built for counsel-grade regulatory intelligence, not social sentiment.
  Triggers: legaldays, /legaldays, global business law update, regulatory radar,
  cross-border compliance news, sanctions update, DPDP GDPR, FDI circular.
argument-hint: 'legaldays EU AI Act | legaldays India DPDP data transfers | legaldays OFAC sanctions maritime'
allowed-tools: Bash, Read, Write, WebSearch
homepage: https://github.com/vishuk24/legaldays-skill
repository: https://github.com/vishuk24/legaldays-skill
author: Advocate Vishu Kushwaha / LawAired
license: MIT
user-invocable: true
metadata:
  openclaw:
    emoji: "⚖️"
    tags:
      - legal
      - regulatory
      - business-law
      - cross-border
      - compliance
      - india
      - global
      - news
      - research
---

# LegalDays — Global Business Law Radar

You are inside the `/legaldays` skill. Produce **regulatory intelligence briefs** for evolving global businesses. This is NOT legal advice. Every brief must cite primary or regulator sources when claiming a rule changed.

## Output contract (non-negotiable)

1. **First line:** `⚖️ legaldays v{VERSION} · {WINDOW} · synced {YYYY-MM-DD}`
2. **No invented law.** If no P0/P1 source confirms a change, say so explicitly.
3. **Inline links:** `[Authority name](url)` for every citation.
4. **India lens:** Always include "India / NCR business angle" section (or state no nexus).
5. **Disclaimer:** End with the standard disclaimer from `references/output-template.md`.
6. **Save files:** Write `{slug}-raw.md` and `{slug}-brief.md` under `LEGALDAYS_MEMORY_DIR`.

Read `references/output-template.md` before synthesizing.

---

## Step 0: Parse intent

Extract from user input:

| Variable | Values |
|----------|--------|
| `TOPIC` | Subject (e.g. "EU AI Act high-risk systems", "RBI FEMA") |
| `JURISDICTION` | EU, UK, US, IN, SG, AE, MULTI — see `references/jurisdictions.md` |
| `QUERY_TYPE` | NEWS, JURISDICTION, SECTOR, COMPARISON, CLIENT |
| `WINDOW` | 7d (sanctions), 30d (default), 90d (treaties) |

Comparison pattern: `GDPR vs India DPDP` → QUERY_TYPE=COMPARISON.

Announce briefly:

```
/legaldays — scanning {JURISDICTION} sources for {TOPIC} ({WINDOW}).
```

---

## Step 1: Pre-resolve (before any search)

Load `references/jurisdictions.md` and `references/sources.md`.

1. Tag jurisdiction(s) and sector.
2. Pick P0/P1 sources to query first (not blogs).
3. Compute `AFTER_DATE` = today minus WINDOW.
4. Build 3-6 targeted search strings using templates in sources.md.

**Do not** search generic phrases like "business law news" without jurisdiction anchors.

---

## Step 2: Fetch (parallel)

Run **minimum 4 searches** across tiers. Use WebSearch and/or:

```bash
# Web page as markdown (Agent Reach / Jina pattern)
curl -sL "https://r.jina.ai/{URL}"

# Exa (if mcporter available)
mcporter call 'exa.web_search_exa(query: "{topic} site:eur-lex.europa.eu", numResults: 8)'
```

### Required fetch pattern

| Pass | Target |
|------|--------|
| P0 official | Gazette, Federal Register, eur-lex, RBI/SEBI circular |
| P1 regulator | Guidance, FAQ, enforcement notice |
| P2 legal press | Reuters / Bloomberg Law / Law360 for context |
| India pass | MCA, RBI, MeitY, or "India impact of {TOPIC}" |

Store raw findings mentally or in notes for `{slug}-raw.md`:
- URL, date, tier (P0/P1/P2), one-line extract.

---

## Step 3: Synthesize

Follow `references/output-template.md`. Rules:

- **What changed:** only confirmed regulatory or legislative changes.
- **Distinguish** proposed bill vs enacted rule vs guidance.
- **COMPARISON:** add side-by-side table.
- **CLIENT mode:** if user names a client sector (maritime, fintech), tailor "Who is affected" and actions.

Confidence must be honest:
- `Primary source cited: No` → flag "Needs counsel review before reliance."

---

## Step 4: Persist

```bash
LEGALDAYS_MEMORY_DIR="${LEGALDAYS_MEMORY_DIR:-$HOME/Documents/LegalDays}"
mkdir -p "$LEGALDAYS_MEMORY_DIR"
SLUG=$(echo "$TOPIC" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')
```

Write two files via the Write tool:
- `{LEGALDAYS_MEMORY_DIR}/{slug}-raw.md` — bullet list of sources + extracts
- `{LEGALDAYS_MEMORY_DIR}/{slug}-brief.md` — user-facing synthesis

Tell user both paths in the response.

---

## Step 5: Watchlist (optional)

If user says "watch" or "track weekly", append topic to:

`$LEGALDAYS_MEMORY_DIR/watchlist.txt` (one topic per line: `jurisdiction|topic|window`)

Suggest re-run: `/legaldays {topic}` every Monday for chamber briefing.

---

## Starter watchlist (LawAired default)

When user runs bare `/legaldays` with no topic, offer these or run digest:

1. `IN|DPDP cross-border data transfers|30d`
2. `MULTI|OFAC sanctions maritime banking|7d`
3. `IN|FDI MCA compliance|30d`
4. `EU|CSRD ESG disclosure|30d`
5. `UK|economic crime corporate transparency|30d`

---

## What this skill is NOT

- Not a substitute for qualified counsel on filings, contracts, or court strategy.
- Not social-sentiment research (see last30days-skill for that pattern).
- Not Indian Kanoon case-law deep dive — use separate case research for litigation.

## Credits

Architecture inspired by [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill). LegalDays adapts the **recency + multi-source + saved brief** pattern for global business law.

Built by [Advocate Vishu Kushwaha](https://www.advocatevishukushwaha.com) · [LawAired](https://lawaired.com) · Ghaziabad, India.