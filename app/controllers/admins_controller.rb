class AdminsController < ApplicationController
  @show_admin_view = "admin_show"
  
  def index
    @page_title = "Admin Login"
    if session[:admin_id] != nil && Admin.find_by_id(session[:admin_id]) != nil
      @page_title = "Admin function"
      redirect_to :action => "admin_show"
    else
      respond_to do |format|
        format.html
      end
    end
  end
  
  def login
    result = {:error => ""}
    if request.post? && params[:admin] != nil
      if params[:admin][:user_name] == nil || params[:admin][:user_name] == ""
        result[:error] = "Please input a user name!"
      elsif params[:admin][:password] == nil || params[:admin][:password] == ""
        result[:error] = "Please input a password!"
      else
        admin = Admin.authenticate(params[:admin][:user_name], params[:admin][:password])
        
        if admin == nil
          result[:error] = "User name and password don't match. Please try again!"
        else
          session[:admin_id] = admin[:id]
          time = Time.now
          admin[:login_date] = time
          admin.save
        end
      end

      if result[:error] == ""
        result[:location] = url_for :controller=>"admins", :action=>"admin_show"
      end
      render :json => result
    end
  end

  def admin_show
    if session[:admin_id] == nil
      redirect_to :action => "index"
    else
    @admin = Admin.find(session[:admin_id])
    @user = User.find(:all)
    @page_title = "Admin function"
    end
  end

  def activeuser
    @user = User.find(params[:id])
    ch = "1"
    @user[:state] = ch
    @user.save
  end


  def deactiveuser
    @user = User.find(params[:id])
    ch = "0"
    @user[:state] = ch
    @user.save
    if @user.identity == true
      @auctions = Auction.find_all_by_user_name(@user.username)
      @auctions.each do |auction|
        auction.status = 0
      end
    end
  end


  def logout
    session[:admin_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => "admins", :action => "index" )
  end

  def activeall
    User.update_all("state = 1")
    redirect_to(:controller => "admins", :action => "admin_show" )
  end

  def deactiveall
    User.update_all("state = 0")
    redirect_to(:controller => "admins", :action => "admin_show" )
  end

  def showmessages
    @message = Message.find:all
     respond_to do |format| format.html
    end
  end
  
end


