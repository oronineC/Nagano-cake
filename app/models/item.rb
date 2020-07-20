class Item < ApplicationRecord
	attachment :image

	enum is_sales_active:{
		 on_sale: 1,
		 sold_out: 2,
	}
end
