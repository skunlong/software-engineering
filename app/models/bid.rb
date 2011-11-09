class Bid < ActiveRecord::Base
  has_one :auction
  has_one :user
  validates_presence_of :bid_price, :user_id, :auction_id
  validate :bid_price_bigger_than_current
  validates_numericality_of :bid_price

  protected
  def bid_price_bigger_than_current
    auction=Auction.find_by_id(auction_id)
    errors.add(:bid_price, 'The new bid should be more than current bid') if (bid_price.nil? || bid_price < auction.current_price)
  end

end

