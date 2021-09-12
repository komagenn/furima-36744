require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nick_nameが空では登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが６文字以上でないと登録できない" do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
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
    it "emailが既に登録してあると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      binding.pry
      expect(another_user.errors.full_messages).to include("Email is invalid")
    end
    it "emailに@が含まれていないと登録できない" do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end
end
