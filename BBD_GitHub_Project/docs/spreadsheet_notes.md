# Spreadsheet Notes

## Setup
- Spreadsheet tool: Google Sheets (Excel is also acceptable).
- Tabs created: `orders` and `products`.
- `orders`: 90 imported rows plus header.
- `products`: range A1:C10, using item, category, unit_price.
- `order_month` was kept as Plain text (for example `2026-09`).
- Applied filter `status = completed`, then sorted visible rows by `amount` descending before creating `completed_orders`.
- XLOOKUP fallback test: looking up `Mystery Item` returns `UNKNOWN_ITEM`.

## Formulas
- clean_first_name first data row: `=PROPER(TRIM(C2))`
- clean_last_name first data row: `=PROPER(TRIM(D2))`
- category first data row: `=VLOOKUP(G2,products!$A$2:$C$10,2,FALSE)`
- unit_price first data row: `=XLOOKUP(G2,products!$A$2:$A$10,products!$C$2:$C$10,"UNKNOWN_ITEM")`
- revenue_calc first data row: `=I2*J2`

## Completed-order aggregates
| Metric | Result |
|---|---:|
| COUNT | 63 |
| SUM | 346200 |
| AVERAGE | 5495.24 |
| MIN | 1100 |
| MAX | 15600 |

## Pivot 1 — Revenue by Category and Region
| Category | North | South | East | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 19400 | 10000 | 10600 | 37500 | 77500 |
| Electronics | 73400 | 28700 | 21400 | 18800 | 142300 |
| Home | 26500 | 43800 | 37500 | 18600 | 126400 |
| **Grand Total** |  |  |  |  | **346200** |

## Pivot 2 — Revenue and Order Count by Month
| order_month | Sum of amount | Count of order_id |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| **Grand Total** | **346200** | **63** |

## Reconciliation
| Metric | Spreadsheet | Part A q05 | Match/Mismatch |
|---|---:|---:|---|
| COUNT | 63 | 63 | Match |
| SUM | 346200 | 346200 | Match |
| AVERAGE | %.2f | %.2f | Match |

## Data validation
- The three missing amounts are order IDs 1001, 1010 and 1064, as returned by q02. They were kept blank in the raw/enriched data rather than imputed because the brief defines revenue from completed orders and these missing-amount rows are pending; inventing a value would create unsupported revenue.
- Numeric fields such as quantity, unit_price, amount and revenue_calc were checked as numeric values; `order_month` was intentionally kept as text.
- No duplicate `order_id` exists in the completed orders.
- The largest completed-order amount is {largest[0]}, held by order ID {largest[1]}.
- Decision for a colleague: keep the raw imported `orders` tab unchanged and perform cleaning/enrichment in added columns, so the original source remains traceable.
