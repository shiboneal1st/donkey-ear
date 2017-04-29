class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user1_id, :references => "User"
      t.integer :user2_id, :references => "User"

      t.timestamps null: false
    end
  end
end
