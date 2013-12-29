class Group < ActiveRecord::Base
  belongs_to :lunch,
    inverse_of: :groups
  belongs_to :user,
    inverse_of: :groups

  validates_presence_of :name
end
