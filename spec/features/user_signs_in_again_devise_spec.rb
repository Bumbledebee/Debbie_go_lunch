require 'spec_helper'

feature 'user signs ins', %Q{
  As a user
  I want to sign in
  so I can use the functionalitites provided
} do
  before :each do
    Lunchgroupleader.create(name:"sure, no prob")
    Lunchgroupleader.create(name:"only if neeed")
    Lunchgroupleader.create(name:"not this time")
    Department.create(name:"Finance")
    Lunch.create(name:"Chinese Dumplings")
  end

  scenario 'an existing user specifies valid email and password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"
  end

  scenario 'a nonexistent email and password is supplied' do
    visit new_user_session_path
    fill_in "Email", with: "nobody@example.com"
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    expect(page).to have_content "Invalid email or password"
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'a existing email with the wrong password is denies access' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "incorrect"
    click_button 'Sign In'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button 'Sign In'
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content('Sign In')
    visit new_user_session_path
  end

end
