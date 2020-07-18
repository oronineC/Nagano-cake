class Customers::CustomersController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :update]
 
  def new
    # @custemers = Customers.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def destroy
  end
  
  private
  
  def ensure_correct_customer
  @customer = Customer.find(params[:id])
    unless @customer == current_customer
   redirect_to(current_customer)
    end
  end
 
  
    def customer_params
    params.require(:custemer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :email, :postcode, :street_address, :phone_number)
    end
end
