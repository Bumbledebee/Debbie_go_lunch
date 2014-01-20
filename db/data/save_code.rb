
<div class="wrapper">
  <% group_num = (@lunch.users.count/5)+1 %>
  <% @users = @lunch.users %>
  <% groupes = @lunch.groups[0...group_num] %>
  <% groupes.each do |group| %>
    <table>
      <thead>
        <tr>
          <th>group.name</th>
          <th>group.id</th>
          <th>lunchgroupleader</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
          <th>name</th>
        </tr>
    </thead>
    <tbody>
      <tr>
        <td><%= group.name %></td>
        <td><%= group.id %></td>
        <td><%= group.lunchgroupleader%></td>
        <% @group = group %>
        <%= form_tag change_lunch_groups_path(@lunch), method: :put do %>
          <% group.users.each do |user|%>
            <td><%=user.name%>
            <%= check_box_tag "group[users][]", user.id %>
            <%= label_tag "group[users][]", ""%>
          <%end%>
          </td>
          <%= submit_tag "Add to group #{@group.name}", class: 'button'%>
        <%end%>
      </tr>
    </tbody>
  </table>
  <%end%>
</div>

user.rb in spec/models test
require 'spec_helper'

describe User do
  it { should have_valid(:name).when("Anja wer", "sadf asdf") }
  it { should_not have_valid(:name).when(nil, '') }

  let(:bad_email) { ["@.com", "mail.com", "mail@com@com.com", nil, '', ]}
  let(:good_email) { ["debbie@gmail.com", "bla@hotmail.com"]}

  it { should have_valid(:email).when(*good_email) }
  it { should_not have_valid(:email).when(*bad_email)}

  it { should have_valid(:name).when(User.new) }

  it { should have_many :lunches }
  it { should have_many :groups }


end

model that is called user_spec.rb
class User < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email
  validates_presence_of :department_id
  validates_presence_of :lunchgroupleader

  has_many :user_lunches
  has_many :lunches,
    :through => :user_lunches
  has_many :groups,
    :through => :user_groups
  has_many :user_groups
  belongs_to :department

end

factories
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

@import 'aninmate';
 *= require animate

