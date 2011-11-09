require 'test_helper'

class UserTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures  = true
  fixtures :users

  test "user not save" do
    user = User.new
    assert !user.save
  end

  test "user authenticate" do
    #check that we can login we a valid user
    #    assert_equal  @bob, User.authenticate("bob", "test")
    #    #wrong username
    #    assert_nil    User.authenticate("nonbob", "test")
    #    #wrong password
    #    assert_nil    User.authenticate("bob", "wrongpass")
    #    #wrong username and pass
    #    assert_nil    User.authenticate("nonbob", "wrongpass")
    result = User.authenticate("userno1", "user1")
    assert result
  end

  test "user not authenticate" do
    result = User.authenticate("userno1", "user2")
    assert !result
  end

  test "user password" do
    @user = User.find_by_id(1)
    assert @user.hash_password, "12116d74395f58577eb56959adb0c5e9c81814e6"
  end

  def test_passwordchange
    # check success
    #assert_equal @longbob, User.authenticate("longbob", "longtest")
    #change password
    @longbob.password = @longbob.password_confirmation = "nonbobpasswd"
    assert @longbob.save
    #new password works
    assert_equal @longbob, User.authenticate("longbob", "nonbobpasswd")
    #old password doesn't work anymore
    assert_nil   User.authenticate("longbob", "longtest")
    #change back again
    @longbob.password = @longbob.password_confirmation = "longtest"
    assert @longbob.save
    assert_equal @longbob, User.authenticate("longbob", "longtest")
    assert_nil   User.authenticate("longbob", "nonbobpasswd")
  end

  def test_disallowed_passwords
    #check that we can't create a user with any of the disallowed passwords
    u = User.new
    u.username = "nonbob"
    u.email = "nonbob@mcbob.com"
    #too short
    u.password = u.password_confirmation = "tiny"
    assert !u.save
    assert u.errors.invalid?('password')
    #too long
    u.password = u.password_confirmation = "hugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehugehuge"
    assert !u.save
    assert u.errors.invalid?('password')
    #empty
    u.password = u.password_confirmation = ""
    assert !u.save
    assert u.errors.invalid?('password')
    #ok
    u.password = u.password_confirmation = "bobs_secure_password"
    assert u.save
    assert u.errors.empty?
  end

  #  def test_bad_usernames
  #    #check we cant create a user with an invalid username
  #    u = User.new
  #    u.password = u.password_confirmation = "bobs_secure_password"
  #    u.email = "okbob@mcbob.com"
  #    #too short
  #    u.username = "x"
  #    assert !u.save
  #    assert u.errors.invalid?('username')
  #    #too long
  #    u.username = "hugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhugebobhug"
  #    assert !u.save
  #    assert u.errors.invalid?('username')
  #    #empty
  #    u.username = ""
  #    assert !u.save
  #    assert u.errors.invalid?('username')
  #    #ok
  #    #    u.username = "okbob"
  #    #    assert u.save
  #    #    assert u.errors.empty?
  #    #no email
  #    u.email=nil
  #    assert !u.save
  #    #assert u.errors.invalid?('email')
  #    #invalid email
  #    u.email='notavalidemail'
  #    assert !u.save
  #    #assert u.errors.invalid?('email')
  #    #ok
  #    u.email="validbob@mcbob.com"
  #    #assert u.save
  #    assert u.errors.empty?
  #  end


  def test_collision
    #check can't create new user with existing username
    u = User.new
    u.username = "existingbob"
    u.password = u.password_confirmation = "bobs_secure_password"
    assert !u.save
  end


  def test_create
    #check create works and we can authenticate after creation
    u = User.new
    u.username      = "nonexistingbob"
    u.password = u.password_confirmation = "bobs_secure_password"
    u.email="nonexistingbob@mcbob.com"
    assert_not_nil u.salt
    assert u.save
    #assert_equal 27, u.salt.length
    assert_equal u, User.authenticate(u.username, u.password)

    u = User.new(:username => "newbob", :password => "newpassword", :password_confirmation => "newpassword", :email => "newbob@mcbob.com" )
    assert_not_nil u.salt
    assert_not_nil u.password
    assert_not_nil u.hash_password
    assert u.save
    assert_equal u, User.authenticate(u.username, u.password)

  end

  def test_send_new_password
    #check user authenticates
    #   assert_equal  @bob, User.authenticate("bob", "test")
    #send new password
    sent = @bob.send_new_password
    assert_not_nil sent
    #old password no longer worked
    assert_nil User.authenticate("bob", "test")
    #email sent...
    assert_equal "Here is your new password at Phoenix Auction Site", sent.subject
    #... to bob
    assert_equal @bob.email, sent.to[0]
    assert_match Regexp.new("As you forgot your password, here is your new password at Phoenix Auction Site."), sent.body
    #can authenticate with the new password
    new_pass = $1 if Regexp.new("Your new password is (\\w+).") =~ sent.body
    assert_not_nil new_pass
    #assert_equal  @bob, User.authenticate("bob", new_pass)
  end

  def test_rand_str
    new_pass = User.random_string(10)
    assert_not_nil new_pass
    assert_equal 10, new_pass.length
  end

#  def test_sha1
#    u=User.new
#    u.username      = "nonexistingbob"
#    u.email="nonexistingbob@mcbob.com"
#    u.salt="1000"
#    u.password = u.password_confirmation = "bobs_secure_password"
#    assert u.save
#    assert_equal '6e720b4bd87005fe8406bbb90b962b5b763469e6', u.hash_password
#    assert_equal '20df6785b0a54f40a073123f09a5d98c6bd94dce', User.encrypted_password("bobs_secure_password", "1000")
#  end

  def test_protected_attributes
    #check attributes are protected
    u = User.new(:id=>999999, :salt=>"I-want-to-set-my-salt", :username => "badbob", :password => "newpassword", :password_confirmation => "newpassword", :email => "badbob@mcbob.com" )
    assert u.save
    assert_not_equal 999999, u.id
    assert_not_equal "I-want-to-set-my-salt", u.salt

    u.update_attributes(:id=>999999, :salt=>"I-want-to-set-my-salt", :username => "verybadbob")
    assert u.save
    assert_not_equal 999999, u.id
    # assert_not_equal "I-want-to-set-my-salt", u.salt
    assert_equal "verybadbob", u.username
  end
end

