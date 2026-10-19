# Big Billion Days Regional Performance Review — SQL, Spreadsheet, Dashboard and AI-Verified Analysis

## Tools
- SQL compiler: Python SQLite (`sqlite3`), SQLite dialect.
- Spreadsheet: Google Sheets-compatible formulas and layout.
- Tableau Public: Not built; Part C is completed as the required written dashboard specification in `docs/dashboard_spec.md`.

## Three most important findings
Completed-order revenue is INR 346200 across 63 orders and 106 units. North is the strongest region in the corrected D1 analysis at INR 119300, followed by South at INR 82500. The dashboard specification reconciles regional, category and spreadsheet totals to the same INR 346200 figure, while the AI verification step shows that the unsupported 38% North growth claim is contradicted by the actual -22.8% September-to-October change.

## File index
| File | Part | Purpose |
|---|---|---|
| `README.md` | Final | Project overview, tools, findings and file index. |
| `sql/00_schema_and_seed.sql` | A | Creates and seeds the four required tables. |
| `sql/q01.sql`–`sql/q13.sql` | A | Required business queries. |
| `sql/d1_corrected.sql` | D | Corrected Scenario D1 query. |
| `results/query_results.md` | A | Seed check and query results. |
| `data/orders_enriched.csv` | A | Full q09 order-level fact table. |
| `data/orders_clean.csv` | B | Cleaned completed-order data for Part C. |
| `docs/spreadsheet_notes.md` | B | Spreadsheet formulas, pivots, validation and reconciliation. |
| `docs/dashboard_spec.md` | C | Dashboard fields, KPIs, charts, layout, insights and recommendations. |
| `docs/ai_log.md` | D | AI prompts, defect inspection, verification and skeptical review. |

## Assumptions
The project uses SQLite because the brief allows MySQL, PostgreSQL or SQLite. Tableau Public was not built because the brief states that the graded Part C evidence is the written specification. Revenue is treated exactly as defined in the brief: completed-order amounts only. Missing amounts remain blank rather than being imputed.
