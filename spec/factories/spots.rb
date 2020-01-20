FactoryBot.define do
  factory :spot do
    title { 'タイトル' }
    spot_name { 'スポットテスト場' }
    review { 1 }
    stay_time { 2 }
    postcode { 1000000 }
    prefecture_code { 13 }
    address_city { '千代田区' }
    address_street { '千代田' }
    address_building { '' }
    user
  end
end