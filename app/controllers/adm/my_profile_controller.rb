class Adm::MyProfileController < ApplicationController
  before_action :authenticate_user!
  
  helper Adm::Helper # to call from view
  include Adm::Helper # to call within controller
  
  layout "adm_layout"
  
  
  def index
    
  end
  
  def edit

  end #def edit
  
  def update
    
    
  end #def update
end
