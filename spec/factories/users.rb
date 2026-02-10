FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
  end

  factory :post do
    text { "test" }
  end

  factory :comment do
    content { "test" }
  end

  factory :like do
    association :user
    association :post
  end

  factory :connection do
    association :follower, factory: :user
    association :followee, factory: :user
    accepted { false }
  end
end
