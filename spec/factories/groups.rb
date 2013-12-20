# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "awesome_group"
    sequence(:lunch_id) { |n| "Lunch#{n}" }

  end
end
