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

  it "user signs on and off again", type: :controller do
    visit edit_user_path(user)
    click_on "Change response to 'Yes'"
    expect(page).to have_content "Change response to 'No'"
    post add_me_user_path(user)
    expect(lunch.users.count).to eql 1
    click_on "Change response to 'Yes'"
    #need to research a javascript testing framework for ajax
    post :not_me
    expect(lunch.users.include?(user)).to eql false
  end

end

