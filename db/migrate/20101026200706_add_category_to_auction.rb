class AddCategoryToAuction < ActiveRecord::Migration
  def self.up
    add_column :auctions, :category, :string
  end

  def self.down
    remove_column :auctions, :category
  end
end


