class Address < ApplicationRecord

  belongs_to :purchase


  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :telephone_number
    validates :purchase
  end
end
