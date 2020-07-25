class Customers::CartsController < ApplicationController
    def index
    @carts = Cart.all
    end

    # 商品詳細画面から、「カートに入れる」を押した時のアクション
    def create
      @cart_new = Cart.new(cart_params)
      if current_customer.carts.find_by(item_id: @cart_new.item_id)
        @cart = current_customer.carts.find_by(item_id: @cart.item_id)
        @cart.quantity += @cart_new.quantity
        @cart.update
      else
        @cart_new.customer_id = current_customer.id
        @cart_new.save
      end
      redirect_to customers_carts_path
    end
    # カート詳細画面から、「更新」を押した時のアクション
    def update

      cart = Cart.find(params[:id])
      cart.update(cart_params)
      redirect_to customers_carts_path
    end

    # カート詳細画面から、「削除」を押した時のアクション
    def destroy
      cart = Cart.find(params[:id])
      cart.destroy
      redirect_to customers_carts_path
    end

    def destroy_all
      current_customer.carts.destroy_all
      redirect_back(fallback_location: root_path)
    end

    private
    def cart_params
      params.require(:cart).permit(:quantity, :item_id)
    end
end

