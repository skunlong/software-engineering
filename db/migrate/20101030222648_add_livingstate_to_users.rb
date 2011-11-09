class AddLivingstateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :livingstate, :varchar
  end

  def self.down
    remove_column :users, :livingstate
  end
end
