class User < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :department
  validates_presence_of :lunchgroupleader

  has_many :user_lunches
  has_many :lunches,
    :through => :user_lunches

  has_many :user_groups
  has_many :groups,
    :through => :user_groups

  def self.get_names(search)
    User.all.map{|x| x.name if x.name.include?(search)}.compact
  end

end
