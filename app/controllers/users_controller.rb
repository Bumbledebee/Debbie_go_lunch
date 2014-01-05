class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :authorize_user, except: [:index, :show]
  # before_filter :is_owner, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :department_id, :lunchgroupleader_id, :optional, :admin)
  end

  # def authorize_user
  #   unless user_signed_in? and current_user.admin?
  #     raise ActionController::RoutingError.new('Not Found')
  #   end
  # end

  # def is_owner
  #   if current_user && current_user != User.find(params[:id]).user
  #     redirect_to root_path, notice: "You can only edit your own profile"
  #   end
  # end
end
