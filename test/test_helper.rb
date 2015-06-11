ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
#  def login_as(user)
#      @request.session[:user_id] = users(user).id
#  end
#  def login_as
#    the_user = User.first
#    #@request.session[:user_id] = users(the_user).id
#    @request.session[:user_id] = 1
#  end
end
