class GroupInfo < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_form.send_message.subject
  #
  def send_message(id)
    @id = id.to_i
    @lunch = Lunch.find(@id)

    @lunch.groups.each do|group|
      group.users.each do |user|
        mail from: "admin@gmail.com", to: user.email , subject: "Your LunchGroup"
      end
    end
  end
end
