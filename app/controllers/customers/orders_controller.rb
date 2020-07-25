class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!

	def index
		@orders = current_customer.orders
	end

	def show
	end

	def new
		@order= Order.new
		@order.customer_id= current_customer.id
	end

	def create
	end

	def confirm
	    @order = Order.new
	    @carts = current_customer.cart
	    @order.method_of_payment = params[:order][:method_of_payment]
	    # 住所のラジオボタン選択に応じて引数を調整
	    @add = params[:order][:add].to_i
	end

	def thanks
	end
end
