class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
     #has_many :items
     #has_many :purchases
     with_options presence: true do
         validates :nick_name
         validates :birthday
         validates :full_width_first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: "Input full-width characters" } 
         validates :full_width_last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: "Input full-width characters" } 
         validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"}
         validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: "Input full-width katakana characters"} 
     end
         validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/}
         
  end
