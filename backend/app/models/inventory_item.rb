class InventoryItem < ApplicationRecord
  belongs_to :move_request
  validates :name, :quantity, presence: true
end
