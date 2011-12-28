# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
      amount 100.00
      due_date DateTime.now
      description "Cable"
      association :user
    end
end