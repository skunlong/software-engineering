class AddRankToUsers < ActiveRecord::Migration
#average rank in the users table
  def self.up
    add_column :users, :rank, :decimal, :precision => 3, :scale => 2, :default => 0
  end

  def self.down
    remove_column :users, :rank
  end
end
