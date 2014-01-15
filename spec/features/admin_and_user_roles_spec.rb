require 'spec_helper'

feature 'admin features' do
  let(:user) {FactoryGirl.build(:user)}
  let(:admin) {FactoryGirl.build(:user, admin: true)}

  before :each do
    user.save
    admin.save
    FactoryGirl.create(:lunch, name:"Chinese Dumplings")
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
  end

  it "admin can edit all users" do
    sign_in_as(admin)
    visit users_path
    click_on 'edit'
    expect(page).to have_content "Update User"
  end

  it "admin can add new lunches" do
    visit new_lunch_path
    expect(page).to have_content "Create Lunch"
  end

  it "can see the edit page for lunchgroups" do
    visit change_groups_lunch_groups_path
    expect(page).to have_content "Make "
  end

  it "admin can edit all departments" do
    visit new_department_path
  end

  it "admin can edit the lunchgroupleader options" do
    visit lunches_path
  end

  it "admin can edit participants of a lunch" do
    visit edit_lunch_path(Lunch.first)
  end

  it "admin can make lunch groups for one specific lunch" do
    visit lunches_path
    expect(page).to have_content "Make Groups"
  end

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
end
