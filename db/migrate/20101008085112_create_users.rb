class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :id
      t.string :username
      t.string :hash_password
      t.datetime :register_date
      t.datetime :change_date
      t.string :email
      t.boolean :state
      t.string :salt
      t.boolean :identity

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end