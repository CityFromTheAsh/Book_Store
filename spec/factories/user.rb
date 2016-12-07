
FactoryGirl.define do
  factory :user do
    login { Faker::Name.name }
    password { Faker::Internet.password(8, 8, true) }
    email { Faker::Internet.email }
    factory :admin do
      admin true
    end
    factory :rich_user do
      balance 1_000_000
    end
  end
end