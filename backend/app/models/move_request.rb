class MoveRequest < ApplicationRecord
  belongs_to :customer
  has_many :inventory_items, dependent: :destroy
  validates :date, :status, presence: true
end
