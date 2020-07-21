class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page]).per(5)
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path(@item), notice: "商品を編集しました。"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end


private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :is_sales_active, :genre_id)
  end
end
