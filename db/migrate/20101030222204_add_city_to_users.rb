class AddCityToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :city, :text
  end

  def self.down
    remove_column :users, :city
  end
end
