class Item < ApplicationRecord
	attachment :image

	enam is_sales_active{
		default: 1,
		on_sale: 2,
		sold_out:3,
	}
end
