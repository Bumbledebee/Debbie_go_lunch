require 'spec_helper'

feature 'admin can change lunch participants' do
  let(:admin) {FactoryGirl.build(:user, admin: true)}
  let(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    admin.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(admin)
  end

  it "admin adds someone to a group and takes him down again" do
    visit edit_lunch_path(Lunch.last)
    not_going = page.all('table.not-going')
    within(not_going[0]) do
      check('lunch[users][]')
    end
    click_on 'ADD TO LUNCH'
    expect(Lunch.first.users.include?(User.first)).to eql true
    going = page.all('table.going')
    within(going[0]) do
      check('lunch[users][]')
    end
    click_on "TAKE DOWN"
    expect(Lunch.first.users.include?(User.first)).to eql false
  end

end
