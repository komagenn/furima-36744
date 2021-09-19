FactoryBot.define do
  factory :user do
    nick_name              {'testファあ太郎'}
    email                 {Faker::Internet.free_email}
    password              {'00a000'}
    password_confirmation {password}
    birthday              {'1959-05-04'}
    full_width_first_name {'田中'}
    full_width_last_name  {'健太郎'}
    first_name_kana       {'タナカ'}
    last_name_kana        {'ケンタロウ'}
  end
end