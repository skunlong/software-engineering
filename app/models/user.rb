require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :transaction
  has_many :bid
  has_many :payment
  has_many :shipping_andress
  has_many :auction
  has_many :message
  
  validates_presence_of :username, :salt, :password
  validates_uniqueness_of :username
  validates_length_of :username, :within => 6..20
  # attr_accessor :password_confirmation
  validates_length_of :password, :within => 6..20
  validates_confirmation_of :password
  validate :password_non_blank
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "Invalid email"
  attr_protected :id, :salt
  
  def self.authenticate(username,password)
    user=User.find_by_username(username)
    if user != nil
      expected_password = encrypted_password(password,user.salt)
      if user.hash_password != expected_password
        user=nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password=pwd
    return if pwd.blank?
    creat_new_salt
    self.hash_password=User.encrypted_password(self.password,self.salt)
  end


  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def send_new_password
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    UserMailer.deliver_forgotpassword_email(self.email, self.username, new_pass)
  end

  private
  def password_non_blank
    errors.add(:password, "missing password") if hash_password.blank?
  end

  def creat_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password,salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end




end
