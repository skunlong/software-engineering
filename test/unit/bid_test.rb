require 'test_helper'

class BidTest < ActiveSupport::TestCase
  fixtures :bids

  test "Invalid with empty attributes" do
    bid = Bid.new
    assert !bid.valid?
    assert bid.errors.invalid?(:auction_id)
    assert bid.errors.invalid?(:user_id)
    assert bid.errors.invalid?(:bid_price)
  end

  test "bid price not negative" do
    bid = Bid.new
    bid.bid_price = -1
    bid.auction_id = 1
    assert !bid.valid?
    assert_equal "The new bid should be more than current bid", bid.errors.on(:bid_price)
  end

  test "bid price positive" do
    bid = Bid.new
    bid.bid_price = 0
    bid.auction_id = 1
    assert !bid.valid?
    assert_equal "The new bid should be more than current bid", bid.errors.on(:bid_price)
  end

   test "The new bid should be more than current bid" do
    bid = Bid.new
    bid.auction_id = 1
    bid.bid_price = 3
    assert !bid.save
    # you can't save the bid
  end
  
end

