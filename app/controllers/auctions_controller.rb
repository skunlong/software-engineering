require 'delayed_job'

class AuctionsController < ApplicationController

  # GET /auctions
  # GET /auctions.xml
  def index
    @user = User.find_by_id(session[:user_id])
    @auctions = Auction.find_by_sql("SELECT a.id, a.user_name, a.auction_name, a.description, a.image_url, a.start_price, a.current_price, a.status, a.created_at, a.expire, a.category, a.visible, u.id AS seller_id FROM auctions a, users u WHERE a.user_name = u.username")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @auctions }
    end
  end

  # GET /auctions/1
  # GET /auctions/1.xml
  def show
    @user = User.find_by_id(session[:user_id])
    @auction = Auction.find(params[:id])
    @seller = User.find_by_username(@auction.user_name)
    @bid = Bid.new
    @bid.auction_id = @auction.id
    @bid_count = Bid.find_by_sql("SELECT COUNT(auction_id) AS bid_count FROM bids WHERE auction_id = #{@auction.id}")
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auction }
    end
  end

  # GET /auctions/new
  # GET /auctions/new.xml
  def new
    if is_login
      @user = User.find_by_id(session[:user_id])
      if @user.identity
        @auction = Auction.new
        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @auction }
        end
      else
        redirect_to(:controller => "main", :action => "welcome", :notice => 'Please log in as a seller to create an auction.')
        flash[:notice]="#{@user.username}, Please log in as a seller to create an auction."
      end
    else
      login
    end
  end
  
  # GET /auctions/1/edit
  def edit
    if is_login
      @user = User.find_by_id(session[:user_id])
      @auction = Auction.find(params[:id])
    else
      login
    end
  end

  # POST /auctions
  # POST /auctions.xml
  def create
    if is_login
      @auction = Auction.new(params[:auction])
      @user = User.find_by_id(session[:user_id])
      @auction.user_name = @user.username
      @auction.visible = true
      @auction.status = true

      respond_to do |format|
        if @auction.save
          Delayed::Job.enqueue AuctionCloseJob.new(@auction.id), 0, @auction.expire
          format.html { redirect_to(@auction, :notice => 'Auction was successfully created.') }
          format.xml  { render :xml => @auction, :status => :created, :location => @auction }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @auction.errors, :status => :unprocessable_entity }
        end
      end
    else
      session[:user_id] = nil
      login
    end
  end

  # PUT /auctions/1
  # PUT /auctions/1.xml
  def update
    if is_login
      @user = User.find_by_id(session[:user_id])
      @auction = Auction.find(params[:id])
      @auction.user_name = @user.username
      respond_to do |format|
        if @auction.update_attributes(params[:auction])
          format.html { redirect_to(@auction, :notice => 'Auction was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @auction.errors, :status => :unprocessable_entity }
        end
      end
    else
      session[:user_id] = nil
      login
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.xml
  def destroy
    if is_login
      @user = User.find_by_id(session[:user_id])
      @auction = Auction.find(params[:id])
      @auction.destroy
      respond_to do |format|
        format.html { redirect_to(auctions_url) }
        format.xml  { head :ok }
      end
    else
      session[:user_id] = nil
      redirect_to :controller => :users, :action => :login
    end
  end

#  def show_bid
#    @bid = Bid.find_by_id(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @bid }
#    end
#  end

  private 
  def is_login
    #to check if the user does put directly something in the link bar or browser
    unless session[:user_id] == nil
      @user = User.find_by_id(session[:user_id])
      unless(@user == nil)
        return true
      end
    else
      return false
    end
  end

  def login
    flash[:notice] = "Please Log in"
    redirect_to :controller => :users, :action => :login
  end

end
