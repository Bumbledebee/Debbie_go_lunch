require 'spec_helper'

feature 'user can signs up', %Q{
  As an unauthenticated user
  I want to sign up
  so that I can participate in the lunch
  } do

  #ACCEPTANCE CRITERIA
  #* I must specify a valid email address and two matching passwords

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: 'user@example.com'
    fill_in "Password", with: 'password'
    fill_in "Password Confirmation", with: 'password'
    clikc_button 'Sign Up'

    expect(page).to have_content "Yo're in!"
    expect(page).to have_content "Sign Out"
  end

  scenario "specifying invalid information" do
  end

  scenario "passwords not matching" do
  end

end
