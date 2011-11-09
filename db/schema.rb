# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101124170154) do

  create_table "admins", :force => true do |t|
    t.string   "user_name"
    t.string   "password"
    t.datetime "create_date"
    t.datetime "login_date"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_transactions", :force => true do |t|
    t.integer  "auction_id"
    t.integer  "bid_id"
    t.datetime "deal_datetime"
    t.integer  "seller_score"
    t.text     "seller_comment"
    t.integer  "buyer_score"
    t.text     "buyer_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_id"
    t.integer  "payment_id"
  end

  create_table "auctions", :force => true do |t|
    t.string   "auction_name"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "start_price"
    t.decimal  "current_price"
    t.datetime "expire"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.string   "category"
    t.boolean  "visible"
  end

  create_table "bids", :force => true do |t|
    t.integer  "auction_id"
    t.integer  "user_id"
    t.decimal  "bid_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "messages", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.boolean  "read_status"
    t.datetime "send_time"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.string   "cc_number"
    t.datetime "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", :force => true do |t|
    t.integer  "from_id",                                 :null => false
    t.integer  "to_id",                                   :null => false
    t.integer  "rank_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.string   "comment",     :default => "Good comment", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shipping_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.integer  "zipcode"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hash_password"
    t.datetime "register_date"
    t.datetime "change_date"
    t.string   "email"
    t.boolean  "state"
    t.string   "salt"
    t.boolean  "identity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.text     "city"
    t.string   "livingstate",   :limit => nil
    t.string   "country",       :limit => nil
    t.string   "zipcode",       :limit => nil
    t.decimal  "rateave"
    t.text     "comment"
    t.text     "intro"
    t.decimal  "rank",                         :precision => 3, :scale => 2, :default => 0.0
  end

end
