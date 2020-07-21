class Item < ApplicationRecord
    has_many :carts
	attachment :image

	enum is_sales_active:{
		default: 1,
		on_sale: 2,
		sold_out: 3,
	}
end
