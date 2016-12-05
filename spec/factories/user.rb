FactoryGirl.define do
  factory :user do
    login 'testUser'
    password 'testPassword'
    email 'someEmail@g.com'
  end
end