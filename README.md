# /legaldays

<p align="center">
  <strong>Global business-law radar for AI agents.</strong><br/>
  Official sources first. India/NCR lens built in. Saved briefs every run.
</p>

<p align="center">
  <a href="https://github.com/vishuk24/legaldays-skill/stargazers"><img src="https://img.shields.io/github/stars/vishuk24/legaldays-skill?style=social" alt="GitHub stars"></a> ·
  <a href="https://lawaired.com/legaldays">LawAired Hub</a> ·
  <a href="https://www.advocatevishukushwaha.com">Advocate Vishu Kushwaha</a> ·
  MIT License
</p>

---

**An agent skill that researches what changed in global business law — not what Twitter thinks changed.**

Inspired by the architecture of [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill), LegalDays swaps social engagement scoring for **regulator-grade source tiers**: EU Official Journal, Federal Register, RBI/SEBI circulars, OFAC, MAS, and legal press — then synthesizes impact for **cross-border and India/NCR businesses**.

```
/legaldays EU AI Act high-risk obligations
/legaldays India DPDP cross-border data transfers
/legaldays OFAC sanctions maritime
/legaldays GDPR vs India DPDP
```

## Why this exists

Global businesses do not fail on lack of information. They fail on **late detection**:

- A sanctions list update blocks a shipment.
- A DPDP rule changes your SaaS data flow to EU.
- An MCA circular alters FDI reporting for a subsidiary.
- CSRD disclosure rules hit your EU customer's supply chain.

Counsel and compliance teams need a **recency-bounded, source-ranked brief** — the same way developers use `/last30days` before shipping code. LegalDays is that brief, as an [Agent Skill](https://agentskills.io).

## What LegalDays does

| Step | Action |
|------|--------|
| 1. Parse | Jurisdiction, topic, window (7d / 30d / 90d) |
| 2. Pre-resolve | Map topic → regulators (see `references/jurisdictions.md`) |
| 3. Fetch | P0 gazette → P1 regulator → P2 legal press → India pass |
| 4. Synthesize | What changed, who is affected, recommended actions |
| 5. Save | `~/Documents/LegalDays/{topic}-brief.md` + raw notes |

Every brief includes an **India / NCR business angle** — because most global-law updates eventually touch Indian parents, subsidiaries, or NRI operators.

## Install

Works with Grok, Claude Code, Codex, Cursor, Gemini CLI, and any [Agent Skills](https://agentskills.io) host.

```bash
npx skills add vishuk24/legaldays-skill -g
```

Or clone and symlink:

```bash
git clone https://github.com/vishuk24/legaldays-skill.git
ln -sf "$(pwd)/legaldays-skill/skills/legaldays" ~/.grok/skills/legaldays
```

### Grok

Skill auto-loads from `~/.grok/skills/legaldays/SKILL.md` after install.

```
/legaldays RBI FEMA latest circulars
```

### Claude Code / Cursor

```bash
npx skills add vishuk24/legaldays-skill -g -a claude-code
npx skills add vishuk24/legaldays-skill -g -a cursor
```

## Source tiers

| Tier | Examples | Trust |
|------|----------|-------|
| **P0** | eur-lex, Federal Register, Gazette of India, RBI/SEBI | Binding / official |
| **P1** | EDPB, ICO, OFAC, MeitY guidance | High authority |
| **P2** | Reuters Legal, Bloomberg Law, Law360 | Interpretation |
| **P3** | WTO, ICC, SIAC | Trade / arbitration context |

Full list: [`skills/legaldays/references/sources.md`](skills/legaldays/references/sources.md)

## Configuration

| Env var | Default | Purpose |
|---------|---------|---------|
| `LEGALDAYS_MEMORY_DIR` | `~/Documents/LegalDays` | Where briefs are saved |

Optional: pair with [Agent Reach](https://github.com/Panniantong/Agent-Reach) or Exa for richer web fetch.

## Example output shape

```markdown
⚖️ legaldays v1.0.0 · 30d · synced 2026-06-07

Jurisdiction: EU + IN
Topic: DPDP cross-border data transfers

## What changed
...

## India / NCR business angle
...

*LegalDays provides regulatory intelligence, not legal advice.*
```

Template: [`skills/legaldays/references/output-template.md`](skills/legaldays/references/output-template.md)

## Default watchlist

1. India DPDP + cross-border data  
2. OFAC / maritime / banking sanctions  
3. India FDI + MCA compliance  
4. EU CSRD / ESG disclosure  
5. UK economic crime / corporate transparency  

Run weekly: `/legaldays watchlist` (append topics to `~/Documents/LegalDays/watchlist.txt`).

## LegalDays vs last30days

| | last30days | LegalDays |
|---|------------|-----------|
| Signal | Upvotes, likes, engagement | Official + regulator sources |
| Use case | Trends, products, people | Business law & compliance |
| Voice | "What people are saying" | "What changed, effective when" |
| India lens | No | Built in |

## Disclaimer

LegalDays produces **regulatory intelligence briefs**, not legal advice. Verify primary sources and consult qualified counsel before client filings, contract amendments, or compliance certifications.

## Author

**Advocate Vishu Kushwaha** — Managing Strategist & Lead Advocate, [LawAired](https://lawaired.com) (Ghaziabad District Court · Allahabad High Court). Practice: criminal defense, Section 482, corporate risk, cross-border due diligence.

- [advocatevishukushwaha.com](https://www.advocatevishukushwaha.com)
- [ghaziabadlawyer.com](https://www.ghaziabadlawyer.com)
- WhatsApp: [+91 98710 27648](https://wa.me/919871027648)

## Contributing

PRs welcome: new jurisdiction packs, RSS feeds, sector shortcuts. Keep P0/P1 discipline — no blog-only sources as primary.

## License

MIT — see [LICENSE](LICENSE).

---

**Star the repo** if LegalDays saves your compliance team a Monday morning. Issues and jurisdiction requests welcome.