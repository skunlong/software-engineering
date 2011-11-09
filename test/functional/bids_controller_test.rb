require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  fixtures :users
  
  test "bid controller without logging in" do
    post :create
    assert_response :redirect
  end

  test "bid controller with logging in" do
    post :create, nil, {:user_id=>1}
    assert_response :redirect
  end

  test "bid controller with auction id" do
    post :create, {"bid" => {"auction_id" => 1, "bid_price" => 5}}, {:user_id => 3}
    assert_response :redirect
  end

  test "bid controller with valid auction id" do
    post :create, {"bid" => {"auction_id" => 1, "bid_price" => 300}}, {:user_id => 3}
    assert_response :redirect
  end

  test "no such auction" do
    post :create, {"bid" => {"auction_id" => 100, "bid_price" => 300}}, {:user_id => 3}
    assert_response :redirect
  end

end
