class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id, :references => "User"
      t.integer :follower_id, :references => "User"

      t.timestamps null: false
    end
  end
end
