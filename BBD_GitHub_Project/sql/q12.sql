-- Business question: What contribution tier does each product receive based on completed-order revenue?
SELECT o.item, SUM(o.amount) AS total_revenue, CASE WHEN SUM(o.amount) >= 60000 THEN 'High' WHEN SUM(o.amount) >= 15000 THEN 'Medium' ELSE 'Low' END AS contribution_tier FROM orders AS o WHERE o.status = 'completed' GROUP BY o.item ORDER BY total_revenue DESC;
