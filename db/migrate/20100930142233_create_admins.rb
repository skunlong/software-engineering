class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.integer :id
      t.string :user_name
      t.string :password
      t.datetime :create_date
      t.datetime :login_date
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
