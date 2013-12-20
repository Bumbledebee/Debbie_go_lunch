# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lunch do
    sequence(:name) { |n| "Lunch#{n}" }
  end
end
