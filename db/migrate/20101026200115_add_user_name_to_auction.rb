class AddUserNameToAuction < ActiveRecord::Migration
  def self.up
     add_column :auctions, :user_name, :string
  end

  def self.down
    remove_column :auctions, :user_name
  end
end

