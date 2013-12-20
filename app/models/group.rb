class Group < ActiveRecord::Base
  belongs_to :lunch

  validates_presence_of :name
  validates_numericality_of :lunch_id, :only_integer => true
end
