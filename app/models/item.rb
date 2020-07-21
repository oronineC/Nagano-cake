class Item < ApplicationRecord
    has_many :carts
	attachment :image
    belongs_to :genre


	enum is_sales_active:{
		 on_sale: 1,
		 sold_out: 2,
    }
end
