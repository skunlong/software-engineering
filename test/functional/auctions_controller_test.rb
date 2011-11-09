require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase

fixtures :auctions

  # common method to redirect login

  test "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auctions)
  end

  test "show auction" do
    get :show, :id => auctions(:printer).id
    assert_response :success
  end

  test "get new" do
    get(:new,nil,{'user_id' => 1})
    assert_response :success
  end

  test "get buyer new" do
    get :new, nil, {"user_id" => 2}
    assert_response :redirect
  end

  test "get new without login" do
    get :new
    assert_redirected_to(:controller => "users", :action => "login")
  end

  test "should get edit user" do
    get(:edit,{'id' => 1},{'user_id' => 1})
    assert_response :success
  end

  test "should get edit without login" do
    get :edit, :id => auctions(:printer).id
    assert_redirected_to(:controller => "users", :action => "login")
  end

  test "update auction" do
    post(:update,{'id' => 1,:auction => {'start_price'=>"100"}},{'user_id' => 1})
    assert_response :redirect
  end

  test "update auction unprocessable" do
     post(:update,{'id' => 1, :auction => {'start_price'=>"zzz"}},{'user_id' => 1})
     assert_response :success
  end

  test "not update auction" do
    put :update, :id => auctions(:printer).id, :auction => { }
    assert_response :redirect
  end

  test "create auction without login" do
    post :create, :id => auctions(:printer).id, :auction => { }
    assert_redirected_to(:controller => "users", :action => "login")
  end

  test "create auction unsuccesfully" do
     post(:create,{'id' => 1, :auction => {'start_price'=>"zzz"}},{'user_id' => 1})
     assert_response :success
  end

  test "create auction" do
    post(:create, {'id' => 1,:auction => {
                              'auction_name' => 'printer',
                              'description' => 'Brand new HP Deskjet printer',
                              'image_url' => '/images/HPDeskJet.png',
                              'category' => 'Computers & Office->Computers',
                              'start_price' => '9.99',
                              'current_price' => '9.99',
                              'expire' => '2010-12-08 00:30:38' 
                              }
                        },
        {'user_id' => 1 })
    assert_response :redirect
  end

  test "destroy auction without login" do
    post :destroy
    assert_redirected_to(:controller => "users", :action => "login")
  end

  test "should destroy auction" do
    get(:new,nil,{'user_id' => 1})
     assert_difference('Auction.count', -1) do
      delete :destroy, :id => auctions(:printer).id
    end
    assert_response :redirect
  end

end
