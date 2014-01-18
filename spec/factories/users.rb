# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Max"
    sequence(:email) {|n|"m#{n}ax@company.com"}
    department
    password "password"
    password_confirmation "password"
    lunchgroupleader
    optional "vegetarian"
    admin false

    trait :willing_to_be_leader do
      lunchgroupleader 1
    end

    trait :kind_of_willing_to_be_leader do
      lunchgroupleader 2
    end

    trait :not_willing_to_be_leader do
      lunchgroupleader 3
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

  factory :admin do
    name "Admin"
    email "admin@company.com"
    department
    password 'secretsuper'
    password_confirmation 'secretsuper'
    lunchgroupleader
    optional "pizza"
    admin true
  end

end
