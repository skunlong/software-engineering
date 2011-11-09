class AddVisibleToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :visible, :boolean
  end

  def self.down
    remove_column :auctions, :visible
  end
end
