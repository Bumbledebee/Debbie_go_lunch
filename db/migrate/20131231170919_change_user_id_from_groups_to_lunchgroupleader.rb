class ChangeUserIdFromGroupsToLunchgroupleader < ActiveRecord::Migration
  def up
    remove_column :groups, :user_id
    add_column :groups, :lunchgroupleader, :integer
  end

  def down
    remove_column :groups, :lunchgroupleader
    add_column :groups, :user_id, :integer
  end
end
