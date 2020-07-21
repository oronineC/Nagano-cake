class Customers::ItemsController < ApplicationController
  def top
    @genres = Genre.where(is_active_status: 1)
    if customer_signed_in?
       @customer = Customer.find(current_customer.id)
    end
    @items = Item.limit(4)
  end

  def index
  	@items = Item.all
  	# ジャンル検索機能
    # ジャンルが"有効"な場合
    @genres = Genre.where(is_active_status: 1)
    # urlにgenre_id(params)がある場合
    if params[:genre_id]
      # ジャンルIDが一致する商品を取得
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order(created_at: :desc).page(params[:page]).per(8)
      @info = "#{@genre.name}"
    else
      # 全商品を取得
      @items = Item.order(created_at: :desc).page(params[:page]).per(8)
      @info = "商品"
    end

    @counts = @items.total_count

  end

  def show
  	@genres = Genre.where(is_active_status: 1)
  	@item = Item.find(params[:id])

  end
end
