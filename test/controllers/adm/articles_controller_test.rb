require 'test_helper'

class Adm::ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:udin)
    @article = articles(:article_first)
  end
  
  test "should get index" do
    get :index    
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:articles)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end
  
  test "should create article" do
    assert_difference('Article.count') do
      post :create, :article => { title: "ini dari create", body: "ini body", author_id: 3, permalink: "ini_permalink" }
    end
    assert_redirected_to adm_articles_path
  end
  
  test "should get edit" do
    get :edit, :id => @article.to_param, :article => @article.attributes
    assert_response :success
  end
  
  test "should update article" do
    assert_no_difference('Article.count') do
      put :update, :id => @article.to_param, :page => 1, :article => @article.attributes
      assert_redirected_to adm_articles_path(:page => 1)
    end
  end
  
  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, :id => @article.to_param, :page => 1
    end
    assert_redirected_to adm_articles_path(:page => 1)
  end
end
