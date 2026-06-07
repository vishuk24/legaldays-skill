# LegalDays Source Tiers

Use this hierarchy when fetching. **P0 beats P1 beats P2.** Never treat blogs or social posts as binding law.

## P0 — Primary (binding or official)

| Jurisdiction | Source | URL pattern |
|--------------|--------|-------------|
| EU | Official Journal of the EU | https://eur-lex.europa.eu/ |
| UK | legislation.gov.uk | https://www.legislation.gov.uk/ |
| US Federal | Federal Register | https://www.federalregister.gov/ |
| US SEC | SEC rules & releases | https://www.sec.gov/rules |
| India | Gazette of India / MCA | https://egazette.gov.in/ , https://www.mca.gov.in/ |
| India RBI | Notifications & circulars | https://www.rbi.org.in/ |
| India SEBI | Circulars | https://www.sebi.gov.in/ |
| Singapore | Statutes & MAS notices | https://www.mas.gov.sg/ |
| UAE | DFSA / ADGM rulebooks | https://www.dfsa.ae/ , https://www.adgm.com/ |
| WTO | Trade news & disputes | https://www.wto.org/ |

## P1 — Regulator guidance (high authority, not always statute)

- EU EDPB guidelines — https://edpb.europa.eu/
- UK ICO — https://ico.org.uk/
- US FTC / OFAC sanctions — https://ofac.treasury.gov/
- India MeitY (DPDP rules) — https://www.meity.gov.in/

## P2 — Legal press (interpretation + timing)

- Reuters Legal — site:reuters.com legal
- Bloomberg Law — site:bloomberglaw.com
- Law360 — site:law360.com
- Financial Times regulation — site:ft.com regulation

## P3 — Trade & arbitration

- ICC — https://iccwbo.org/
- SIAC — https://www.siac.org.sg/
- UNCTAD investment policy — https://investmentpolicy.unctad.org/

## Search query templates

```
"{topic}" site:eur-lex.europa.eu after:{YYYY-MM-DD}
"{topic}" site:federalregister.gov after:{YYYY-MM-DD}
"{topic}" RBI circular after:{YYYY-MM-DD}
"{regulation name}" official gazette India
"{topic}" sanctions OFAC after:{YYYY-MM-DD}
```

## India / NCR lens (always check when topic is global)

After global findings, run one India-specific pass:

- MCA / FEMA / RBI / SEBI impact on Indian parent or subsidiary
- Allahabad HC / Supreme Court if Indian enforcement risk exists
- Cross-border contract clauses (governing law, data transfer, sanctions)