require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get index for guest" do
    
    get :index
    assert_response :success
    @articles = VArticle.all
    assert_template 'index'
    assert_not_nil assigns(@articles)
  end
end
