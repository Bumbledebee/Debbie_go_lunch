require 'spec_helper'

feature 'user can signs up', %Q{
  As an unauthenticated user
  I want to sign up
  so that I can participate in the lunch
  } do

  #ACCEPTANCE CRITERIA
  #* I must specify a valid email address and two matching passwords

  scenario 'specifying valid and required information' do
    FactoryGirl.create(:department)
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: "John Doe"
    fill_in 'Email', with: 'user@example.com'
    fill_in "Password", with: "passwordtest", :match => :prefer_exact
    fill_in "Password Confirmation", with: "passwordtest", :match => :prefer_exact
    select "sure, no prob", from:"Lunchgroupleader"
    select "IT", from: "Department"
    fill_in "Optional", with: "Veggie"
    click_button 'Sign Up'

    expect(page).to have_content "You're in!"
    expect(page).to have_content "Sign Out"
  end

  scenario "specifying invalid information" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario "passwords not matching" do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: "password", :match => :prefer_exact
    fill_in 'Password Confirmation', with: "somethingelse", :match => :prefer_exact

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
