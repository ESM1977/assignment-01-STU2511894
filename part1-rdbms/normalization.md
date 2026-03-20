## Anomaly Analysis

### 1. Insert Anomaly
It is an anomaly which occurs when we cannot add any new information without including redundant data.

- For example: If we wish to add a new product, it cannot be added independently alone unless a full order row is created.
- Example reference: 
**Row 11** (`order_id = ORD1162`)
- Relevant columns: `product_id`, `product_name`, `category`, `unit_price` are saved with order-specific columns such as `order_id`, `customer_id`, `quantity`, `order_date`, and `sales_rep_id`.

So, if the company wish to add new product details like `P009` before any customer has ordered it, it cannot add without inventory order data such as an `order_id`, `customer_id`, `quantity`, and `order_date`.

### 2. Update Anomaly
An update anomaly occurs when we are changing one set of information then it requires multiple updates across rows, thus adding inconsistency. 

- For example: As we can see that Customer details are repeated in multiple rows, so when we make a single change must then it must be updated at many places.
- Example reference:
  - **Row 1** (`ORD1027`)
  - **Row 4** (`ORD1002`)
  - **Row 7** (`ORD1037`)
- Relevant columns: `customer_id`, `customer_name`, `customer_email`, `customer_city`

These all rows store the same customer data:
- `customer_id = C002`
- `customer_name = Priya Sharma`
- `customer_email = priya@gmail.com`
- `customer_city = Delhi`

If Priya Sharma’s email or city changes, then every row containing `C002` must be updated. If any one row is missed, the database will become inconsistent.

### 3. Delete Anomaly
A delete anomaly occurs when we delete a record that causes unintended loss of other valuable information
- For example: If we Delete an order, then it can also delete the information about a product too.

- Example reference: **Row 12** (`order_id = ORD1185`)
- Relevant columns: `product_id`, `product_name`, `category`, `unit_price`

This is the only row consisting the following product details
- `product_id = P008`
- `product_name = Webcam`

If this row is deleted because the order was removed, the company also loses all stored information about product `P008`, even though the product itself may still exist in the catalog.
