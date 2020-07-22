class CustomersCartsController < ApplicationController
	before_action :setup_cart_item!, only: [:create_item, :update_item, :delete_item]

    # 商品詳細画面から、「カートに入れる」を押した時のアクション
    def create
      @cart_item = current_user.cart_items.new(cart_item_params)
      @cart_items = current_user.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
           new_quantity = cart_item.quantity + @cart_item.quantity
           cart_item.update_attribute(:quantity, new_quantity)
           @cart_item.delete
        end 
     end
      @cart_item.save

    redirect_to carts_path
    end


    # カート詳細画面から、「更新」を押した時のアクション
    def update_item
      @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to　carts_path
  end
end
    # カート詳細画面から、「削除」を押した時のアクション
    def delete_item
      @cart_item.destroy
      redirect_to carts_path
    end

    private

    def setup_cart_item!
      @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
   end