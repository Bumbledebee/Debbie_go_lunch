class ContactMe < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_information.your_group.subject
  #
  def message(message)
    @message = message

    mail to: contact_me.email,
      subject: "Message from #{}"
  end
end
