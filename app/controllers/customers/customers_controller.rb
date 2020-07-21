class Customers::CustomersController < ApplicationController

  def new
    # @custemers = Customer.new
  end

before_action :authenticate_customer!
before_action :ensure_correct_customer, only: [:edit, :update]



  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @custemer.update(customer_params)
    redirect_to customers_customer_path(@customer.id)
  end

  def confirm
     @customer =Customer.find(params[:id])
  end




  def hide
    @customer =Customer.find(params[:id])
    @customer.update(is_customer_active: true)
    reset_session
     redirect_to root_path
  end

  private

  def ensure_correct_customer
  @customer = Customer.find(params[:id])
    unless @customer == current_customer
  # redirect_to (current_customer)
    end
  end

    def customer_params
    params.require(:custemer).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :email, :postcode, :street_address, :phone_number)
    end
end
