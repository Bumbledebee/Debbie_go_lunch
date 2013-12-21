class CreateUserLunches < ActiveRecord::Migration
  def change
    create_table :user_lunches do |t|
      t.integer :user_id, null: false
      t.integer :lunch_id, null: false

      t.timestamps
    end
  end
end
