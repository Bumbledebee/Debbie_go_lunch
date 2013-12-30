require 'spec_helper'

feature 'admin can assign lunchgroupleader' do
  it "admin assigns someone to be lunchgroupleader" do
    visit '/lunches/1'
    expect(page).to have_content "All The Events"
  end

  it "admin unassigns someone not to be lunchgroupleader anymore" do
    visit '/lunches/1'
    expect(page).to have_content "All The Events"
  end

end

