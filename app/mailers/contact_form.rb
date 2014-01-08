class ContactForm < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_form.send_message.subject
  #
  def send_message(message)
    @message = message

    mail from: @message[:email], to: "debbieblass@gmail.com", subject: "Message from GoLunch Visitor"
  end
end
