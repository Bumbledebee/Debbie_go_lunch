require 'spec_helper'

feature 'admin can change lunch participants' do
  it "admin adds someone to a group" do
    visit '/lunches/1'
    expect(page).to have_content "All The Events"
  end

  it "admin takes someone down from a lunch" do
    visit '/lunches/1'
    expect(page).to have_content "All The Events"
  end

end
