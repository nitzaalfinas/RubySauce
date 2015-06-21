class Adm::SettingsController < ApplicationController

  before_action :authenticate_user!

  include Adm::Helper

  layout "adm_layout"

  def index

  end

  def update

    $appset.site_title = params[:option][:site_title]
    $appset.site_description = params[:option][:site_description]
    $appset.site_domain = params[:option][:site_domain]
    $appset.site_keywords = params[:option][:site_keywords]
    @setting_save = $appset.save


    if @setting_save 
      redirect_to "/adm/settings"
    else
      render "index"
    end
  end

end
