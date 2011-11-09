require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "user_name, password, email, create_date, login_date presence" do
    admin = Admin.new
    assert !admin.save
    time = Time.new
    admin = Admin.new(:password => "test")
    assert !admin.save
    admin = Admin.new(:user_name => "admin",
                      :password => "admin",
                      :create_date => time,
                      :login_date => time,
                      :email => "haoniukun@gmail.com")
    assert admin.save, "failed to insert administrator"    
  end

  test "user uniquess" do
    time = Time.new
    admin1 = Admin.new(:user_name => "admin1",
                       :password => "admin1",
                       :create_date => time,
                       :login_date => time,
                       :email => "admin1@andrew.cmu.edu")
    assert !admin1.save
  end

  test "find user" do
    admin1 = Admin.find_by_id(1)
    assert admin1
    admin1 = Admin.find_by_user_name "admin1"
    assert admin1
  end

   test "authenticate" do
    result = Admin.authenticate "admins", "admins"
    assert result
    result = Admin.authenticate("admins", "admin1")
    assert !result
    result = Admin.authenticate("admins", "")
    assert !result
    result = Admin.authenticate("", "admins")
    assert !result
  end
end
