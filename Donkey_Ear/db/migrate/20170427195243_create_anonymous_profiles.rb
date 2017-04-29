class CreateAnonymousProfiles < ActiveRecord::Migration
  def change
    create_table :anonymous_profiles do |t|
      t.string :name
      t.string :picture
      t.references :user

      t.timestamps null: false
    end
  end
end
