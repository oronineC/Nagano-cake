class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items, dependent: :destroy

	enum method_of_payment: {
        クレジットカード: 0,
        銀行振込: 1,
    }
    
   enum order_status: {
        waiting_for_payment: 0,
        payment_confurnatuin: 1,
        in_production: 2,
        preparing_to_ship: 3,
        shipped: 4,
    }

end
