class LandingController < ApplicationController
  
  # This is the root of the application
  # * *Path* :
  # get /
  # * *Path Params* :
  # * *Args* :
  # * *Returns* :
  #   - <code>@articles</code> -> articles
  #   - <code>@dynamic_title</code> -> SEO
  #   - <code>@dynamic_author</code> -> SEO
  #   - <code>@dynamic_description</code> -> SEO
  #   - <code>@dynamic_keywords</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
  def index
    @level_kode = params[:kode] # 31.72.005

    if @level_kode.length == 9
      render 'kecamatan'
    end


    @dynamic_title = "Home" # find something better to change this
    @dynamic_author = "nitzaalfinas" # change this if you want
    @dynamic_description = app_set('site_description')
    @dynamic_keywords = app_set('site_keywords')
    @dynamic_image = "logo.png"
		
  end

end
