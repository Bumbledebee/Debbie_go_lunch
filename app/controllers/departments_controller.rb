class DepartmentsController < ApplicationController

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

end
