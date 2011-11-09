class AddCommentToRanks < ActiveRecord::Migration
  def self.up
    add_column :ranks, :comment, :string, :default => "Good comment", :null => false
  end

  def self.down
    remove_column :ranks, :comment
  end
end
