require 'test_helper'

class Adm::CategoriesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:udin)
    @category = categories(:cat_one)
  end
  
  test "should get index" do
    get :index    
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:categories)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end
  
  test "should create category" do
    assert_difference('Category.count') do
      post :create, :category => { cat_name: "Ruby on Rails", cat_description: "ini description", cat_slug: "ruby_rails" }
    end
    assert_redirected_to adm_categories_path
  end
  
  test "should not create category because it doesn't have a cat_slug" do
    assert_difference('Category.count',0) do
      post :create, :category => { cat_name: "Ruby on Rails", cat_description: "ini description" }
    end
    assert_template 'new'
  end
  
  test "should get edit" do
    get :edit, :id => @category.to_param, :category => @category.attributes
    assert_response :success
  end
  
  test "should update category" do
    assert_no_difference('Category.count') do 
      put :update, :id => @category.to_param, :category => @category.attributes
      assert_redirected_to adm_categories_path
    end
  end
  
  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => @category.to_param
      assert_redirected_to adm_categories_path
    end
    
  end
end
