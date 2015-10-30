require 'test_helper'

class Adm::MediaControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:udin)
    @medium = media(:one)
  end
  
  # def index
  test "should get index" do
    get :index    
    assert_response :success
    assert_template 'index'
  end

  # def new
  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
    #assert_not_nil assigns(:medium)
  end

  # def upload
  test "should create media" do
    assert_difference('Medium.count') do
      post :upload, :medium => { med_storage_name: fixture_file_upload("files/tiga.JPG"), med_title: "Ini title" }
    end
    assert_redirected_to adm_media_path
  end
  
  # def edit
  test "should get edit" do
    get :edit, :id => @medium.to_param, :medium => @medium.attributes
    assert_not_nil assigns(:medium)
    assert_response :success
  end
  
  test "should update media" do
    put :update, :id => @medium.id, :page => 1, :medium => { med_storage_name: fixture_file_upload("files/empat.JPG") }
    assert_redirected_to adm_media_path
  end

  
  test "should destroy media" do
    assert_difference('Medium.count', -1) do
      delete :destroy, :id => @medium.to_param, :page => 1
    end
    assert_redirected_to adm_media_path
  end

  
end
