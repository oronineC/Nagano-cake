class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@search = Order.ransack(params[:q])
        @orders = @search.result.page(params[:page])
		@order_items = OrderItem.all
	end
	def show
  	    @order = Order.find(params[:id])
  	    @orders = Order.all
    end

    def update
    	@order = Order.find(params[:id])
    	@order_items = @order.order_items
    	@order.update(order_params)
    	 #注文ステータス = 入金確認
	if  @order.order_status ==  'payment_confurnatuin'
	    @order_items.each do |order_item|
		#制作ステータスが制作待ちに変更
		order_item.update(production_status: :waiting_for_production)
	    end
	end
	    redirect_to admin_order_path(@order)
    end

     private

   private
	def order_params
	    params.require(:order).permit(:order_status)
	end
end
