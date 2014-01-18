require 'spec_helper'

feature 'user can decide to participate in a lunch' do
  let(:user) {FactoryGirl.build(:user)}
  let(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    user.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    FactoryGirl.create_list(:user, 15)
    sign_in_as(user)
  end

  it "user is not signed up by default" do
    expect(Lunch.first.users.include?(User.first)).to eql false
  end

  it "user signs on and off again" do
    click_on "Change response to 'Yes'"
    expect(page).to have_content "Change response to 'No'"
    expect(Lunch.first.users.include?(User.first)).to eql true
    click_on "Change response to 'Yes'"
    expect(Lunch.first.users.include?(User.first)).to eql false
  end

end

