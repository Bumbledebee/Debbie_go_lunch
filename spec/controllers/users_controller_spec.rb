require 'spec_helper'

describe 'Post #add_me' do
  let!(:user) {FactoryGirl.build(:user)}
  let!(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    user.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    FactoryGirl.create_list(:user, 15)
  end

  context 'when a user signed up' do
    it "he is not part of the lunch by default" do
      expect(Lunch.first.users.include?(User.first)).to eql false
    end
  end

  context 'when a user signed up' do
    it "user signs on and off again" do
      binding.pry
      post add_me_user_path(user)
      expect(lunch.users.count).to eql 1
      click_on "Change response to 'Yes'"
      post :not_me
      expect(lunch.users.include?(user)).to eql false
    end
  end

end
