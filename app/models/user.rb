class User < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :email, :with => /\A[^@,\s\\\/]+@[^@,\s\\\/]+\.[a-zA-Z]+\z/
  validates_presence_of :department
  validates_presence_of :lunchgroupleader

  has_many :user_lunches
  has_many :lunches,
    :through => :user_lunches
  has_many :groups,
    :through => :user_groups
  has_many :user_groups

end
