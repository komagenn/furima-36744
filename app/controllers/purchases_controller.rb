class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end
    
  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_8c41e4572fc8cf0cbe4cd107"
    Payjp::Charge.create(
      amount:  @item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
