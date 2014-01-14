require 'spec_helper'

feature 'admin features' do
  before :each do
    let(:user) {FactoryGirl.build(:user)}
    let(:admin) {FactoryGirl.build(:admin)}
    sign_in_as(admin)
    FactoryGirl.create(:lunch, name:"Chinese Dumplings")
    FactoryGirl.create_list(:departments, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
  end

  it "admin can edit all users" do
    visit users_path
    click_on 'edit'
    expect(page).to have_content "Update User"
  end

  it "admin can add new lunches" do
    visit new_lunches_path
    expect(page).to have_content "Create Lunch"
  end

  it "can see the edit page for lunchgroups" do
    visit change_groups_lunch_groups_path
    expect(page).to have_content "Make "
  end

  it "admin can edit all departments" do
    visit departments_path
  end

  it "admin can edit the lunchgroupleader options" do
    visit lunches_path
  end

  it "admin can edit participants of a lunch" do
    visit edit_lunch_path
  end

  it "admin can make lunch groups for one specific lunch" do
    visit lunches_path
    expect(page).to have_content "Make Groups"
  end

Warden.test_reset!
end


feature 'user features' do

  it "user can edit his own profile" do

  end

  it "user cannot edit other peoples' profiles"do
  end

  it "user cannot make groups"do
  end

  it "user cannot see, edit and add new lunches" do
    visit '/lunches/'
  end
 Warden.test_reset!
end

