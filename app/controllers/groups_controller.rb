class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def show
    # needs to be improved
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
  end


end
