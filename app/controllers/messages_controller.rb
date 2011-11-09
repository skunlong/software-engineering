class MessagesController < ApplicationController
  def create
    if is_login
      @user = User.find_by_sql "SELECT * FROM users WHERE username = '#{params[:message][:receiver_name]}'"
      if @user == nil || @user.length == 0
        flash[:notice] = "Cannot find the receiver"
        @message = { 
                     :receiver_name => params[:message][:receiver_name],
                     :title => params[:message][:title],
                     :content => params[:message][:content]
                   }
        @user = User.find_by_id(session[:user_id])
        render :action => "new"
      else
        @user = @user[0]
        @message = Message.new
        @message.from_id = session[:user_id]
        @message.to_id = @user.id
        @message.title = params[:message][:title]
        @message.content = params[:message][:content]
        @message.send_time = Time.now
        @message.read_status = false
        @user = User.find_by_id(session[:user_id])
        if @message.save
          redirect_to :action => "index"
        else
          flash[:notice] = @message.errors.full_messages
          render :action => "new"
        end
      end
    else
      redirect_to :controller => "users", :action => "login"
    end
  end

  def index
    if is_login
      @messages = Message.find_message_and_user_name_by_id session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @message_count = Message.find_by_sql("SELECT COUNT(id) AS message_count FROM messages WHERE to_id = #{@user.id}")
      @message_count = @message_count[0]
      render :action=>"index"
    else
      login
    end
  end

  def show
      if is_login
        @message = Message.find_by_id(params[:id])
        @receiver = User.find_by_id(session[:user_id])
        @sender = User.find_by_id(@message.from_id)
        @message_count = Message.find_by_sql("SELECT COUNT(id) AS message_count FROM messages WHERE to_id = #{@receiver.id}")
        @message_count = @message_count[0]
        if @message.to_id == session[:user_id]
          respond_to do |format|
            format.html
          end
        else
          redirect_to :controller => "main", :action => "welcome"
        end
      else
        login
      end
  end

  def new
    if is_login
      @message = Message.new
      @user = User.find_by_id(session[:user_id])
      @sender = nil
      if params[:to_ID] != nil
        @sender = User.find_by_id(params[:to_ID])
      end
      respond_to do |format|
        format.html
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

  def login
    flash[:notice] = "Please Log in"
    redirect_to :controller => :users, :action => :login
  end
  
end
