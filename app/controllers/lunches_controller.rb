class LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
  end

  def groups
    @lunch = Lunch.find(params[:id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def show
    @lunch = Lunch.find(params[:id])
    @users = @lunch.users
    @users_not_going =  User.all.map {|x| x unless @lunch.users.include?(x) }
    @users_not_going = @users_not_going.compact
  end

  def match
    @lunch = Lunch.find(params[:id])
    #undefined method `make_groups' for #<LunchesController:0x007ffb2455ff38> why?
    #I defined it in the model
    make_groups(@lunch)
    redirect_to groups_lunch_path(@lunch)
  end

  def update_status
    @lunch = Lunch.find(params[:id])
    @lunch.users += params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to @lunch
  end

  def take_down
    @lunch = Lunch.find(params[:id])
    @lunch.users -= params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to @lunch
  end

  def change_group
    @user = User.find(params[:id])
    @old_group = @user.groups.last
    @group = Group.find(params[:id])
    #undefined method `make_groups' for #<LunchesController:0x007ffb2459fca0> why ?
    #I defined it in the model
    change_groups(@user, @old_group, @group)
  end

  private

  def lunch_params
    params.require(:lunch).permit(:name)
  end
end
