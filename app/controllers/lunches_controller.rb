class LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
  end

  def show
    @lunch = Lunch.find(params[:id])
    @users = User.all
  end

  def match
    @lunch = Lunch.find(params[:id])
  end

  def update_status
    @lunch = Lunch.find(params[:id])
    @lunch.users += params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to @lunch
  end

  private

  def lunch_params
    params.require(:lunch).permit(:name)
  end

end
