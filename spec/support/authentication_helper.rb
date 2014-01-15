module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'
  end

  def sign_out
    visit root_path
    click_on 'Sign Out'
  end
end



  let(:admin) {FactoryGirl.build(:user, admin: true)}
  let(:lunch) {FactoryGirl.build(:lunch, name:"Chinese Dumplings")}

  before :each do
    admin.save
    lunch.save
    FactoryGirl.create_list(:department, 4)
    FactoryGirl.create_list(:lunchgroupleader, 3)
    sign_in_as(admin)
  end
