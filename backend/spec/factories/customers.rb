# spec/factories/customers.rb
FactoryBot.define do
    factory :customer do
      name { Faker::Name.name }
      sequence(:email) { |n| "customer#{n}@example.com" }
      phone { Faker::PhoneNumber.phone_number }
      address { Faker::Address.full_address }
    end
  end
  