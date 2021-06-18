FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sei                   {Gimei.last.kanji}
    mei                   {Gimei.first.kanji}
    kana_sei              {Gimei.last.katakana}
    kana_mei              {Gimei.first.katakana}
    birthday              {Faker::Date.in_date_period}
  end
end
