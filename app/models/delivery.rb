class Delivery < ApplicationRecord
	belongs_to :customer
	has_many :orders, dependent: :destroy
	validates :address, presence: true
	validates :postcode, presence: true
	validates :street_address, presence: true
end
