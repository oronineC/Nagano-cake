class Admin::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

	def update
	end

    def order_items_params
		params.require(:order_items).permit(:production_status)
	end
end
