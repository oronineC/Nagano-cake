class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :item


   enum production_status: {
        waiting: 0,
        waiting_for_production: 1,
        in_production: 2,
        productio_completd: 3,
    }
end
