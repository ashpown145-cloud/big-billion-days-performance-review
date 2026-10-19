# AI Verification Log

## Part A q13 prompt
### Role
You are a Business Analyst writing production-ready SQL.
### Task
Write the q13 query for rep performance against target by month.
### Context
Use the real tables `reps(rep_id, rep_name, region, monthly_target)`, `customers(customer_id, first_name, last_name, city, region, age, rep_id)`, and `orders(order_id, customer_id, item, quantity, amount, status, order_month)`. SQL dialect used: SQLite.
### Constraints
Completed orders only; performance tiers are Below Target when revenue is below monthly_target, On Target when revenue is at least target but below 1.1 times target, and Above Target otherwise; do not use WITH clauses; do not use stored procedures.
### Format
Return raw SQL only, with inline comments.

## Scenario D1 — defect inspection
| Defect | Classification | Correct fix |
|---|---|---|
| `sales` table does not exist | fake method/function | Use the real `orders`, `customers` and `reps` tables. |
| `region_name` and `total_sales` do not exist | fake method/function | Use `c.region` and `o.amount`. |
| `SUM(total_sales)` is placed in WHERE | logic error | Aggregate filters belong in `HAVING`, while row-level completed status belongs in `WHERE`. |
| “North grew 38% month over month” is unsupported | phantom statistic | Calculate the change from q11's real September and October North revenue. |

## D1 corrected query result
The corrected query in `sql/d1_corrected.sql` returns:

| Region | Revenue |
|---|---:|
| North | 119300 |
| South | 82500 |

North September revenue = INR 53500; North October revenue = INR 41300; actual month-over-month change = **-22.8%**. Therefore the assistant's 38% growth claim is contradicted by the data.

## Human-in-the-loop protocol
### Specification
The question was interpreted as completed revenue by region, retaining the INR 80000 threshold. The schema and revenue definition were used as the specification.
### Execution
The corrected SQL was run against the seeded database and returned exactly two regions: North at INR 119300 and South at INR 82500.
### Inspection
The original answer was inspected for schema validity, aggregate placement and evidence for the stated growth statistic. It failed all three checks and also used a nonexistent table/columns.
### Verification
North's September and October values were independently calculated from the q11-compatible completed-order data, producing a -22.8% change.
### Decision
**Reject the original answer** because its schema is invalid, its aggregate filter is logically invalid, and its 38% claim is contradicted by the data. **Accept the corrected version** because it runs on the real schema, applies the completed-order definition, uses HAVING for the threshold, and returns the expected two rows.

## Scenario D2 prompt
### Role
Act as a spreadsheet debugging analyst.
### Task
Find the root cause of a VLOOKUP returning not found and repair the formula.
### Context
The products tab occupies A1:C10, item names are in column A and unit prices are in column C. On orders, G2 contains ` Smart Watch` with a leading space. The current formula is `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)`. Smart Watch exists in the products table and the expected behaviour is to return its unit price.
### Constraints
Preserve exact-match lookup and the existing products range; remove whitespace from the lookup key rather than changing the source product table.
### Format
State the root cause and provide the repaired formula.

**Root cause:** the leading space in G2 makes the lookup key different from `Smart Watch` in the products table.

**Repaired formula:** `=VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)`

## Skeptical-analyst check for Part C
Prompt: “Act as a skeptical analyst. Challenge my first recommendation from Part C. Identify unstated assumptions, ask what evidence would establish cause rather than correlation, and specify the data checks or figures needed before approving the recommendation.”

Unstated assumptions and checks:
1. **Assumption:** North's high revenue means a North electronics promotion will create incremental revenue. **Check:** compare North electronics revenue across months and against other North categories; a stable/high baseline without growth would weaken the causal claim.
2. **Assumption:** Electronics has enough demand/capacity to support a promotion. **Check:** review Electronics revenue and unit counts by month/category; weak units despite high revenue could indicate high ticket size rather than broad demand.
3. **Assumption:** A promotion will not simply shift purchases from other categories. **Check:** compare North category mix before and after the promotion and monitor total North revenue as well as electronics revenue.
