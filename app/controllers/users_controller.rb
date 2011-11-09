class UsersController < ApplicationController

  def index
    if session[:admin_id] == nil
      redirect_to(:controller => "main", :action => "welcome")
    else
      @users = User.find(:all, :order => :username)
      respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @users }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.identity # seller
      @auctions = Auction.find_by_sql("SELECT * FROM auctions WHERE user_name = '#{@user.username}'")
    else
      @auctions = Auction.find_by_sql("SELECT a.status, a.image_url, a.auction_name, a.current_price, a.expire FROM auctions a, bids b WHERE a.id = b.auction_id AND b.user_id='#{@user.id}' AND a.current_price = b.bid_price")
    end
    respond_to do |format|
      if @user.identity # seller
        format.html { render 'show_seller.html.erb', :layout => 'auctions' }
      else
        format.html # show.html.erb
      end
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end


  def edit
    if is_login
      @user = User.find(params[:id])
    else
      redirect_to :controller => "users", :action => "login"
    end
  end

  def create
    @user = User.new(params[:user])
    @user.state = 1
    @user.register_date = Time.now

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:notice]="User #{@user.username} was successfully created. A confirmation email is sent to you."
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.deliver_welcome_email(@user)
        format.html { redirect_to(:controller => "main", :action => "welcome") }
        #    format.html { redirect_to(:controller => "auctions", :action => "index") }

        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :state => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.change_date = Time.now
    respond_to do |format|
      result = @user.update_attributes(params[:user])
      if result
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :state => :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def login
    result = {:error => ""}
    if request.post? && params[:user] != nil
      if params[:user][:username] == nil || params[:user][:username] == ""
        result[:error] = "Please input a user name!"
      elsif params[:user][:password] == nil || params[:user][:password] == ""
        result[:error] = "Please input a password!"
      else
        user = User.authenticate(params[:user][:username], params[:user][:password])

        if user == nil
          result[:error] = "User name and password don't match. Please try again!"
        else
          session[:user_id] = user[:id]
          time = Time.now
          user[:login_date] = time
          user.save
        end
      end

      if result[:error] == ""
        result[:location] = "/"
      end
      render :json => result
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => 'main', :action=>"welcome")
  end

  def personalInfo
    @user = User.find(params[:id])

  end

  def forgot_password
    if request.post?

      u= User.find_by_email(params[:email][:email])
      #UserMailer.deliver_forgotpassword_email(u)

      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:warning]  = "Couldn't send password"
      end
    end
  end

  def change_password
    if is_login
      @user = User.find_by_id(session[:user_id])
      if request.post?
        if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
          flash[:notice]="Password Changed"
          redirect_to(:controller => 'users', :action=>"show", :id => @user.id)
        end
      end
    else
      redirect_to :controller => "users", :action => "login"
    end
  end

  private

  def is_login
    if session[:user_id] == nil
      return false
    else
      @user = User.find_by_id(session[:user_id])
      if @user != nil
        return true
      else
        return false
      end
    end
  end

end

