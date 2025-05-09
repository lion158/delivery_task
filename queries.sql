-- Task 1
SELECT p.product_id, SUM(op.quantity * p.weight) as totalWeight
FROM droptime.orders o
JOIN droptime.route_segments rs ON rs.order_id = o.order_id
JOIN droptime.orders_products op ON op.order_id = o.order_id
JOIN droptime.products p ON p.product_id = op.product_id
WHERE o.customer_id = 32 and Date(rs.segment_start_time) = '2024-02-13' and rs.segment_type = 'STOP'
GROUP BY p.product_id
ORDER BY totalWeight ASC;
