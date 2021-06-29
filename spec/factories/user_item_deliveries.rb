FactoryBot.define do
  factory :user_item_delivery do
    association :user
    association :item
    token             {'tok_abcdefghijk00000000000000000'}
    zip_code          { '123-4567' }
    shipping_area_id  { 5 }
    municipalities    { '青山' }
    address           { '１丁目３' }
    building          { '青山荘' }
    tel               { '09012345678' }
  end
end
