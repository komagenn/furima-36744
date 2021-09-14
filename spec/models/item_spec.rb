require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'item_nameとexplainとpriceとgenre_idとstatus_idとshipping_idとprefecture_idとdelivery_idとimageが存在していれば出品できる場合' do
       expect(@item).to be_valid
      end
      it '価格が¥300~¥999999の間だと出品できる' do
       expect(@item).to be_valid
      end
      
     
    end
    context '商品出品ができない場合' do
      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリー情報が空だと出品できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it '商品の状態情報が空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担情報が空だと出品できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '発送元の地域情報が空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数情報が空だと出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '価格情報が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数値だと出品できない' do
        @item.price = '９０００'
        @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end


end
