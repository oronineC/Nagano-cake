class Customers::ItemsController < ApplicationController
  def index
  	@items = Item.all
  	@info = "商品"
  end

  def show
  	@item = Item.find(params[:id])

  end
end
