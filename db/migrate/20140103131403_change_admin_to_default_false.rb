class ChangeAdminToDefaultFalse < ActiveRecord::Migration
  def up
    change_column :users, :admin, :boolean, default:false
    remove_column :users, :lunchgroupleader
    add_column :users, :lunchgroupleader_id, :integer
  end

  def down
    remove_column :users, :lunchgroupleader_id
    add_column :users, :lunchgroupleader, :string
    change_column :users, :admin, :boolean, default:true
  end
end
