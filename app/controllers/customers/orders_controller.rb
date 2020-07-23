class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!

	def index
		@orders = current_customer.orders
	end

	def show
	end

	def new
	end

	def create
	end

	def confirm
	end

	def thanks
	end
end
