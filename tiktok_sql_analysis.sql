-- =====================================================
-- TikTok Shop Sales Analysis
-- Author: Erika Sientari
-- =====================================================


-- =====================================================
-- TOTAL ORDERS
-- =====================================================

SELECT COUNT(*) AS total_orders
FROM tiktok_sales;


-- =====================================================
-- TOTAL REVENUE
-- =====================================================

SELECT SUM(order_amount) AS total_revenue
FROM tiktok_sales;


-- =====================================================
-- TOTAL PRODUCTS SOLD
-- =====================================================

SELECT SUM(quantity) AS total_products_sold
FROM tiktok_sales;


-- =====================================================
-- ORDER STATUS DISTRIBUTION
-- =====================================================

SELECT order_status,
       COUNT(*) AS total_orders
FROM tiktok_sales
GROUP BY order_status
ORDER BY total_orders DESC;


-- =====================================================
-- TOP PRODUCT CATEGORIES
-- =====================================================

SELECT product_category,
       SUM(quantity) AS total_sold
FROM tiktok_sales
GROUP BY product_category
ORDER BY total_sold DESC
LIMIT 10;


-- =====================================================
-- TOP PRODUCTS BY SALES
-- =====================================================

SELECT product_name,
       SUM(quantity) AS total_sold
FROM tiktok_sales
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 10;


-- =====================================================
-- REVENUE BY PRODUCT CATEGORY
-- =====================================================

SELECT product_category,
       SUM(order_amount) AS total_revenue
FROM tiktok_sales
GROUP BY product_category
ORDER BY total_revenue DESC;


-- =====================================================
-- TOP PROVINCES BY REVENUE
-- =====================================================

SELECT province,
       SUM(order_amount) AS total_revenue
FROM tiktok_sales
GROUP BY province
ORDER BY total_revenue DESC
LIMIT 10;


-- =====================================================
-- PAYMENT METHOD ANALYSIS
-- =====================================================

SELECT payment_clean,
       COUNT(*) AS total_orders
FROM tiktok_sales
GROUP BY payment_clean
ORDER BY total_orders DESC;


-- =====================================================
-- CANCELLATION REASONS
-- =====================================================

SELECT cancel_reason_clean,
       COUNT(*) AS total_cancelled
FROM tiktok_sales
WHERE order_status = 'cancelled'
GROUP BY cancel_reason_clean
ORDER BY total_cancelled DESC;


-- =====================================================
-- MONTHLY REVENUE TREND
-- =====================================================

SELECT year_month,
       SUM(order_amount) AS total_revenue
FROM tiktok_sales
GROUP BY year_month
ORDER BY year_month;


-- =====================================================
-- MONTHLY ORDER TREND
-- =====================================================

SELECT year_month,
       COUNT(*) AS total_orders
FROM tiktok_sales
GROUP BY year_month
ORDER BY year_month;


-- =====================================================
-- AVERAGE ORDER VALUE
-- =====================================================

SELECT AVG(order_amount) AS average_order_value
FROM tiktok_sales;


-- =====================================================
-- TOP 10 HIGHEST REVENUE PRODUCTS
-- =====================================================

SELECT product_name,
       SUM(order_amount) AS total_revenue
FROM tiktok_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- =====================================================
-- DISCOUNT ANALYSIS
-- =====================================================

SELECT 
    SUM(sku_platform_discount) AS total_platform_discount,
    SUM(sku_seller_discount) AS total_seller_discount
FROM tiktok_sales;


-- =====================================================
-- SHIPPING FEE ANALYSIS
-- =====================================================

SELECT 
    AVG(shipping_fee_after_discount) AS avg_shipping_fee,
    MAX(shipping_fee_after_discount) AS max_shipping_fee,
    MIN(shipping_fee_after_discount) AS min_shipping_fee
FROM tiktok_sales;


-- =====================================================
-- REFUND ANALYSIS
-- =====================================================

SELECT 
    SUM(order_refund_amount) AS total_refund_amount
FROM tiktok_sales;


-- =====================================================
-- SUCCESSFUL VS CANCELLED ORDERS
-- =====================================================

SELECT 
    CASE
        WHEN order_status = 'cancelled' THEN 'Cancelled'
        ELSE 'Successful'
    END AS order_group,
    COUNT(*) AS total_orders
FROM tiktok_sales
GROUP BY order_group;


-- =====================================================
-- TOP 5 PRODUCT CATEGORIES BY REVENUE
-- =====================================================

SELECT product_category,
       SUM(order_amount) AS total_revenue
FROM tiktok_sales
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 5;


-- =====================================================
-- MOST COMMON ORDER SUBSTATUS
-- =====================================================

SELECT order_substatus,
       COUNT(*) AS total_orders
FROM tiktok_sales
GROUP BY order_substatus
ORDER BY total_orders DESC;


-- =====================================================
-- END OF ANALYSIS
-- =====================================================

