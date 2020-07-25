class Admin::CustomersController < ApplicationController
	before_action :authenticate_admin!
   def index
    @customers = Customer.page(params[:page]).per(5)
  end

  def show
  	@customer = Customer.find(params[:id])
  end


  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path, notice: "会員を編集しました。"
  end


private

 def customer_params
    params.require(:customer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :email, :postcode, :street_address, :phone_number, :is_customer_active)
 end
end
