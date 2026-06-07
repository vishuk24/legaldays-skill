# LegalDays Configuration

## Memory directory

Briefs save to:

```
~/Documents/LegalDays/
```

Override:

```bash
export LEGALDAYS_MEMORY_DIR="$HOME/Chamber_Archive_Master/05_Global_Business_Law"
```

Each run creates:

- `{slug}-raw.md` — source extracts
- `{slug}-brief.md` — synthesis

## Watchlist

Append topics to `~/Documents/LegalDays/watchlist.txt`:

```
IN|DPDP cross-border data transfers|30d
MULTI|OFAC sanctions maritime|7d
```

Re-run `/legaldays {topic}` on schedule (weekly recommended).

## Optional fetch tools

| Tool | Setup | Use |
|------|-------|-----|
| WebSearch | Built into most agents | Default |
| Jina reader | `curl -sL "https://r.jina.ai/{URL}"` | Full-page markdown |
| Agent Reach | `agent-reach doctor` | Exa, RSS, multi-platform |
| Exa | mcporter + API key | Targeted legal press search |

## Grok + Saturn (LawAired stack)

For longer client memos after a LegalDays brief:

```bash
grok -m saturn-draft -p "Turn this LegalDays brief into a client alert: $(cat ~/Documents/LegalDays/slug-brief.md)"
```

## Disclaimer

Configure your org's disclaimer in client-facing outputs. The skill template includes a baseline non-advice notice.