CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.orders_stage AS
SELECT DISTINCT
  order_id,
  JSON_VALUE(order_data,'$.customer.id') AS customer_id,
  JSON_VALUE(order_data,'$.customer.name') AS customer_name,
  JSON_VALUE(order_data,'$.payment.method') AS payment_method,
  JSON_VALUE(order_data,'$.payment.currency') AS currency,
  JSON_VALUE(order_data,'$.shipping.city') AS shipping_city,
  JSON_VALUE(order_data,'$.shipping.country') AS shipping_country,
  CAST(JSON_VALUE(order_data,'$.totals.amount') AS NUMERIC) AS total_amount,
  CAST(JSON_VALUE(order_data,'$.totals.discount') AS NUMERIC) AS discount_amount,
  JSON_VALUE(order_data,'$.channel') AS channel,
  TIMESTAMP(JSON_VALUE(order_data,'$.timestamp')) AS order_timestamp
FROM assignment_bublyk_androshchuk.orders_raw;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.items_stage AS
SELECT DISTINCT
  order_id,
  CAST(JSON_VALUE(item,'$.product_id') AS INT64) AS product_id,
  JSON_VALUE(item,'$.category') AS category,
  CAST(JSON_VALUE(item,'$.quantity') AS INT64) AS quantity,
  CAST(JSON_VALUE(item,'$.price') AS NUMERIC) AS price
FROM assignment_bublyk_androshchuk.orders_raw,
UNNEST(JSON_QUERY_ARRAY(order_data,'$.items')) AS item;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.customers_stage AS
SELECT DISTINCT
  customer_id,
  JSON_VALUE(customer_data,'$.name') AS name,
  JSON_VALUE(customer_data,'$.email') AS email,
  JSON_VALUE(customer_data,'$.phone') AS phone,
  DATE(JSON_VALUE(customer_data,'$.registration_date')) AS registration_date,
  JSON_VALUE(customer_data,'$.address.city') AS city,
  JSON_VALUE(customer_data,'$.address.country') AS country,
  JSON_VALUE(customer_data,'$.address.postal_code') AS postal_code,
  JSON_VALUE(customer_data,'$.segment') AS segment,
  CAST(JSON_VALUE(customer_data,'$.lifetime_value') AS NUMERIC) AS lifetime_value,
  CAST(JSON_VALUE(customer_data,'$.preferences.newsletter') AS BOOL) AS newsletter_preference,
  CAST(JSON_VALUE(customer_data,'$.preferences.sms') AS BOOL) AS sms_preference
FROM assignment_bublyk_androshchuk.customers_raw;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.products_stage AS
SELECT DISTINCT
  product_id,
  JSON_VALUE(product_data,'$.name') AS name,
  JSON_VALUE(product_data,'$.category') AS category,
  JSON_VALUE(product_data,'$.subcategory') AS subcategory,
  JSON_VALUE(product_data,'$.brand') AS brand,
  CAST(JSON_VALUE(product_data,'$.price') AS NUMERIC) AS price,
  CAST(JSON_VALUE(product_data,'$.cost') AS NUMERIC) AS cost,
  CAST(JSON_VALUE(product_data,'$.stock_quantity') AS INT64) AS stock_quantity,
  JSON_VALUE(product_data,'$.supplier.id') AS supplier_id,
  JSON_VALUE(product_data,'$.supplier.name') AS supplier_name,
  JSON_VALUE(product_data,'$.attributes.color') AS color,
  JSON_VALUE(product_data,'$.attributes.size') AS size,
  JSON_VALUE(product_data,'$.launch_date') AS launch_date
FROM assignment_bublyk_androshchuk.products_raw;



CREATE OR REPLACE VIEW assignment_bublyk_androshchuk.scd_view AS
SELECT
  product_id, name, category, subcategory, brand, price, cost, stock_quantity, supplier_id, supplier_name, color, size, launch_date,
  TO_HEX(SHA256(TO_JSON_STRING(STRUCT(name, category, subcategory, brand, price, cost, stock_quantity, supplier_id, supplier_name, color, size, launch_date)))) AS row_hash
FROM assignment_bublyk_androshchuk.products_stage;


CREATE TABLE IF NOT EXISTS assignment_bublyk_androshchuk.products_scd (
  product_id INT64,
  name STRING,
  category STRING,
  subcategory STRING,
  brand STRING,
  price NUMERIC,
  cost NUMERIC,
  stock_quantity INT64,
  supplier_id STRING,
  supplier_name STRING,
  color STRING,
  size STRING,
  launch_date STRING,
  effective_from TIMESTAMP,
  effective_to TIMESTAMP,
  is_current BOOL,
  row_hash STRING
);


INSERT INTO assignment_bublyk_androshchuk.products_scd (product_id, name, category, subcategory, brand, price, cost, stock_quantity, supplier_id, supplier_name, color, size, launch_date,effective_from, effective_to, is_current, row_hash
)
SELECT 
  v.product_id, v.name, v.category, v.subcategory, v.brand, v.price, v.cost, v.stock_quantity, v.supplier_id, v.supplier_name, v.color, v.size,v.launch_date,
  CURRENT_TIMESTAMP(),
  TIMESTAMP '2030-12-31 00:00:00',
  TRUE,
  v.row_hash
FROM assignment_bublyk_androshchuk.scd_view v;


UPDATE assignment_bublyk_androshchuk.products_scd p
SET effective_to = CURRENT_TIMESTAMP(),
    is_current = FALSE
WHERE p.is_current = TRUE
  AND EXISTS (
  SELECT 1
  FROM assignment_bublyk_androshchuk.scd_view v
  WHERE v.product_id = p.product_id
  AND v.row_hash <> p.row_hash
  );


INSERT INTO assignment_bublyk_androshchuk.products_scd (product_id, name, category, subcategory, brand, price, cost, stock_quantity, supplier_id, supplier_name, color, size, launch_date,effective_from, effective_to, is_current, row_hash
)
SELECT
  v.product_id, v.name, v.category, v.subcategory, v.brand, v.price, v.cost, v.stock_quantity, v.supplier_id, v.supplier_name, v.color, v.size,v.launch_date,
  CURRENT_TIMESTAMP(),
  TIMESTAMP '2030-12-31 00:00:00',
  TRUE,
  v.row_hash
FROM assignment_bublyk_androshchuk.scd_view v
LEFT JOIN (
  SELECT product_id, row_hash
  FROM assignment_bublyk_androshchuk.products_scd
  WHERE is_current = TRUE
) c
ON c.product_id = v.product_id
WHERE c.product_id IS NULL
   OR c.row_hash <> v.row_hash;
