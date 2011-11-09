class BidsController < ApplicationController
  def create
    if is_login
      @bid = Bid.new(params[:bid])
      if@bid.auction_id != nil
        @bid.user_id = session[:user_id]
        @auction = Auction.find_by_id(@bid.auction_id)
        if @auction == nil
          redirect_to( :controller => 'main', :action => 'welcome' )
        else
          @auction.current_price = @bid.bid_price
          @previous_bid = Bid.find_by_sql( "SELECT b.user_id, MAX(id) AS max_id FROM bids AS b WHERE auction_id = #{@bid.auction_id}" )
          @previous_user = nil
          if @previous_bid != nil
            @previous_user = User.find_by_id(@previous_bid[0].user_id)
          end
          @bid_count = Bid.find_by_sql("SELECT COUNT(auction_id) AS bid_count FROM bids WHERE auction_id = #{@bid.auction_id}")
          UserMailer.deliver_bidconfirm_email(@user,@auction)
          if(@previous_user != nil)
            UserMailer.deliver_bidlost_email(@previous_user,@auction)
          end

          respond_to do |format|
            if (@bid.save && @auction.save)
              format.html { redirect_to(@auction, :notice => 'Bid was successfully created.')}
              flash[:notice]="#{@user.username}, Bid was successfully created."
            else
              format.html { redirect_to( :controller => 'auctions', :action => 'show', :id => @bid.auction_id) }
            end
          end
        end
      else
        session[:user_id] = nil
        login
      end
    else
      login
    end
  end

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
