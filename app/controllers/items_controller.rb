class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:edit]
  before_action :set_item, only: [:show ,:edit,:update]
  def index
    @items = Item.order(id: "DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end
  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
     end
     
  end
  def update
     if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end

  end
 
  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :price, :image, :genre_id, :status_id, :shipping_id, :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end