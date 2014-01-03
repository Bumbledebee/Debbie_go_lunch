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
  # Acceptance Criteria
  #*if I specify a valid and previously registered email and password
  # I am authenticated and I gain access to the system
  # *If I specify invalid email and password, I remain unauthenticated
  # *If I am already signed in, I can't sign in again

  scenario 'an existing user specifies valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"
  end

  scenario 'a nonexistent email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in "Email", with: "nobody@example.com"
    fill_in "Password", with: 'password'
    click_button 'Sign In'
    # save_and_open_page
    expect(page).to have_content "Invalid email or password"
    #problem here: the message does not show
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'a existing email with the wrong password is denies access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: "incorrect"
    click_button 'Sign In'
    # save_and_open_page
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
    # expect(page).to have_content("You are already signed in.")
  end

end
