require 'test_helper'

class PageSingleControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  # def index ----
  test "get page/:permalink | Guest should see single page" do
    get :index, permalink: articles(:article_third).permalink
    assert_response :success
    assert_template 'index'
    assert_not_nil articles(:article_third)
  end
  
  test "get page/:permalink | User should see single page" do
    sign_in users(:one)
    get :index, permalink: articles(:article_third).permalink
    assert_response :success
    assert_template 'index'
    assert_not_nil articles(:article_third)
  end
  # ----
end
