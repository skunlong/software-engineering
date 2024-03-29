# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# you can normally use sendmail on Mac or Linux
# config.action_mailer.delivery_method = :sendmail
# or setup to use your ISP's mail server: omit authentication
# details if they don't require them.
 config.action_mailer.delivery_method = :smtp
 config.action_mailer.smtp_settings = {
 :address => "smtp.gmail.com",
 :port => 587,
# :domain => "gmail.com",
 :authentication => :plain,
# :authentication => :login,
 :user_name => "phoenixsoftwareengineering@gmail.com",
 :password => "phoenixsoft",
 :enable_starttls_auto => true
 }

# ActionMailer::Base.register_template_extension('haml')