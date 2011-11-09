require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
  fixtures :auctions
  
  test "Invalid with empty attributes" do
    auction = Auction.new
    assert !auction.valid?
    assert auction.errors.invalid?(:auction_name)
    assert auction.errors.invalid?(:image_url)
    assert auction.errors.invalid?(:start_price)
    assert auction.errors.invalid?(:current_price)
    assert auction.errors.invalid?(:expire)
  end

  test "Positive price" do
    auction = Auction.new(:auction_name => "printer",
                          :description => "printer won",
                          :image_url => "printer.jgp",
                          :expire => Time.now)

    auction.start_price = -1
    assert !auction.valid?
    assert_equal "The price should be at least 0.01", auction.errors.on(:start_price)

    auction.start_price = 0
    assert !auction.valid?
    assert_equal "The price should be at least 0.01", auction.errors.on(:start_price)


    auction.current_price = -1
    assert !auction.valid?
    assert_equal "The price should be at least 0.01", auction.errors.on(:current_price)

    auction.current_price = 0
    assert !auction.valid?
    assert_equal "The price should be at least 0.01", auction.errors.on(:current_price)

  end

  def auction_test

   dummy_auction= Auction.new :auction_name => auctions(:printer).auction_name,
                              :description => auctions(:printer).description,
                              :image_url => auctions(:printer).image_url,
                              :start_price => auctions(:printer).start_price,
                              :current_price => auctions(:printer).current_price,
                              :expire => auctions(:printer).expire,
                              :user_name => auctions(:printer).status


   assert dummy_auction.save

   dummy_auction_copy = Auction.find(dummy_auction.id)

   assert_equal dummy_auction.auction_name dummy_auction_copy.name

   dummy_auction = "iphone"

   assert dummy_auction.save
   assert dummy_auction.destroy

 end

end


