customer = Customer.create(name: "John Doe", email: "john@example.com", phone: "1234567890", address: "123 Main St")
move_request = customer.move_requests.create(date: Time.now + 1.week, status: "Pending")
move_request.inventory_items.create(name: "Sofa", quantity: 1)
Warehouse.create(name: "Main Warehouse", location: "Downtown")
