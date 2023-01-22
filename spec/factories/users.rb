FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name           { '苗字' }
    first_name            { 'なまえ' }
    family_name_kana      { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birthday              { Faker::Date.birthday }
  end
end
