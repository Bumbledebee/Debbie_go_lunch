# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Max"
    email "max@company.com"
    department "Sales"
    lunchgroupleader "yes"
    optional "vegetarian"
    admin true
  end

  trait :with_users
    after :create do |lunch|
     FactoryGirl.create_list :user, 16, :lunch => lunch
    end

end
