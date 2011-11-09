class AddRateaveToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :rateave, :decimal
  end

  def self.down
    remove_column :users, :rateave
  end
end
