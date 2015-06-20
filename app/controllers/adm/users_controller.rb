class Adm::UsersController < ApplicationController

  before_action :authenticate_user!

  include Adm::Helper

  layout "adm_layout"

  def index
    adm_check current_user.level

    @users = User.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)

  end

  def new
    adm_check current_user.level

    @user = User.new

  end


end
