class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(entry_params)
      redirect_to user_index_path
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(entry_params)
    if @user.save(entry_params)
      redirect_to user_index_path
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:user).permit(:name, :email, :department, :lunchgroupleader, :optional, :admin)
  end

end

