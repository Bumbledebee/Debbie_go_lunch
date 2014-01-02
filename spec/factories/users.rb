# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Max"
    sequence(:email) {|n|"m#{n}ax@company.com"}
    department
    lunchgroupleader "yes"
    optional "vegetarian"
    admin true

    trait :willing_to_be_leader do
      lunchgroupleader "sure, no prob"
    end

    trait :kind_of_willing_to_be_leader do
      lunchgroupleader "only if needed"
    end

    trait :not_willing_to_be_leader do
      lunchgroupleader "not this time"
    end

    trait :with_users do
      after :create do |lunch|
       FactoryGirl.create_list :user, 16, :lunch => lunch
      end
    end

    factory :user_willing_to_be_leader, traits: [:willing_to_be_leader]
    factory :user_kind_of_willing_to_be_leader, traits: [:kind_of_willing_to_be_leader]
    factory :user_not_willing_to_be_leader, traits: [:kind_of_willing_to_be_leader]
   end
end
