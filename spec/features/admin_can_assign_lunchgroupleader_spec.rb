require 'spec_helper'
before :each do
  FactoryGirl.create(:lunch, :with_users)
end

feature 'admin can assign lunchgroupleader' do
  it "admin assigns someone to be lunchgroupleader" do
    visit '/lunches/'
    click_on 'Make lunch groups'
    visit '/lunches/1/groups'
    select("Annie Lopez", :from => 'Select Box')
    expect(Group.where(id:1).user_id).to eql User.where(:name => "Annie Lopez").id
  end


end

