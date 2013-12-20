# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    department "MyString"
    lunchgroupleader "MyString"
    optional "MyString"
    admin false
  end
end
