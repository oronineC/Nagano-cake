class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@orders = Order.all
	end
	def show
  	    @order = Order.find(params[:id])
  	    @orders = Order.all
  	    @order_items = @order.order_items
    end

    def update
    	@order = Order.find(params[:id])
    	@order_items = @order.order_items
    	@order.update(order_params)
		if  @order.order_status == 1
		#制作ステータスが制作待ちに変更
			@order_items.update_all(production_status: 2)
		end
	    redirect_to admin_order_path(@order)
    end

   	private
	def order_params
	    params.require(:order).permit(:order_status)
	end
end
