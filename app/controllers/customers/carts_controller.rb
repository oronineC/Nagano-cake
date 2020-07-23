class Customers::CartsController < ApplicationController

before_action :setup_cart_item!, only: [:create, :update, :delete]
<<<<<<< HEAD

    def index
    @cart_items = Cart.all

    end

=======
    def index
    @cart_items = Cart.all
    end
>>>>>>> 0795980a2c8cb50aa1adb17c11bd0a8cd454a6ad
    # 商品詳細画面から、「カートに入れる」を押した時のアクション
    def create
        if @cart_item.blank?
           @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
<<<<<<< HEAD
        end

=======
           @cart_item = Cart.new(cart_item_params)
           @cart_item.item_id = paramas[:item_id]
        end
>>>>>>> 0795980a2c8cb50aa1adb17c11bd0a8cd454a6ad
        @cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to carts_path
    end
    # カート詳細画面から、「更新」を押した時のアクション
    def update
      @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to　carts_path
    end
<<<<<<< HEAD

=======
>>>>>>> 0795980a2c8cb50aa1adb17c11bd0a8cd454a6ad
    # カート詳細画面から、「削除」を押した時のアクション
    def destroy
      @cart_item.destroy
      redirect_to carts_path
    end
<<<<<<< HEAD

    def destroy_all
      @cart_item.delete_all
      redirect_to carts_path
    end

=======
    def destroy_all
      @cart.item =
      @cart_item.destroy
      redirect_back(fallback_location: root_path)
    end
>>>>>>> 0795980a2c8cb50aa1adb17c11bd0a8cd454a6ad
    private
    def setup_cart_item!
      @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end
end
<<<<<<< HEAD
=======


>>>>>>> 0795980a2c8cb50aa1adb17c11bd0a8cd454a6ad
