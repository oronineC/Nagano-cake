class Admin::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

    def update
    	@order_item = OrderItem.find(params[:id])
	# if  @order_item.production_status ==  2
	# 	#注文ステータスを制作中に変更
	# 	@order.update_all(order_status: 2)
	# elsif
	# 	#制作ステータス == 制作完了
	#     @order_item.production_status ==  3
	# 	#注文ステータスを制作中に変更
	# 	@order.update(order_status: 3)
	else
		@order_item.update(order_items_params)
    end

	   redirect_back(fallback_location: root_path)
    end

    def order_items_params
		params.require(:order_item).permit(:production_status)
	end
end
