class Admin::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

    def update
    	@order_item = OrderItem.find(params[:id])
    	@order = @order_item.order
    	@order_item.update(order_items_params)

		if  @order_item.production_status ==  "in_production"
			@order.update(order_status: :in_production)
			#制作ステータス == 制作完了
		elsif
			@order.order_items.count ==  @order.order_items.where(production_status: :productio_completd).count

			#注文ステータスを制作中に変更
			@order.update(order_status: :preparing_to_ship)
		end
	    redirect_to admin_order_path(@order)
	end


    def order_items_params
		params.require(:order_item).permit(:production_status)
	end
end
