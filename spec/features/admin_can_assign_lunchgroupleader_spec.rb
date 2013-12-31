require 'spec_helper'
before :each do
  FactoryGirl.create(:lunch :with_users)
end

feature 'admin can assign lunchgroupleader' do
  it "admin assigns someone to be lunchgroupleader" do
    visit '/lunches/'
    click_button 'Make lunch groups'
    visit '/lunches/1/groups'
    # selects someone as lunchgroupleader from a dropbox

  end


end

