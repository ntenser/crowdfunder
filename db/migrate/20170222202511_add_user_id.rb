class AddUserId < ActiveRecord::Migration[5.0]
  def change
    change_table :projects do |t|
      t.integer :user_id
    end
  end
end
