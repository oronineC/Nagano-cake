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
	if  #注文ステータス = 入金確認
		@order.order_status ==  1
		#制作ステータスが制作待ちに変更
		@order_items.update(production_status: 1)
	else
		@order.update(order_params)
	end
	    redirect_to admin_order_path(@order)
	   # redirect_back(fallback_location: root_path)
    end

     private

   private
	def order_params
	    params.require(:order).permit(:order_status)
	end
end
