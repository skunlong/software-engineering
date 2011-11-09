require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "get create" do
    post :create
    assert_response :redirect
  end

  test "get create can not find user" do
    post :create, { :message => {:receiver_name => "use", :title => "aaa", :content => "bbb" } }, {:user_id => 1}
    assert_response :success
  end

  test "get create with user logs in" do
    post :create, {:message => {:receiver_name => "luca", :title => "aaa", :content => "bbb" } }, {:user_id => 1}
    assert_response :redirect
  end

  test "fail to save in create" do
    post :create, {:message => {:receiver_name => "luca", :title => "", :content => "bbb" } }, {:user_id => 1}
    assert_response :success
  end

  test "get index" do
    get :index
    assert_response :redirect
  end

  test "get index with log in" do
    get :index, nil, {:user_id => 1}
    assert_response :success
  end

  test "show without log in" do
    get :show, {:id => 1}
    assert_response :redirect
  end

  test "show with log in" do
    get :show, {:id => 2}, {:user_id => 1}
    assert_response :success
  end

  test "show wrong user" do
    get :show, {:id => 1}, {:user_id => 1}
    assert_response :redirect
  end

  test "show no such user" do
    get :show, {:id => 1}, {:user_id => 0}
    assert_response :redirect
  end

  test "new webpage without logging in" do
    get :new
    assert_response :redirect
  end

  test "log in show new without parameter" do
    get :new, nil, {:user_id => 1}
    assert_response :success
  end

  test "log in show new with parameter" do
    get :new, {:to_ID => 2}, {:user_id => 1}
    assert_response :success
  end

end
