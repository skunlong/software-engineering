# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details



#  def current_user
#    session[:user]
#  end
#
#  def redirect_to_stored
#    if return_to = session[:return_to]
#      session[:return_to]=nil
#      redirect_to(return_to)
#    else
#      redirect_to :controller=>'main', :action=>'welcome'
#    end
#  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
