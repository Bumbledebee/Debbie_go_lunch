class Group < ActiveRecord::Base

  belongs_to :lunch
  has_many :user_groups
  has_many :users,
    :through => :user_groups

  validates_presence_of :name

  # private
  def set_group_leader
    if users.where(lunchgroupleader_id:1).any?
      self.lunchgroupleader = users.where(lunchgroupleader_id:1).last.id
      save
    elsif users.where(lunchgroupleader_id:2).any?
      self.lunchgroupleader = users.where(lunchgroupleader_id:2).first.id
      save
    else
      self.lunchgroupleader = users.last.id
      save
    end
  end
end
