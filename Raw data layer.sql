
-- RAW LAYER: Orders 

CREATE OR REPLACE TABLE `assignment_bublyk_androshchuk.orders_raw` (
  order_id INT64,
  order_data JSON
) AS
SELECT 1 AS order_id, JSON '{"customer": {"id": 301, "name": "Anna"}, "payment": {"method": "card", "currency": "UAH"}, "shipping": {"city": "Kyiv", "country": "UA"}, "items": [{"product_id": 1001, "category": "electronics", "quantity": 1, "price": 299.99}, {"product_id": 1002, "category": "accessories", "quantity": 2, "price": 19.99}], "totals": {"amount": 339.97, "discount": 0.00}, "channel": "web", "timestamp": "2025-11-01T09:10:00Z"}' AS order_data
UNION ALL SELECT 2, JSON '{"customer": {"id": 302, "name": "Ben"}, "payment": {"method": "paypal", "currency": "UAH"}, "shipping": {"city": "Lviv", "country": "UA"}, "items": [{"product_id": 2001, "category": "apparel", "quantity": 2, "price": 49.50}, {"product_id": 2002, "category": "apparel", "quantity": 1, "price": 15.00}], "totals": {"amount": 114.00, "discount": 0.00}, "channel": "mobile", "timestamp": "2025-11-01T11:20:00Z"}'
UNION ALL SELECT 3, JSON '{"customer": {"id": 303, "name": "Cara"}, "payment": {"method": "apple_pay", "currency": "UAH"}, "shipping": {"city": "Kharkiv", "country": "UA"}, "items": [{"product_id": 3001, "category": "home", "quantity": 1, "price": 129.00}, {"product_id": 3002, "category": "home", "quantity": 3, "price": 25.00}], "totals": {"amount": 183.60, "discount": 20.40}, "channel": "web", "timestamp": "2025-11-01T18:55:00Z"}'
UNION ALL SELECT 4, JSON '{"customer": {"id": 304, "name": "Diego"}, "payment": {"method": "card", "currency": "UAH"}, "shipping": {"city": "Odesa", "country": "UA"}, "items": [{"product_id": 4001, "category": "electronics", "quantity": 1, "price": 899.00}], "totals": {"amount": 899.00, "discount": 0.00}, "channel": "web", "timestamp": "2025-11-02T08:00:00Z"}'
UNION ALL SELECT 5, JSON '{"customer": {"id": 305, "name": "Elena"}, "payment": {"method": "crypto", "currency": "UAH"}, "shipping": {"city": "Dnipro", "country": "UA"}, "items": [{"product_id": 5001, "category": "books", "quantity": 3, "price": 12.00}, {"product_id": 5002, "category": "toys", "quantity": 1, "price": 25.00}], "totals": {"amount": 61.00, "discount": 0.00}, "channel": "mobile", "timestamp": "2025-11-02T16:45:00Z"}'
UNION ALL SELECT 6, JSON '{"customer": {"id": 306, "name": "Farid"}, "payment": {"method": "paypal", "currency": "UAH"}, "shipping": {"city": "Kyiv", "country": "UA"}, "items": [{"product_id": 6001, "category": "sports", "quantity": 1, "price": 59.99}, {"product_id": 6002, "category": "sports", "quantity": 2, "price": 29.99}], "totals": {"amount": 119.97, "discount": 0.00}, "channel": "web", "timestamp": "2025-11-03T09:30:00Z"}'
UNION ALL SELECT 7, JSON '{"customer": {"id": 307, "name": "Grace"}, "payment": {"method": "card", "currency": "UAH"}, "shipping": {"city": "Lviv", "country": "UA"}, "items": [{"product_id": 7001, "category": "beauty", "quantity": 2, "price": 19.99}, {"product_id": 7002, "category": "beauty", "quantity": 1, "price": 9.99}], "totals": {"amount": 44.97, "discount": 5.00}, "channel": "mobile", "timestamp": "2025-11-03T19:05:00Z"}'
UNION ALL SELECT 8, JSON '{"customer": {"id": 308, "name": "Hugo"}, "payment": {"method": "apple_pay", "currency": "UAH"}, "shipping": {"city": "Zaporizhzhia", "country": "UA"}, "items": [{"product_id": 8001, "category": "apparel", "quantity": 1, "price": 69.00}, {"product_id": 8002, "category": "accessories", "quantity": 3, "price": 9.50}], "totals": {"amount": 97.50, "discount": 0.00}, "channel": "web", "timestamp": "2025-11-04T12:15:00Z"}'
UNION ALL SELECT 9, JSON '{"customer": {"id": 309, "name": "Ines"}, "payment": {"method": "card", "currency": "UAH"}, "shipping": {"city": "Kyiv", "country": "UA"}, "items": [{"product_id": 9001, "category": "home", "quantity": 1, "price": 199.00}, {"product_id": 9002, "category": "electronics", "quantity": 1, "price": 49.00}], "totals": {"amount": 248.00, "discount": 0.00}, "channel": "web", "timestamp": "2025-11-05T18:10:30Z"}'
UNION ALL SELECT 10, JSON '{"customer": {"id": 310, "name": "Josh"}, "payment": {"method": "paypal", "currency": "UAH"}, "shipping": {"city": "Chernihiv", "country": "UA"}, "items": [{"product_id": 10001, "category": "books", "quantity": 2, "price": 25.00}, {"product_id": 10002, "category": "toys", "quantity": 2, "price": 19.00}], "totals": {"amount": 88.00, "discount": 0.00}, "channel": "mobile", "timestamp": "2025-11-06T07:05:00Z"}';


