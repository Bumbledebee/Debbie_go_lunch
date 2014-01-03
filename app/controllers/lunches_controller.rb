class LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
  end

  def show
    @lunch = Lunch.find(params[:id])
    @users = @lunch.users
    @users_not_going =  User.all.map {|x| x unless @lunch.users.include?(x) }
    @users_not_going = @users_not_going.compact
  end

  def match
    @lunch = Lunch.find(params[:id])
    @lunch.make_groups
    redirect_to lunch_groups_path(@lunch)
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

  private

  def lunch_params
    params.require(:lunch).permit(:name)
  end
end
