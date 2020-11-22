FactoryBot.define do
  factory :item do
    name          {Faker::Lorem.sentence}
    description   {Faker::Lorem.sentence}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    category_id   {Faker::Number.within(range: 2..11)}
    condition_id  {Faker::Number.within(range: 2..7)}
    prefecture_id {Faker::Number.within(range: 2..48)}
    send_cost_id  {Faker::Number.within(range: 2..3)}
    send_day_id   {Faker::Number.within(range: 2..4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
