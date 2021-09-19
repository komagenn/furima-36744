require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
     @user = FactoryBot.create(:user)
     @item = FactoryBot.create(:item)
    #  @item.image = fixture_file_upload('public/image/test_image.png')
     @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
    it "tokenがあれば保存ができること" do
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid.Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephone_numberが空だと保存できないこと' do
      @purchase_address.telephone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが全角数値だと保存できないこと' do
      @purchase_address.telephone_number = '０９０１１１１１１１１'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
    end
    it 'telephone_numberが10桁未満12桁以上だと保存できないこと' do
      @purchase_address.telephone_number = '090111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
    end
    it 'telephone_numberが12桁以上だと保存できないこと' do
      @purchase_address.telephone_number = '0901111111111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
    end
     it "tokenが空では登録できないこと" do
      @purchase_address.token = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @purchase_address.user_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @purchase_address.item_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
    

    

end
