class Warehouse < ApplicationRecord
	has_many :inventory_items
	validates :name, :location, presence: true
end
  