class UserGroup < ActiveRecord::Base
  validates_presence_of :group
  validates_presence_of :user

  belongs_to :group
  belongs_to :user
end
