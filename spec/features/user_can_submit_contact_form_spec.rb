require 'spec_helper'

feature 'submit contact form', %Q(
  As a site visitor
  I want to contact the owner of the site
  So that I can ask questions or make comments about the site
) do

  # Acceptance Criteria:

  # *I can optionally define anemail address
  # *I must specify a message

  scenario 'user fills in page with valid attributes' do

    Lunch.create!(name:"Chinese Dumplings")
    Lunch.create!(name:"Picnic Boston Common")
    #clear out emails
    ActionMailer::Base.deliveries = []
    visit root_path
    click_link 'Contact Me'
    fill_in "Email", with:"hello@gmail.com"
    fill_in "Your Message here", with:"Nice Site!"
    click_on "Create Message"

    expect(page).to have_content "Message successfully sent"
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Message from GoLunch Visitor')
    expect(last_email).to deliver_to("debbieblass@gmail.com")
    expect(last_email).to have_body_text("Nice Site!")
  end

  scenario 'user does not fill in all attributes' do
  end
end
