class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :id
      t.integer :from_id
      t.integer :to_id
      t.boolean :read_status
      t.datetime :send_time
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
