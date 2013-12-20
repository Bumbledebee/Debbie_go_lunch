class UserGroup < ActiveRecord::Base
  validates_numericality_of :user_id, :only_integer => true
  validates_numericality_of :group_id, :only_integer => true

  belongs_to :group
  belongs_to :user
end
