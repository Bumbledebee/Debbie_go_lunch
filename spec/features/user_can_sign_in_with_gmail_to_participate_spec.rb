require 'spec_helper'

feature 'user can sign in with gmail' do
  it "first time visitor" do
    FactoryGirl.create(:lunch)
    visit '/'
    click_on "Sign in with Gmail"
    click_on "Authorize"
    fill_in "Name", with: "Bla bla"
    fill_in "Department", with: "aha"
    fill_in "Lunchgroupleader", with:"yes"
    check "Participate"
    expect(page).to have_content "Yeah, you are participating in the next lunch!"
    expect(Lunch.first.users).to eql [User.first]
  end

  it "second time visitor" do
    FactoryGirl.create(:user)
    visit '/user/2'
    expect(page).to have_content "Yeah, you are participating in the next lunch!"
    expect(Lunch.last.users).to eql [User.last]
  end

end
