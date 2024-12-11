require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with valid attributes" do
    customer = Customer.new(name: "John Doe", email: "john@example.com", phone: "1234567890", address: "123 Main St")
    expect(customer).to be_valid
  end

  it "is invalid without a name" do
    customer = Customer.new(email: "john@example.com", phone: "1234567890", address: "123 Main St")
    expect(customer).not_to be_valid
  end
end
