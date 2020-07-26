class Customers::OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def index
		@orders = current_customer.orders
	end

	def thanks
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order= Order.new
		@order.customer_id= current_customer.id
	end

	def create
		if current_customer.carts.exists?
			@order = Order.new(order_params)
			@order.customer_id = current_customer.id
			@add = params[:order][:add].to_i
			case @add
				when 1
					@order.delivery_post_code = @customer.postcode
					@order.delivery_street_address = @customer.street_address
					@order.delivery_address = @customer.current_customer.lastNameKanji+current_customer.first_name_kanji

				when 2
					@order.delivery_post_code = params[:order][:delivery_post_code]
					@order.delivery_street_address = params[:order][:delivery_street_address]
					@order.delivery_address = params[:order][:delivery_address]

				when 3
					@order.delivery_post_code = params[:order][:delivery_post_code]
					@order.delivery_street_address = params[:order][:delivery_street_address]
					@order.delivery_address = params[:order][:delivery_address]
			end
			@order.save

			if Delivery.find_by(street_address: @order.delivery_street_address).nil?
				@delivery = Delivery.new
				@delivery.postcode = @order.delivery_post_code
				@delivery.street_address = @order.delivery_street_address
				@delivery.address = @order.delivery_address
				@delivery.customer_id = current_customer.id
				@delivery.save
			end

			current_customer.carts.each do |cart|
				order_item = @order.order_items.build
				order_item.order_id = @order.id
				order_item.item_id = cart.item_id
				order_item.order_quantity = cart.quantity
				order_item.order_price = cart.item.price
				order_item.save
				cart.destroy
			end

			redirect_to home_thanks_path

		else
			redirect_to root_path
		end
	end

	def confirm
		@order = Order.new
		@carts = current_customer.carts
		@order.method_of_payment = params[:order][:method_of_payment].to_i
		@add = params[:order][:add].to_i
		case @add
			when 1
				@order.delivery_post_code = current_customer.postcode
				@order.delivery_street_address = current_customer.street_address
				@order.delivery_address = current_customer.lastNameKanji+current_customer.first_name_kanji

			when 2
				@oro = params[:order][:delivery_street_address].to_i
				@delivery_street_address = Delivery.find(@oro)
				@order.delivery_post_code = @delivery_street_address.postcode
				@order.delivery_street_address = @delivery_street_address.street_address
				@order.delivery_address = @delivery_street_address.address

			when 3
				@order.delivery_post_code = params[:order][:new_add][:postcode]
				@order.delivery_street_address = params[:order][:new_add][:street_address]
				@order.delivery_address = params[:order][:new_add][:address]
		end

	end



	private
	def set_customer
    	@customer = current_customer
  	end

	def order_params
		params.require(:order).permit(:created_at, :delivery_street_address, :delivery_address, :delivery_post_code, :method_of_payment, :order_status, :total_fee, order_items_attributes: [:order_id, :item_id, :oreder_quantity, :order_price, :production_status])
	end
end
