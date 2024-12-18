class Customer < ApplicationRecord
	has_many :move_requests, dependent: :destroy
	
	validates :name, :email, :phone, presence: true
  	validates :email, uniqueness: { case_sensitive: false }
end
  