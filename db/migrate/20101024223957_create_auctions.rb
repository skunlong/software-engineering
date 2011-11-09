class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table  :auctions do |t|
      t.string    :auction_name
      t.text      :description
      t.string    :image_url
      t.decimal   :start_price
      t.decimal   :current_price
      t.datetime  :expire
      t.boolean   :status

      t.timestamps
    end
  end

  def self.down
    drop_table :auctions
  end
end
