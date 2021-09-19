class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :index_create, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
   redirect_to root_path unless current_user == @item_user
    
    
  end
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end  
  end
  
  private
   

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :purchase_id, :authenticity_token, :purchase_address, :token).merge(token: params[:token],user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
  def index_create
    @item = Item.find(params[:item_id])
  end
end
   
