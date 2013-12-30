require 'spec_helper'

feature 'admin can make groups' do
  it "he can make groups" do
    visit '/xx'
    expect(page).to have_content "All The Events"
  end

  it "after he made groups he can only see groups" do
    visit '/xxx'
    expect(page).to have_content "All The Events"
  end

end
