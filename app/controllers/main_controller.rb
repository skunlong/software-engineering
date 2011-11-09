class MainController < ApplicationController
  
  def welcome
    @page_title = "Welcome to phoneix auction website"
    @user = nil
    if(session[:user_id] != nil)
      @user = User.find_by_id(session[:user_id])
      if(@user == nil)
        session[:user_id] = nil
      end
    end
  end

end
