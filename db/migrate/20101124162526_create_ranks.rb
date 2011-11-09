class CreateRanks < ActiveRecord::Migration
  def self.up
    create_table :ranks do |t|
      t.integer :id
      t.integer :from_id, :null => false
      t.integer :to_id, :null => false
      t.integer :rank_number

      t.timestamps
    end
  end

  def self.down
    drop_table :ranks
  end
end
