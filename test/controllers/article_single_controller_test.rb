require 'test_helper'

class ArticleSingleControllerTest < ActionController::TestCase
  
  setup do
    
    @article = articles(:one)
  end
  
  test "should get index" do
     get :index, :permalink => @article.to_param , :article => @article.attributes
     assert_response :success
  end
end