-- RAW LAYER: Customers

CREATE OR REPLACE TABLE `assignment_bublyk_androshchuk.customers_raw` (
  customer_id INT64,
  customer_data JSON
) AS
SELECT 301 AS customer_id, JSON '{"name": "Anna", "email": "anna@example.com", "phone": "+380501234567", "registration_date": "2024-01-15", "address": {"city": "Kyiv", "country": "UA", "postal_code": "01001"}, "segment": "premium", "lifetime_value": 2500.50, "preferences": {"newsletter": true, "sms": false}}' AS customer_data
UNION ALL SELECT 302, JSON '{"name": "Ben", "email": "ben@example.com", "phone": "+380502345678", "registration_date": "2024-03-22", "address": {"city": "Lviv", "country": "UA", "postal_code": "79000"}, "segment": "regular", "lifetime_value": 450.00, "preferences": {"newsletter": false, "sms": true}}'
UNION ALL SELECT 303, JSON '{"name": "Cara", "email": "cara@example.com", "phone": "+380503456789", "registration_date": "2023-11-10", "address": {"city": "Kharkiv", "country": "UA", "postal_code": "61000"}, "segment": "vip", "lifetime_value": 5200.00, "preferences": {"newsletter": true, "sms": true}}'
UNION ALL SELECT 304, JSON '{"name": "Diego", "email": "diego@example.com", "phone": "+380504567890", "registration_date": "2024-05-01", "address": {"city": "Odesa", "country": "UA", "postal_code": "65000"}, "segment": "regular", "lifetime_value": 1100.00, "preferences": {"newsletter": true, "sms": false}}'
UNION ALL SELECT 305, JSON '{"name": "Elena", "email": "elena@example.com", "phone": "+380505678901", "registration_date": "2024-07-18", "address": {"city": "Dnipro", "country": "UA", "postal_code": "49000"}, "segment": "new", "lifetime_value": 61.00, "preferences": {"newsletter": false, "sms": false}}'
UNION ALL SELECT 306, JSON '{"name": "Farid", "email": "farid@example.com", "phone": "+380506789012", "registration_date": "2024-02-14", "address": {"city": "Kyiv", "country": "UA", "postal_code": "02002"}, "segment": "regular", "lifetime_value": 890.00, "preferences": {"newsletter": true, "sms": true}}'
UNION ALL SELECT 307, JSON '{"name": "Grace", "email": "grace@example.com", "phone": "+380507890123", "registration_date": "2023-09-05", "address": {"city": "Lviv", "country": "UA", "postal_code": "79001"}, "segment": "premium", "lifetime_value": 3100.00, "preferences": {"newsletter": true, "sms": false}}'
UNION ALL SELECT 308, JSON '{"name": "Hugo", "email": "hugo@example.com", "phone": "+380508901234", "registration_date": "2024-04-20", "address": {"city": "Zaporizhzhia", "country": "UA", "postal_code": "69000"}, "segment": "regular", "lifetime_value": 650.00, "preferences": {"newsletter": false, "sms": true}}'
UNION ALL SELECT 309, JSON '{"name": "Ines", "email": "ines@example.com", "phone": "+380509012345", "registration_date": "2024-06-11", "address": {"city": "Kyiv", "country": "UA", "postal_code": "01003"}, "segment": "premium", "lifetime_value": 1800.00, "preferences": {"newsletter": true, "sms": true}}'
UNION ALL SELECT 310, JSON '{"name": "Josh", "email": "josh@example.com", "phone": "+380500123456", "registration_date": "2024-08-30", "address": {"city": "Chernihiv", "country": "UA", "postal_code": "14000"}, "segment": "new", "lifetime_value": 88.00, "preferences": {"newsletter": false, "sms": false}}';


