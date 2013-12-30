require 'spec_helper'
before :each do
  FactoryGirl.create(:lunch :with_users)
end

feature 'admin can assign lunchgroupleader' do
  it "admin assigns someone to be lunchgroupleader" do
    visit '/lunches/'
    click_button 'Make lunch groups'
    visit '/lunches/1/groups'


  end

  it "admin unassigns someone not to be lunchgroupleader anymore" do
    visit '/lunches/1'
    expect(page).to have_content "All The Events"
  end

end

