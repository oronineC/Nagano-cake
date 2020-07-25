class Delivery < ApplicationRecord
	belongs_to :customer
	validates :address, presence: true
	validates :postcode, presence: true
	validates :street_address, presence: true
end
