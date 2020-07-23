class Item < ApplicationRecord

    has_many :carts
	attachment :image
    belongs_to :genre
    has_many :order_items, dependent: :destroy

	enum is_sales_active:{
		 on_sale: 1,
		 sold_out: 2,
    }
end
