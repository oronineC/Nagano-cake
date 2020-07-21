class Admin::CustomersController < ApplicationController
	before_action :authenticate_admin!
   def index
    @customers = Customers.page(params[:page]).per(5)
  end

  def show
  	@castomer = Customer.find(params[:id])
  end


  def edit
    @castomer = Castomer.find(params[:id])
  end

  def update
    @castomer = Castomer.find(params[:id])
    @castomer.update(castomer_params)
    redirect_to admin_castomers_path, notice: "会員を編集しました。"
  end


private

 def customer_params
    params.require(:custemer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :email, :postcode, :street_address, :phone_number)
 end
end
