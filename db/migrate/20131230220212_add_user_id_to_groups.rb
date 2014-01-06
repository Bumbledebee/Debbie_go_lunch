class AddUserIdToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :user_id, :integer
  end

  def down
    remove_column :groups, :user_id
  end
end
