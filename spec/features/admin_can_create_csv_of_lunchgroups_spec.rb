
require 'spec_helper'

feature 'admin can create csv of lunchgroups' do
  it "gets a csv that shows participants per group for one lunch" do
    visit '/xxxx'
    expect(page).to have_content "All The Events"
  end

end
