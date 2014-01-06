class CreateLunchgroupleader < ActiveRecord::Migration
  def change
    create_table :lunchgroupleaders do |t|
      t.string :name
    end
  end
end
