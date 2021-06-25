FactoryBot.define do
  factory :user_item do
    association :user
    association :item
  end
end
