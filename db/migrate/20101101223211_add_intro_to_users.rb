class AddIntroToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :intro, :text
  end

  def self.down
    remove_column :users, :intro
  end
end
