class CreateUsers < ActiveRecord::Migration
  def change
    User.reset_column_information
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :department_id, null: false
      t.string :lunchgroupleader, null: false
      t.string :optional
      t.boolean :admin, default: true

      t.timestamps
    end
  end
end
