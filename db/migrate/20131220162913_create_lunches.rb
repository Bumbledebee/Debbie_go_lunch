class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
