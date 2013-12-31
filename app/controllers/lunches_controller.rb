class LunchesController < ApplicationController

  def index
    @lunches = Lunch.all
  end

  def groups
    @lunch = Lunch.find(params[:id])
    group_num = (@lunch.users.count/5)+1
    @users = @lunch.users
    @groups = @lunch.groups[0...group_num]
  end

  def show
    @lunch = Lunch.find(params[:id])
    @users = User.all
  end

  def match
    @lunch = Lunch.find(params[:id])
    group_num = (@lunch.users.count/5)+1
    groups = []
    group_num.times { groups << Group.create!(:lunch_id => @lunch.id, :name => @lunch.name+'group')}
    users = @lunch.users.sort { |a,b| a.department_id <=> b.department_id}
    users.each_with_index do |user, index|
      group_put = index % group_num
      user.groups << groups[group_put]
    end
    redirect_to groups_lunch_path(@lunch)
  end

  def update_status
    @lunch = Lunch.find(params[:id])
    @lunch.users += params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to @lunch
  end

  def take_down
    @lunch = Lunch.find(params[:id])
    @lunch.users -= params[:lunch][:users].map{|x| User.find(x.to_i)}
    @lunch.save!
    redirect_to @lunch
  end

  private

  def lunch_params
    params.require(:lunch).permit(:name)
  end
end
