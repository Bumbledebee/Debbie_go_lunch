class DepartmentsController < ApplicationController
  before_action :authorize_user

  def new
    @department = Department.new
    @departments = Department.all
  end

  def create
    @department = Department.create(params.require(:department).permit(:name))
    if @department.save
      redirect_to lunches_path, notice: "successfully updated the departments"
    else
      render :new, notice: "Please try again"
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.save
      redirect_to lunches_path, notice: "successfully updated the departments"
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
