class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path, notice: "商品を登録しました。"
  end


private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :is_sales_active)
  end
end
