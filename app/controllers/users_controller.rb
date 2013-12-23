class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_index_path
  end

  def index
    @users = User.all
  end

  def create
    render json: {names: User.get_names(params[:loved])}
  end

end
