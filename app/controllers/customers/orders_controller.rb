class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!

	def index
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
	end

	def thanks
	end
end
