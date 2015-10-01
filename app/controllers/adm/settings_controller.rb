class Adm::SettingsController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index

  end

  def update
    
    @opt_site_title = Option.where("option_key = 'site_title'").take
    @opt_site_title.option_value = params[:o_site_title]
    @opt_site_title.save
    
    @opt_site_description = Option.where("option_key = 'site_description'").take
    @opt_site_description.option_value = params[:o_site_description]
    @opt_site_description.save
    
    @opt_site_domain = Option.where("option_key = 'site_domain'").take
    @opt_site_domain.option_value = params[:o_site_domain]
    @opt_site_domain.save
    
    @opt_site_keywords = Option.where("option_key = 'site_keywords'").take
    @opt_site_keywords.option_value = params[:o_site_keywords]
    @opt_xx = @opt_site_keywords.save

    # if the last option save, redirect to ...
    if @opt_xx 
      render inline: "success"
    else
      render inline: "fail"
    end
  end

end
