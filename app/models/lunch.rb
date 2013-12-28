class Lunch < ActiveRecord::Base
  validates_presence_of :name

  has_many :groups
  has_many :users,
    :through => :user_lunches
  has_many :user_lunches

end
