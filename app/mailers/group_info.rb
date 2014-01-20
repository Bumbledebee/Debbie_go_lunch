class GroupInfo < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_form.send_message.subject
  #
  def send_message(user)
    @user = user
    @lunch = Lunch.find(@user.lunches.last.id)

    mail from: "admin@gmail.com", to: @user.email , subject: "Your LunchGroup"
  end
end
