class GroupInformation < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_information.your_group.subject
  #
  def your_group(group_information)
    @info = info

    mail to: group_information.email,
      subject: "Your Lunchgroup for #{Lunch.last}"
  end
end
