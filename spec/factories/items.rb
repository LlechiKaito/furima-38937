FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    content {Faker::Lorem.sentence}
    condition_id {Faker::Number.between(from: 1, to: 6)}
    shipping_fee_id {Faker::Number.between(from: 1, to: 2)}
    shipping_area_id {Faker::Number.between(from: 1, to: 47)}
    days_left_id {Faker::Number.between(from: 1, to: 3)}
    category_id {Faker::Number.between(from: 1, to: 10)}

    
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
