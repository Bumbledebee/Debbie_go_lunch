class Lunch < ActiveRecord::Base
  validates_presence_of :name

  has_many :groups
  has_many :users,
    :through => :user_lunches
  has_many :user_lunches


  # def make_groups
  #   groups = []
  #   users = []
  #   x = User.all.where(lunch_id = @lunch.id) / 5
  #   groups << x.times Group.new(:lunch_id => @lunch.id)
  #   users <<
  # end
end
