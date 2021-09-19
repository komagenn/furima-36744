FactoryBot.define do
  factory :purchase_address do

    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-3' }
    building_name { '' }
    telephone_number {'09011111111'}
    token {"tok_abcdefghijk00000000000000000"}
    
    
  end
end
