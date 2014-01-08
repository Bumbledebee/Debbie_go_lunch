class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email, null:false
      t.text :body, null:false
    end
  end
end
