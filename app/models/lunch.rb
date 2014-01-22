class Lunch < ActiveRecord::Base
  validates_presence_of :name

  has_many :groups,
    dependent: :destroy
  has_many :user_lunches
  has_many :users,
    :through => :user_lunches

  def make_groups
    group_num = (users.count/5)
    groups = []

    group_num.times { groups << Group.new(:lunch_id => self.id, :name => self.name+" "+"#{(groups.count+1)}")}
    if groups.each {|c| c.save}
      users = self.users.sort { |a,b| a.department_id <=> b.department_id}
      users.each_with_index do |user, index|
        group_put = index % group_num
        user.groups << groups[group_put]
      end
      self.groups.map {|group| group.set_group_leader}
    else
      raise "Sorry try again"
    end
  end


end
