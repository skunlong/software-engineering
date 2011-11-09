require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  fixtures :admins
  
  test "get index" do
    get :index
    assert_response :success
  end

  test "index redirect" do
    get :index, nil, {"admin_id" => 1}
    assert_response :redirect
  end

  test "login" do
    post :login, {"admin" => {"user_name" => "admins", "password" => "admins"}}, nil
    assert_response :success

    post :login, {"admin" => {"user_name" => "", "password" => "admins"}}, nil
    assert_response :success

    post :login, {"admin" => {"user_name" => "admins", "password" => ""}}, nil
    assert_response :success

    post :login, {"admin" => {"user_name" => "admin", "password" => "admins"}}, nil
    assert_response :success
  end

  test "admin_show" do
    get :admin_show
    assert_response :redirect
    
    get :admin_show, nil, {"admin_id" => 1}
    assert_response :success

    get :admin_show
    assert_response :success
  end

  test "logout" do
    session[:admin_id] = 1
    get :logout
    assert_response :redirect
  end

  test "activate" do
    get :activeuser, {:id => 1}
    assert_response :success
  end

  test "deactivate" do
    get :deactiveuser, {:id => 1}
    assert_response :success
  end

  test "activateall" do
    get :activeall
    assert_response :redirect
  end

  test "deactivateall" do
    get :deactiveall
    assert_response :redirect
  end

  test "message_show" do
    get :showmessages
    assert_response :success
  end


end
