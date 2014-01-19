class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_user, except: [:show]

  def show
    @lunch = Lunch.find(params[:lunch_id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def change_groups
    # we edit and index show all groups at the same time
    @lunch = Lunch.find(params[:lunch_id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def csv
    @lunch = Lunch.find(params[:lunch_id])
    @users = @lunch.users
    @groups = @lunch.groups
  end

  def email
    @lunch = Lunch.find(params[:lunch_id])
    @lunch.users.each do |user|
      GroupInfo.send_message(params["lunch_id"]).deliver
    end
    redirect_to lunches_path, notice:"Message sent successfully "
  end

  protected

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
