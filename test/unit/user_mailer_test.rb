require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  tests UserMailer


  def test_welcome_email
    @user = users(:one)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_welcome_email(@user)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@user.email], email.to
    assert_equal "Welcome to Phoenix Auction Site", email.subject
    assert_match /Welcome to Phoenix Auction.com, #{@user.username}/, email.body
  end

  def test_bidconfirm_email
    @user = users(:one)
    @auction = auctions(:printer)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_bidconfirm_email(@user,@auction)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@user.email], email.to
    assert_equal "Bid confirmation in Phoenix Auction Site", email.subject
    assert_match /You have successfully bid an item at Phoenix Auction.com./, email.body
  end

  def test_bidlost_email
    @user = users(:one)
    @auction = auctions(:printer)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_bidlost_email(@user,@auction)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@user.email], email.to
    assert_equal "There is another bid higher than yours in Phoenix Auction Site", email.subject
    assert_match /There is another bid higher than yours at Phoenix Auction.com./, email.body
  end

  def test_bidclose_email
    @auction_user = users(:one)
    @last_user = users(:six)
    @auction = auctions(:printer)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_bidclose_email(@auction_user, @auction, @last_user)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@auction_user.email], email.to
    assert_equal "Your auction is closed now in Phoenix Auction Site", email.subject
    assert_match /Your auction is closed now at Phoenix Auction.com/, email.body
  end

  def test_forgotpassword_email
    @user = users(:one)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_forgotpassword_email(@user.email, @user.username, "testpassword")
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@user.email], email.to
    assert_equal "Here is your new password at Phoenix Auction Site", email.subject
    assert_match /As you forgot your password, here is your new password at Phoenix Auction Site./, email.body
  end

  def test_getbid_email
    @user = users(:one)
    @auction = auctions(:printer)

    # Send the email, then test that it got queued
    email = UserMailer.deliver_getbid_email(@user,@auction)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [@user.email], email.to
    assert_equal "Congratulations! You have won your bid in Phoenix Auction Site", email.subject
    assert_match /Congratulations! You have won your bid in Phoenix Auction Site!/, email.body
  end
   
end
