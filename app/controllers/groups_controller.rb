class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_user, except: [:show]

  def show
    @user = current_user
    @lunch = Lunch.find(params[:lunch_id])
    @users = @lunch.users
    @groups = @lunch.groups
  end

  def change_groups
    @user = current_user
    @lunch = Lunch.find(params[:lunch_id])
    @users = @lunch.users
    @groups = @lunch.groups
  end

  def csv
    @lunch = Lunch.find(params[:lunch_id])
    @users = @lunch.users
    @groups = @lunch.groups
  end

  def email
    @lunch = Lunch.find(params[:lunch_id])
    @lunch.users.each do |user|
      GroupInfo.send_message(user).deliver
    end
    redirect_to lunch_groups_path, notice:"Message sent successfully"
  end

  protected

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
