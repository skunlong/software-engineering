class AddCountryToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :country, :varchar
  end

  def self.down
    remove_column :users, :country
  end
end
