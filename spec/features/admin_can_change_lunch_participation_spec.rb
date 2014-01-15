require 'spec_helper'

feature 'admin can change lunch participants' do
  let(:admin) {FactoryGirl.build(:user, admin: true)}

  before :each do
    admin.save
    FactoryGirl.create(:lunch, name:"Chinese Dumplings")
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(admin)
  end

  it "admin adds someone to a group" do
    visit '/lunches/1'
    expect(page).to have_content "ADD TO LUNCH"
  end

  it "admin takes someone down from a lunch" do
    visit '/lunches/1'
    expect(page).to have_content "TAKE DOWN"
  end

end
