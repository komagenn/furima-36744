require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'item_nameとexplainとpriceとgenre_idとstatus_idとshipping_idとprefecture_idとdelivery_idとimageが存在していれば出品できる場合' do
       expect(@item).to be_valid
      end
      it '価格が半角数値だと出品できる' do
       expect(@item).to be_valid
      end
      it '価格情報が¥300~¥9999999の間だと出品できる' do
       expect(@item).to be_valid
      end
    end
  end
    context '商品出品ができない場合' do
      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("item name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @item.explain = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("explain can't be blank")
      end
      it 'カテゴリー情報が空だと出品できない' do
        @item.genre_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("genre id can't be blank")
      end
      it '商品の状態情報が空だと出品できない' do
        @item.status_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("status id can't be blank")
      end
      it '配送料の負担情報が空だと出品できない' do
        @item.shipping_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("shipping id can't be blank")
      end
      it '発送元の地域情報が空だと出品できない' do
        @item.prefecture_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("prefecture id can't be blank")
      end
      it '発送までの日数情報が空だと出品できない' do
        @item.delivery_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("delivery id can't be blank")
      end
      it '価格情報が空だと出品できない' do
        @item.price = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("price can't be blank")
      end
      


end
