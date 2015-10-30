require 'test_helper'

class Adm::DashboardControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:udin)
  end
  
  test "should get index" do
    get :index    
    assert_response :success
    assert_template 'index'
  end
  
end
