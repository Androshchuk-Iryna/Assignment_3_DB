CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.product_dimension AS
SELECT DISTINCT
  product_id,
  name,
  category
FROM assignment_bublyk_androshchuk.products_stage;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.channel_dimension AS
SELECT DISTINCT
  channel
FROM assignment_bublyk_androshchuk.orders_stage;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.date_dimension AS
SELECT DISTINCT
  DATE(order_timestamp) AS date,
  EXTRACT(YEAR FROM order_timestamp) AS year,
  EXTRACT(MONTH FROM order_timestamp) AS month,
  EXTRACT(WEEK FROM order_timestamp) AS week
FROM assignment_bublyk_androshchuk.orders_stage;


CREATE OR REPLACE TABLE assignment_bublyk_androshchuk.day_fact AS
SELECT
  DATE(o.order_timestamp) AS date,
  i.product_id,
  o.channel,
  SUM(i.quantity) AS quantity,
  SUM(i.quantity * i.price) AS revenue,
  COUNT(DISTINCT i.order_id) AS orders
FROM assignment_bublyk_androshchuk.items_stage i
JOIN assignment_bublyk_androshchuk.orders_stage o USING (order_id)
GROUP BY date, product_id, channel;


SELECT
  df.date,
  p.category,
  df.product_id,
  ch.channel,
  SUM(df.quantity) AS units,
  SUM(df.revenue) AS revenue,
  SUM(df.orders) AS orders
FROM assignment_bublyk_androshchuk.day_fact df
JOIN assignment_bublyk_androshchuk.date_dimension d
  ON d.date = df.date
JOIN assignment_bublyk_androshchuk.product_dimension p
  ON p.product_id = df.product_id
JOIN assignment_bublyk_androshchuk.channel_dimension ch
  ON ch.channel = df.channel
GROUP BY p.category, df.product_id, ch.channel, df.date;
