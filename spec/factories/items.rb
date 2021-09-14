FactoryBot.define do
  factory :item do

    item_name     {'あああ'}
    explain       {'あああ'}
    price         {'900'}
    genre_id      {'2'}
    status_id     {'2'}
    shipping_id   {'2'}
    prefecture_id {'2'}
    delivery_id   {'2'}    
   user

   after(:build) do |message|
    message.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
  end
  end
end