-- RAW LAYER: Products

CREATE OR REPLACE TABLE `assignment_bublyk_androshchuk.products_raw` (
  product_id INT64,
  product_data JSON
) AS
SELECT 1001 AS product_id, JSON '{"name": "Smartphone X Pro", "category": "electronics", "subcategory": "mobile", "brand": "TechBrand", "price": 299.99, "cost": 180.00, "stock_quantity": 50, "supplier": {"id": 501, "name": "ElectroSupply Ltd"}, "attributes": {"color": "black", "storage": "128GB"}, "launch_date": "2024-01-10"}' AS product_data
UNION ALL SELECT 1002, JSON '{"name": "Phone Case", "category": "accessories", "subcategory": "phone_accessories", "brand": "ProtectPlus", "price": 19.99, "cost": 8.00, "stock_quantity": 200, "supplier": {"id": 502, "name": "AccessoryHub"}, "attributes": {"color": "transparent", "material": "silicone"}, "launch_date": "2023-11-20"}'
UNION ALL SELECT 2001, JSON '{"name": "Cotton T-Shirt", "category": "apparel", "subcategory": "tops", "brand": "FashionCo", "price": 49.50, "cost": 22.00, "stock_quantity": 150, "supplier": {"id": 503, "name": "TextileWorks"}, "attributes": {"size": "M", "color": "blue"}, "launch_date": "2024-03-05"}'
UNION ALL SELECT 2002, JSON '{"name": "Socks Pack", "category": "apparel", "subcategory": "basics", "brand": "ComfortWear", "price": 15.00, "cost": 6.00, "stock_quantity": 300, "supplier": {"id": 503, "name": "TextileWorks"}, "attributes": {"size": "universal", "pack": "3 pairs"}, "launch_date": "2023-08-15"}'
UNION ALL SELECT 3001, JSON '{"name": "Coffee Maker Deluxe", "category": "home", "subcategory": "kitchen", "brand": "HomePro", "price": 129.00, "cost": 70.00, "stock_quantity": 80, "supplier": {"id": 504, "name": "HomeGoods Inc"}, "attributes": {"capacity": "1.5L", "color": "silver"}, "launch_date": "2024-02-01"}'
UNION ALL SELECT 3002, JSON '{"name": "Kitchen Towels Set", "category": "home", "subcategory": "textiles", "brand": "CozyHome", "price": 25.00, "cost": 10.00, "stock_quantity": 250, "supplier": {"id": 504, "name": "HomeGoods Inc"}, "attributes": {"material": "cotton", "pack": "6 pieces"}, "launch_date": "2023-10-10"}'
UNION ALL SELECT 4001, JSON '{"name": "Laptop UltraBook", "category": "electronics", "subcategory": "computers", "brand": "TechBrand", "price": 899.00, "cost": 550.00, "stock_quantity": 30, "supplier": {"id": 501, "name": "ElectroSupply Ltd"}, "attributes": {"ram": "16GB", "storage": "512GB SSD"}, "launch_date": "2024-04-15"}'
UNION ALL SELECT 5001, JSON '{"name": "Classic Novel", "category": "books", "subcategory": "fiction", "brand": "ReadMore Publishing", "price": 12.00, "cost": 5.00, "stock_quantity": 500, "supplier": {"id": 505, "name": "BookDistributors"}, "attributes": {"pages": 320, "language": "English"}, "launch_date": "2020-05-20"}'
UNION ALL SELECT 5002, JSON '{"name": "Building Blocks Set", "category": "toys", "subcategory": "educational", "brand": "PlayFun", "price": 25.00, "cost": 12.00, "stock_quantity": 180, "supplier": {"id": 506, "name": "ToyWorld"}, "attributes": {"pieces": 100, "age": "3+"}, "launch_date": "2023-12-01"}'
UNION ALL SELECT 6001, JSON '{"name": "Yoga Mat Pro", "category": "sports", "subcategory": "fitness", "brand": "ActiveLife", "price": 59.99, "cost": 28.00, "stock_quantity": 120, "supplier": {"id": 507, "name": "SportSupplies"}, "attributes": {"thickness": "6mm", "color": "purple"}, "launch_date": "2024-01-25"}'
UNION ALL SELECT 6002, JSON '{"name": "Resistance Bands", "category": "sports", "subcategory": "fitness", "brand": "ActiveLife", "price": 29.99, "cost": 15.00, "stock_quantity": 200, "supplier": {"id": 507, "name": "SportSupplies"}, "attributes": {"resistance": "medium", "pack": "3 bands"}, "launch_date": "2023-09-10"}'
UNION ALL SELECT 7001, JSON '{"name": "Face Cream", "category": "beauty", "subcategory": "skincare", "brand": "GlowBeauty", "price": 19.99, "cost": 8.50, "stock_quantity": 300, "supplier": {"id": 508, "name": "BeautyWholesale"}, "attributes": {"volume": "50ml", "type": "moisturizing"}, "launch_date": "2024-02-14"}'
UNION ALL SELECT 7002, JSON '{"name": "Lip Balm", "category": "beauty", "subcategory": "makeup", "brand": "GlowBeauty", "price": 9.99, "cost": 4.00, "stock_quantity": 400, "supplier": {"id": 508, "name": "BeautyWholesale"}, "attributes": {"flavor": "vanilla", "spf": "15"}, "launch_date": "2023-07-20"}'
UNION ALL SELECT 8001, JSON '{"name": "Denim Jacket", "category": "apparel", "subcategory": "outerwear", "brand": "FashionCo", "price": 69.00, "cost": 35.00, "stock_quantity": 90, "supplier": {"id": 503, "name": "TextileWorks"}, "attributes": {"size": "L", "color": "blue"}, "launch_date": "2024-03-15"}'
UNION ALL SELECT 8002, JSON '{"name": "Leather Belt", "category": "accessories", "subcategory": "fashion_accessories", "brand": "StylePlus", "price": 9.50, "cost": 4.50, "stock_quantity": 250, "supplier": {"id": 502, "name": "AccessoryHub"}, "attributes": {"material": "genuine leather", "color": "brown"}, "launch_date": "2023-06-10"}'
UNION ALL SELECT 9001, JSON '{"name": "Table Lamp Modern", "category": "home", "subcategory": "lighting", "brand": "HomePro", "price": 199.00, "cost": 95.00, "stock_quantity": 60, "supplier": {"id": 504, "name": "HomeGoods Inc"}, "attributes": {"bulb_type": "LED", "color": "white"}, "launch_date": "2024-05-01"}'
UNION ALL SELECT 9002, JSON '{"name": "Wireless Mouse", "category": "electronics", "subcategory": "peripherals", "brand": "TechBrand", "price": 49.00, "cost": 22.00, "stock_quantity": 170, "supplier": {"id": 501, "name": "ElectroSupply Ltd"}, "attributes": {"connection": "Bluetooth", "color": "black"}, "launch_date": "2023-12-15"}'
UNION ALL SELECT 10001, JSON '{"name": "Cookbook Collection", "category": "books", "subcategory": "non-fiction", "brand": "ReadMore Publishing", "price": 25.00, "cost": 12.00, "stock_quantity": 150, "supplier": {"id": 505, "name": "BookDistributors"}, "attributes": {"pages": 450, "recipes": "200+"}, "launch_date": "2024-01-05"}'
UNION ALL SELECT 10002, JSON '{"name": "Board Game Classic", "category": "toys", "subcategory": "games", "brand": "PlayFun", "price": 19.00, "cost": 9.00, "stock_quantity": 220, "supplier": {"id": 506, "name": "ToyWorld"}, "attributes": {"players": "2-4", "age": "8+"}, "launch_date": "2023-11-15"}';






SELECT 'orders' as table_name, COUNT(*) as row_count FROM `assignment_bublyk_androshchuk.orders_raw`
UNION ALL
SELECT 'customers', COUNT(*) FROM `assignment_bublyk_androshchuk.customers_raw`
UNION ALL
SELECT 'products', COUNT(*) FROM `assignment_bublyk_androshchuk.products_raw`;

SELECT * FROM `assignment_bublyk_androshchuk.orders_raw` LIMIT 3;
SELECT * FROM `assignment_bublyk_androshchuk.customers_raw` LIMIT 3;
SELECT * FROM `assignment_bublyk_androshchuk.products_raw` LIMIT 3;