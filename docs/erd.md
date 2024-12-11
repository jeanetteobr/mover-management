# Entities and Relationships

 ## 1. Customer

- Attributes:
    - id (Primary Key)
    - first_name
    - last_name
    - email
    - phone_number
    - created_at
    - updated_at
- Relationships:
    - has_many :move_requests

## 2. MoveRequest

- Attributes:
    - id (Primary Key)
    - customer_id (Foreign Key)
    - move_date
    - status (e.g., pending, in-progress, completed)
    - created_at
    - updated_at
- Relationships:
    - belongs_to :customer
    - has_many :inventory_items

## 3. InventoryItem

- Attributes:
    - id (Primary Key)
    - move_request_id (Foreign Key)
    - name
    - quantity
    - weight
    - created_at
    - updated_at
- Relationships:
    - belongs_to :move_request

## 4. Warehouse (Optional)

- Attributes:
   - id (Primary Key)
   - location
   - capacity
   - created_at
   - updated_at
- Relationships:
    - has_many :inventory_items


