# To change this template, choose Tools | Templates
# and open the template in the editor.

class AuctionCloseJob < Struct.new(:id)
  def perform
    @auction = Auction.find_by_id(id)
    @auction.status = false
    @auction.save
    @auction_user = User.find_by_username(@auction.user_name)

    @last_bid = Bid.find_by_sql( "SELECT b.user_id, MAX(id) AS max_id FROM bids AS b WHERE auction_id = #{@auction.id}" )
    @last_user = nil
    if @last_bid != nil
      @last_user = User.find_by_id(@last_bid[0].user_id)
    end
    if(@last_user != nil)
      UserMailer.deliver_getbid_email(@last_user, @auction)
      UserMailer.deliver_bidclose_email(@auction_user, @auction, @last_user)
    end
  end
end
