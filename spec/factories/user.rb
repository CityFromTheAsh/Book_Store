
FactoryGirl.define do


  factory :user do
    login { Faker::Name.first_name }
    password { Faker::Internet.password(8, 8, true) }
    email { Faker::Internet.email }
    factory :admin do
      admin true
    end
  end
end