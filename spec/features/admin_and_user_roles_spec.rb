require 'spec_helper'

feature 'admin features' do
  let(:admin) {FactoryGirl.build(:user, admin: true)}

  before :each do
    admin.save
    FactoryGirl.create(:lunch, name:"Chinese Dumplings")
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(admin)
  end

  it "admin can edit all users" do
    visit users_path
    expect(page).to have_content 'edit'
  end

  it "admin can add new lunches" do
    visit lunches_path
    find_button('Create Lunch')
  end

  it "admin can edit all departments" do
    visit new_department_path
  end

  it "admin can edit the lunchgroupleader options" do
    visit new_lunchgroupleader_path
  end

  it "admin can edit participants of a lunch" do
    visit edit_lunch_path(Lunch.first)
  end

  it "admin can make lunch groups for one specific lunch" do
    visit lunches_path
    expect(page).to have_content "Make lunch groups"
  end

end

feature 'user features' do
  let(:user) {FactoryGirl.build(:user, name: "John")}

  before :each do
    user.save
    FactoryGirl.create(:lunch, name:"Chinese Dumplings")
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(user)
  end

  it "user can edit his own profile" do
    visit edit_user_path(user)
    fill_in 'Name', with: "Sam"
    click_on('Update User')
    visit edit_user_path(user)
    expect(user.name).to eql "Sam"
  end

  it "user cannot edit other peoples' profiles" do
    expect {visit 'users/105/edit'}.to raise_error
  end

  it "user cannot see, edit and add new lunches" do
    expect {visit 'lunches/'}.to raise_error
  end
end
