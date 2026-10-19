# Dashboard Specification

## Data source

Source: `data/orders_clean.csv`. The dashboard uses the cleaned completed-order data.

| Field | Classification |
|---|---|
| order_id | Dimension |
| order_month | Dimension |
| clean_first_name | Dimension |
| clean_last_name | Dimension |
| region | Dimension |
| rep_name | Dimension |
| item | Dimension |
| category | Dimension |
| unit_price | Measure |
| quantity | Measure |
| amount | Measure |
| revenue_calc | Measure |
| status | Dimension |

## KPI cards

1. **Total Revenue** — SUM(amount) = **INR 346200**. This equals Part A q05 total_revenue.
2. **Total Units Sold** — SUM(quantity) = **106**.

## Chart sheets

### 1. Revenue by Region
- Chart type: Bar chart.
- Rows: region. Columns: SUM(amount). Colour: region.
- Reason: a bar chart makes regional revenue differences easy to compare.

| Region | Revenue |
|---|---:|
| East | 69500 |
| North | 119300 |
| South | 82500 |
| West | 74900 |

### 2. Revenue by Category
- Chart type: Bar chart.
- Rows: category. Columns: SUM(amount). Colour: category.
- Reason: bars provide a direct comparison of category contribution.

| Category | Revenue |
|---|---:|
| Apparel | 77500 |
| Electronics | 142300 |
| Home | 126400 |

### 3. Revenue Trend by Month and Category
- Chart type: Line chart.
- Rows: SUM(amount). Columns: order_month. Colour: category.
- Reason: lines show month-to-month movement and category trajectories clearly.

| Month | Category | Revenue |
|---|---|---:|
| 2026-09 | Apparel | 24700 |
| 2026-09 | Electronics | 43000 |
| 2026-09 | Home | 30600 |
| 2026-10 | Apparel | 30600 |
| 2026-10 | Electronics | 49900 |
| 2026-10 | Home | 12600 |
| 2026-11 | Apparel | 22200 |
| 2026-11 | Electronics | 49400 |
| 2026-11 | Home | 83200 |

### 4. Region x Category Detail
- Chart type: Text table.
- Rows: region. Columns: category. Text: SUM(amount).
- Reason: a text table gives exact values for detailed comparison.

| Region | Category | Revenue |
|---|---|---:|
| East | Apparel | 10600 |
| East | Electronics | 21400 |
| East | Home | 37500 |
| North | Apparel | 19400 |
| North | Electronics | 73400 |
| North | Home | 26500 |
| South | Apparel | 10000 |
| South | Electronics | 28700 |
| South | Home | 43800 |
| West | Apparel | 37500 |
| West | Electronics | 18800 |
| West | Home | 18600 |

## Dashboard layout
Top to bottom: KPI cards → category filter → trend chart → comparison charts → detail table. Use a horizontal container for the KPI cards and top filter band, then vertical containers for the chart sections. Place the category filter directly below the KPI cards and apply it to all four worksheets using this data source. With Use as Filter enabled on Revenue by Region, clicking a region bar filters the trend, category comparison, and detail table to that selected region.

## Insight and recommendation narrative
### Visualization summary
The dashboard compares completed revenue across regions and categories, shows the month-by-month category trend, and provides exact region-category detail. Total revenue is INR 346200 across 106 units.

### Summary analysis
- **Regional comparison:** North generated INR 119300, versus INR 82500 in South, making North the larger of these two regions.
- **Category comparison:** Electronics generated INR 142300, while Apparel generated INR 77500 and Home generated INR 126400.
- **Monthly change:** completed revenue moved from INR 98300 in 2026-09 to INR 93100 in 2026-10 and INR 154800 in 2026-11.

### Recommendations
1. **North + Electronics promotional push:** North generated INR 119300 and Electronics is a major category; test a targeted electronics promotion in North and watch North Electronics revenue and units sold.
2. **South inventory/promotion decision:** South generated INR 82500; focus stock and promotion on the strongest South categories and watch South monthly revenue and units sold.
3. **November category push:** November completed revenue was INR 154800; use the November category mix to target the categories with the strongest contribution and watch category revenue and conversion/units in the next campaign.

## Reconciliation
| Measure | Value |
|---|---:|
| Total Revenue KPI | 346200 |
| Sum of Revenue by Region | 346200 |
| Sum of Revenue by Category | 346200 |
| Part B pivot grand total | 346200 |
