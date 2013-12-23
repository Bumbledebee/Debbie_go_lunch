class UserLunch < ActiveRecord::Base
  validates_presence_of :lunch
  validates_presence_of :user

  belongs_to :lunch
  belongs_to :user
end
