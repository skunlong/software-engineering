require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  fixtures :users
  
  test "get index" do
    get :index
    assert_response :redirect

    get :index, nil, {"admin_id" => 1}
    assert_response :success

    get :index
    assert_response :success
  end

  test "test not login" do
    post :login, :user => {"username" => "users", "password" => "users"}
    assert_response :success
    
    post :login, :user => {"username" => "", "password" => "users"}
    assert_response :success

    post :login, :user => {"username" => "users", "password" => ""}
    assert_response :success

    post :login, :user => {"username" => "userno1", "password" => "user1"}
    assert_response :success
  end

  test "logout" do
    session[:user_id] = 1
    get :logout
    assert_response :redirect
  end


  test "should get new" do
    get :new
    assert_response :success
  end

  test "should edit user" do
    post :login, :user => {"username" => "userno1", "password" => "user1"}
    get :edit, { :id => 1}
    assert_response :success
  end

  test "edit without log in" do
    session[:user_id] = 1
    get :logout
    get :edit, {:id => 1}
    assert_response :redirect
  end

  test "should personalInfo user" do
    get :personalInfo, { :id => 1}
    assert_response :success
  end

  test "should show user" do
    get :show, { :id => 1}
    assert_response :success
    get :show, { :id => 3}
    assert_response :success
  end

  test "should get update" do
    post :update, { :id => 1, :user => { :username => "abcdefgh", :email => "hello@hello.com", :password => "testpassword", :password_confirmation => "testpassword" } }
    assert_response :redirect
    post :update, { :id => 1, :user => { :username => "user1", :email => "zqsharejoy@gmail.com", :password => "user1", :password_confirmation => "user1" } }
    assert_response :success
  end

  test "should create user" do
    @user = User.new
    post :create, :user => { :username => "helloworld",
      :password => "helloworld",
      :password_confirmation => "helloworld",
      :identity => 0,
      :email => "test@jlfweo.com" }
    assert_response :redirect
  end

  test "should not create user" do
    @user = User.new
    post :create, :user => { }
    assert_response :success
  end

  test "destroy" do
    get :destroy, { :id => 1 }
    assert_response :redirect
  end

  def test_forgot_password
    #we can login
    post :login, :user=>{ :username => "users", :password => "users"}
    assert_response :success
    #assert_response :redirect
    assert_not_nil :user
    #logout
    get :logout
    assert_response :redirect
    #?? assert_nil :user
    #enter an email that doesn't exist
    post :forgot_password, :email => {:email=>"zqsharejoy@gmail.com"}
    assert_response :redirect
    # assert_nil :user
    # assert_template "user/forgot_password"
    assert flash[:notice]
    #enter bobs email
    post :forgot_password, :email => {:email=>"exbob@mcbob.com"}
    assert_response :redirect
    assert flash[:message]
    assert_redirected_to :action=>'login'
    post :forgot_password, :email => {:email=>""}
    assert flash[:warning]
  end

  def test_change_password
    # change without log in  
    get :change_password, {:id => 1}
    assert_response :redirect
    # change with wrong information
    get :change_password, {:id=>1}, {:user_id => 100}
    assert_response :redirect
    #can login
    post :login, :user=>{ :username => "userno1", :password => "user1"}
    assert_response :success
    assert_not_nil :user
    #try to change password
    #passwords don't match
    post :change_password, {:user => { :password => "newpass", :password_confirmation => "newpassdoesntmatch"}}, {:user_id => 1}
    assert_response :success
    #empty password
    post :change_password, {:user => { :password => "", :password_confirmation => ""}}, {:user_id => 1}
    assert_response :success
    #success - password changed
    post :change_password, {:user => { :password => "newpass", :password_confirmation => "newpass"}}, {:user_id => 1}
    assert_response :redirect
    #logout
    get :logout
    assert_response :redirect
    #old password no longer works
    post :login, :user=> { :username => "user1", :password => "test" }
    assert_response :success
    assert flash[:notice]
    #new password works
    post :login, :user=>{ :username => "user1", :password => "newpass"}
    assert_response :success
    assert_not_nil :user
  end

end
