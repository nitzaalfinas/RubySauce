class Adm::UsersController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index
    adm_check current_user.level

    @users = User.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)

  end

  def new
    adm_check current_user.level

    @user = User.new

  end

  # To create a new user 
  # <h3>Process</h3>
  # Send the email reset password instruction to the user
  def create
    adm_check current_user.level
        
    xx = User.new
    xx.full_name = params[:user][:full_name]
    xx.nick_name = params[:user][:nick_name]
    xx.email = params[:user][:email]
    xx.password = User.new(:password => params[:user][:password]).encrypted_password
    #xx.confirmed_at = DateTime.now
    xx.save
        
    redirect_to(adm_users_path)
    
  end

end
