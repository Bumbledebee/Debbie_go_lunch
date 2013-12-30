require 'spec_helper'

feature 'admin can edit users' do
  it "can edit user profiles" do
    visit '/xx'
    expect(page).to have_content "All The Events"
  end

  it "can assign others to be an admin" do
    visit '/xxx'
    expect(page).to have_content "All The Events"
  end

end
