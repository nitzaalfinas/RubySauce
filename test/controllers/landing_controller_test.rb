require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get index for guest" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil articles
  end
  
  test "should get index for user" do
    sign_in users(:udin)
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil articles
  end
end
