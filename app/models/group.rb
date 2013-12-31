class Group < ActiveRecord::Base

  belongs_to :lunch
  has_many :user_groups
  has_many :users,
    :through => :user_groups

  validates_presence_of :name

  # private
  def set_group_leader
    if users.where(lunchgroupleader: "sure, no prob").any?
      self.lunchgroupleader = users.where(lunchgroupleader: "sure, no prob").last.id
      save
    elsif users.where(lunchgroupleader: "only if needed").any?
      self.lunchgroupleader = users.where(lunchgroupleader: "only if needed").first.id
      save
    else
      self.lunchgroupleader = users.last.id
      save
    end
  end
end
