require 'spec_helper'

describe User do
  let(:bad_email) { ["@.com", "mail.com", "mail@com@com.com", nil, '', ]}
  let(:good_email) { ["debbie@gmail.com", "bla@hotmail.com"]}

  it { should have_valid(:email).when(*good_email) }
  it { should_not have_valid(:email).when(*bad_email)}

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
