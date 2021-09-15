class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


    belongs_to :user
    has_one    :purchase
    has_one_attached :image
    belongs_to :genre
    belongs_to :status
    belongs_to :shipping
    belongs_to :prefecture
    belongs_to :delivery


    with_options presence: true do
        validates :item_name
        validates :explain
        validates :image
        validates :price, inclusion:{in:300..99999999}
        validates :price, numericality: { with: /\A[0-9]+\z/}
    end
   
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  end