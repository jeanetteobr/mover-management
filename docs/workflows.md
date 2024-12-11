# Workflows for Mover Management System

## 1. Customer Workflow
- **Purpose:** Manage customers (CRUD operations).
- **Steps:**
  1. Admin creates a new customer with name, email, and phone number.
  2. Admin views a list of all customers and filters/searches by name or email.
  3. Admin updates customer details (e.g., phone number).
  4. Admin deletes a customer (if no associated move requests exist).

## 2. Move Request Workflow
- **Purpose:** Manage move requests and their statuses.
- **Steps:**
  1. Admin creates a move request for a specific customer.
     - Adds a move date.
     - Adds items (inventory).
     - Sets the initial status (`pending`).
  2. Admin views all move requests and filters by status or customer name.
  3. Admin updates the status of a move request to `in-progress` or `completed`.
  4. Admin deletes a move request (if appropriate).

## 3. Inventory Management Workflow
- **Purpose:** Manage items associated with a move request.
- **Steps:**
  1. Admin adds inventory items to a move request (e.g., `name`, `quantity`, `weight`).
  2. Admin updates inventory items (e.g., adjust quantity or correct details).
  3. Admin assigns inventory items to a warehouse (optional).