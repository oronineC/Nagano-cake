class Customers::CartsController < ApplicationController

before_action :setup_cart_item!, only: [:create, :update, :delete]

    def index
    @cart_items = Cart.all

    end

    # 商品詳細画面から、「カートに入れる」を押した時のアクション
    def create
        if @cart_item.blank?
           @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
        end

        @cart_item.quantity += params[:quantity].to_i
        @cart_item.save
        redirect_to carts_path
    end


    # カート詳細画面から、「更新」を押した時のアクション
    def update
      @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to　carts_path
    end

    # カート詳細画面から、「削除」を押した時のアクション
    def destroy
      @cart_item.destroy
      redirect_to carts_path
    end

    def destroy_all
      @cart_item.delete_all
      redirect_to carts_path
    end

    private

    def setup_cart_item!
      @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end
end
