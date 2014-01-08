class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ContactForm.send_message(message_params).deliver
      redirect_to root_path, notice:"Message successfully sent"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:email,:body)
  end
end