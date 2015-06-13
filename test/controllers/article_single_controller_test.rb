require 'test_helper'

class ArticleSingleControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get index" do
    sign_in users(:udin)
    @article = articles(:article_first)
    get :index, :permalink => @article.permalink , :article => @article.attributes
    assert_response :success
  end
end
