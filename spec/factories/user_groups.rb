# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_group do
    sequence(:user_id) { |n| "User Nr #{n}" }
    sequence(:group_id) { |n| "Group Nr #{n}"}

    group
    user
  end
end

