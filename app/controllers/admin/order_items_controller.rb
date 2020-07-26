class Admin::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

    def update
    	@order_item = OrderItem.find(params[:id])
		@order_item.update(order_items_params)
	if  #注文ステータスが入金確認になったら
		@order.order_status ==  1
		#制作ステータスが制作待ちになる
		@order_items.update(production_status: 1)

	end
	   redirect_to admin_orders_path
    end

    def order_items_params
		params.require(:order_items).permit(:production_status)
	end
end
