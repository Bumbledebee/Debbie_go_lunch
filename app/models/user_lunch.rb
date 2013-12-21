class UserLunch < ActiveRecord::Base
  validates_numericality_of :user_id, only_integer: true
  validates_numericality_of :lunch_id, only_integer: true

  belongs_to :lunch
  belongs_to :user
end
