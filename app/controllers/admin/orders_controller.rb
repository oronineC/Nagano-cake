class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@orders = Order.all
	end
	def show
  	    @order = Order.find(params[:id])
  	    @orders = Order.all
    end

    def update
    	@order = Order.find(params[:id])
		@order.update(order_params)
		#製作側が制作中か確認
	if  @order_item.production_status ==  2
		注文側の制作中
		@order.update(order_status: 2)
	end
	   redirect_to admin_orders_path
    end

     private

   private
	def order_params
	    params.require(:order).permit(:order_status)
	end
end
