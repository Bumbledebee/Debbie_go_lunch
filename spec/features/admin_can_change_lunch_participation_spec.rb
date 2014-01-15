require 'spec_helper'

feature 'admin can change lunch participants' do
  let(:admin) {FactoryGirl.build(:user, admin: true)}
  let(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    admin.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(admin)
  end

  it "admin adds someone to a group" do
    visit edit_lunch_path(Lunch.last)
    find_button("ADD TO LUNCH")
    find(:css, "#user-checkboxes input:nth-child(1)").click
    # find(:xpath, "//input[@value='1']").set(true)
    # find(:css, "#lunch_users_[value='1']").set(true)
    click_button "ADD TO LUNCH"
    expect(Lunch.first.users.include?(User.first)).to eql true
  end

  it "admin takes someone down from a lunch" do
    visit edit_lunch_path(Lunch.last)
    expect(page).to have_content "TAKE DOWN"
  end

end
