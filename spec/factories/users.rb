# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@test.com"
  end
  
  factory :user do
    name "Marcus Vinicius"
    email {Factory.next(:email)}
    password "1234567"
  end
end