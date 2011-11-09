class Admin < ActiveRecord::Base

  validates_presence_of :user_name, :password, :email, :create_date, :login_date
  validates_uniqueness_of :user_name, :email

  def self.authenticate(name, password)
    admin = Admin.find_by_user_name(name)
    if admin != nil
      logger.error(name)
      if admin[:password] != password
        admin = nil
      end
    end
    admin
  end
end
