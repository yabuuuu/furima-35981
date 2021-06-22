FactoryBot.define do
  factory :item do
    name                    {Faker::Lorem.sentence}
    description             {Faker::Lorem.sentence}
    category_id             {2}
    condition_id            {3}
    shipping_burden_id      {2}
    shipping_area_id        {11}
    shipping_date_id        {3}
    price                   {18000}
    association :user 

    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
