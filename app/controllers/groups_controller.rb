class GroupsController < ApplicationController

  def index
    @lunch = Lunch.find(params[:lunch_id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def show
    # we edit and index show all groups at the same time
    @lunch = Lunch.find(params[:lunch_id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def csv
    @lunch = Lunch.find(params[:lunch_id])
    #method for getting a csv of @lunch.users sorted by lunchgroup
  end

  def email
    @lunch = Lunch.find(params[:lunch_id])
  end


end
