# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_lunch do
    lunch
    user
  end
end


