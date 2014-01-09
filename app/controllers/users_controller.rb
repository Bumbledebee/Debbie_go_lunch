class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :authorize_user, except: [:show, :update, :destroy]
  before_action :is_owner, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @userlunch = @user.lunches.last
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def add_me
    #this is not working yet :(
    binding.pry
    @user = User.find(params[:id])
    Lunch.last.users += @user
    Lunch.last.save
  end

  def not_me
    #this also needs a hand
    @user = User.find(params[:id])
    Lunch.last.users -= @user
    Lunch.last.save
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  protected

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def is_owner
    unless current_user == User.find(params[:id]) || current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :department_id, :lunchgroupleader_id, :optional, :admin)
  end

end
