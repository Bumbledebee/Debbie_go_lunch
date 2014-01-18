require 'spec_helper'

feature 'admin can create lunchgroups' do
  let(:admin) {FactoryGirl.build(:user, admin: true)}
  let(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    admin.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    FactoryGirl.create_list(:user, 15)
    sign_in_as(admin)
  end


  it "he can create a lunchgroup" do
    @lunch = Lunch.first
    @lunch.users += User.all
    @lunch.save!

    visit lunches_path
    click_on "Make lunch groups"
    expect(Lunch.first.groups.size).to eql 3
  end

  it "admin can edit the frontpage date and time for signup" do
    visit lunches_path
    click_on "Arrange participants"
    fill_in 'Name', with: "Boston Common Picnic"
    click_on 'Update Lunch'
    visit lunches_path
    expect(page).to have_content "Boston Common Picnic"
  end

end
