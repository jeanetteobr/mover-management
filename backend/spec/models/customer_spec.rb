require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      customer = Customer.new(name: 'John Doe', email: 'john.doe@example.com', phone: '1234567890')
      expect(customer).to be_valid
    end

    it 'is invalid without a name' do
      customer = Customer.new(email: 'john.doe@example.com', phone: '1234567890')
      expect(customer).to_not be_valid
      expect(customer.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      customer = Customer.new(name: 'John Doe', phone: '1234567890')
      expect(customer).to_not be_valid
      expect(customer.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a phone' do
      customer = Customer.new(name: 'John Doe', email: 'john.doe@example.com')
      expect(customer).to_not be_valid
      expect(customer.errors[:phone]).to include("can't be blank")
    end

    it 'is invalid with a duplicate email' do
      Customer.create!(name: "Jane Doe", email: "jane@example.com", phone: "1234567890")
      duplicate_customer = Customer.new(name: "John Smith", email: "jane@example.com", phone: "0987654321")
      expect(duplicate_customer).to_not be_valid
      expect(duplicate_customer.errors[:email]).to include('has already been taken')
    end
  end
end
