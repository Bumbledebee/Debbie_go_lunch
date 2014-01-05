class LunchesController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_user

  def index
    @lunches = Lunch.all
    @departments = Department.all
    @lunchgroupleaders = Lunchgroupleader.all
    @lunch = Lunch.new
  end

  def new
    @lunch = Lunch.new
  end

  def create
    @lunch = Lunch.new(lunch_params)
    if @lunch.save
      redirect_to lunches_path, notice: "Successfully created another lunch"
    else
      render :new
    end
  end

  def edit
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
    redirect_to edit_lunch_path(@lunch)
  end

  def take_down
    @lunch = Lunch.find(params[:id])
    @lunch.users -= params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to edit_lunch_path(@lunch)
  end

  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy
    redirect_to lunches_path
  end

  protected

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def lunch_params
    params.require(:lunch).permit(:name)
  end


end
