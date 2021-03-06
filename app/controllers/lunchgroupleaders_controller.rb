class LunchgroupleadersController < ApplicationController
  before_action :authorize_user

  def new
    @lunchgroupleader = Lunchgroupleader.new
    @lunchgroupleaders = Lunchgroupleader.all
  end

  def create
    @lunchgroupleader = Lunchgroupleader.create(params.require(:lunchgroupleader).permit(:name))
    if @lunchgroupleader.save
      redirect_to lunches_path, notice: "successfully updated the lunchgroupleader options"
    else
      render :new, notice: "Please try again"
    end
  end

  def edit
    @lunchgroupleader = Lunchgroupleader.find(params[:id])
  end

  def update
    @lunchgroupleader = Lunchgroupleader.find(params[:id])
    if @lunchgroupleader.save
      redirect_to lunches_path, notice: "successfully updated the lunchgroupleader options"
    else
      render :new, notice: "Please try again"
    end
  end

  protected

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
