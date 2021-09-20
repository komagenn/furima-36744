require 'rails_helper'

RSpec.describe User, type: :model do
  
 before do
    @user = FactoryBot.build(:user)
 end
  describe "ユーザー新規登録" do
   context "新規登録できるとき" do
    it "nicknameとemailとpasswordとpassword_confirmationとbirthdayとfull_with_nameとname_kanaが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = '00a000'
      @user.password_confirmation = '00a000'
      expect(@user).to be_valid
    end
   end
   context "新規登録できないとき" do
    it "nick_nameが空では登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
  
    it "英語のみ・数字のみ・全角文字を含むpasswordでは登録できない" do
      @user.password = 'aaaaaa','111111','111AAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
   
    it "passwordとpassword_confirmationが不一致だと登録できない" do
      @user.password = '00a000'
      @user.password_confirmation = '00aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "full_width_first_nameが空では登録できない" do
      @user.full_width_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width first name can't be blank")
    end
    it "full_width_first_nameが漢字・ひらがな・カタカナでないと登録できない" do
      @user.full_width_first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width first name Input full-width characters")
    end
    it "full_width_last_nameが空では登録できない" do
      @user.full_width_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width last name can't be blank")
    end
    it "full_width_last_nameが漢字・ひらがな・カタカナでないと登録できない" do
      @user.full_width_last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width last name Input full-width characters")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kana,がカタカナでないと登録できない" do
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
    end
    it "last_name_kana,が空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kana,がカタカナでないと登録できない" do
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters")
    end
  
   end
  end
end
