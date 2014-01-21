class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_action :authorize_user, except: [:edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if current_user.admin?
        redirect_to users_path
      else
        redirect_to edit_user_path
      end
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def add_me
    @lunch = Lunch.last
    @user = User.find(params[:id])
    @lunch.users += [@user]
    @lunch.save
    render success: true, json: {data: 'Hello'}
  end

  def not_me
    @lunch = Lunch.last
    @user = User.find(params[:id])
    @lunch.users -= [@user]
    @lunch.save
    render success: true, json: {data: 'Hello'}
  end

  def change_group
    @lunch = Lunch.find(params[:id])
    @group = Group.find(params[:id])
    @user = User.find(params[:id])
    old_group = Group.find(@user.groups.last.id)
    old_group.users -= @user
    @group.users += @user
    render success: true, json: {data: 'Hello'}
  end


  def destroy
    @user = User.find(params[:id])
    if @user.lunches.count >0
      redirect_to users_path, notice: "Sorry you cannot delete this user, as he is part of a lunchgroup"
    else
      @user.destroy
      redirect_to users_path
    end
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
