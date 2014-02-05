require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'user can decide to participate in a lunch' do
  let(:user) {FactoryGirl.create(:user, admin: true)}
  let(:lunch) {FactoryGirl.create(:lunch, name:"Chinese Dumplings")}

  before :each do
    user.save
    current_user = user
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    FactoryGirl.create_list(:user, 15)
  end

  it "user is not signed up by default" do
    expect(Lunch.first.users.include?(User.first)).to eql false
  end

  it "user signs on and off again", :js => true do
    current_user = user
    login_as(current_user, :scope => :user)
    visit edit_user_path(current_user)
    click_button "Change response to 'Yes'"
    wait_for_ajax
    expect(page).to have_content "Change response to 'No'"
    expect(Lunch.last.users.count).to eql 1
    click_on "Change response to 'No'"
    wait_for_ajax
    expect(Lunch.last.users.include?(@user)).to eql false
  end
Warden.test_reset!
end

