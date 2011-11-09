require 'test_helper'

class MainControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "get main index" do
    get :welcome
    assert_response :success

    session[:user_id] = nil
    get :welcome
    assert_response :success

    session[:user_id] = 1
    get :welcome
    assert_response :success

    session[:user_id] = -1
    get :welcome
    assert_response :success
  end
end
