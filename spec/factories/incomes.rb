# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
      amount "9.99"
      date_of_credit "2011-12-20 20:59:43"
      description "MyString"
      association :user
    end
end