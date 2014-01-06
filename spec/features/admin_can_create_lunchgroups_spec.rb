require 'spec_helper'

feature 'admin can create lunchgroups' do
  it "he can create a lunchgroup" do
    visit '/xx'
    expect(page).to have_content "All The Events"
  end

  it "admin can edit the frontpage date and time for signup" do
    visit '/xxx'
    expect(page).to have_content "All The Events"
  end

end
