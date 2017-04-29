class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :limit => 140
      t.references :user, index: true, foreign_key: true
      t.boolean :isAnonymous

      t.timestamps null: false
    end
  end
end