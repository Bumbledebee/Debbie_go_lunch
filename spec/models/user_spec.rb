require 'spec_helper'

describe User do
  it { should have_valid(:name).when(User.new) }

  it { should have_many :lunches }
  it { should have_many :groups }
end

describe 'admin checks' do
  it "is not an admin when created" do
    user = FactoryGirl.build(:user)
    expect(user.admin).to_not be_true
  end

  it "is an admin when it is true" do
    user = FactoryGirl.build(:user, admin: true)
    expect(user.admin).to be_true
  end
end

