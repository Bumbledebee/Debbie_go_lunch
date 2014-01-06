require 'spec_helper'

feature 'admin can change group participants' do

  before :each do
    visit '/lunches/1/groups'
    check "Annie Lopez"
    click_button "Add to Group 3"
  end

  it "admin adds someone to a group" do
    expect(Group.where(:id=>3)).to include?(User.where(:name => "Annie Lopez"))
  end

  it "admin takes someone down from a group" do
    expect(Group.where(:id=>1)).to_not include?(User.where(:name => "Annie Lopez"))
  end

end

