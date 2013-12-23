class Group < ActiveRecord::Base
  belongs_to :lunch

  validates_presence_of :name
end
