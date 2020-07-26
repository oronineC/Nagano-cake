class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@orders = current_customer.orders
	end
end
