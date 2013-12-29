class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :department, :lunchgroupleader, :optional, :admin))
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @user = User.find(params[:id])
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
