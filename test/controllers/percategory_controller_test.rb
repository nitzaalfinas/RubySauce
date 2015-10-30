require 'test_helper'

class PercategoryControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  # def index
  test "get category/:permalink | Menampilkan artikel per kategori" do
    get :index, permalink: categories(:cat_one).cat_slug
    assert_response :success
  end
end
