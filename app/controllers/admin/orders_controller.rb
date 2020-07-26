class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@orders = Order.all
	end
	def show
  	    @order = Order.find(params[:id])
  	    @orders = Order.all
     end

     private

   private
	def order_params
	    params.require(:order).permit(:created_at, :delivery_street_address, :delivery_address, :delivery_post_code, :method_of_payment, :order_status, :total_fee)
	end
end
