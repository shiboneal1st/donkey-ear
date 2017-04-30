class RenameCreatorToCreatorId < ActiveRecord::Migration
  def change
    rename_column :messages, :creator, :creator_id
    rename_column :messages, :receiptor, :receiptor_id
  end
end
