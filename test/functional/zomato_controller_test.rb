require 'test_helper'

class ZomatoControllerTest < ActionController::TestCase
  test "should get Home" do
    get :Home
    assert_response :success
  end

  test "should get Help" do
    get :Help
    assert_response :success
  end

  test "should get About" do
    get :About
    assert_response :success
  end

  test "should get ContactUS" do
    get :ContactUS
    assert_response :success
  end

end
