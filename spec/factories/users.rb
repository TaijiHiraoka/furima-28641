FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)+"1a"}
    password_confirmation {password}
    family_name           {"平岡"}
    first_name            {"大司"}
    family_name_kana      {"ヒラオカ"}
    first_name_kana       {"タイジ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: Date.today)}
  end
end
