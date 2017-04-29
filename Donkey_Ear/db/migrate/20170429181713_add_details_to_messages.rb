class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :creator, :integer, :references => "User"
    add_column :messages, :receiptor, :integer, :references => "User"
  end
end
