class Group < ActiveRecord::Base
  belongs_to :lunch,
    inverse_of: :groups
  has_many :users,
    inverse_of: :groups

  validates_presence_of :name
end
