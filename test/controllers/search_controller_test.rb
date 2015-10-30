require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  # def index
  test "get search | Menampilkan hasil pencarian" do
    get :index, q: "cari"
    assert_response :success
  end
  
end
