class LandingController < ApplicationController
  include Adm::Helper

  def index
    if current_user
      @articles = VArticle.where('publish_status = "Publish"').order('created_at DESC').paginate(page: params[:page], per_page: $appset.article_size)
    else
      @articles = VArticle.where('publish_status = "Publish" and publish_visibility = "public"').order('created_at DESC').paginate(page: params[:page], per_page: $appset.article_size)
    end

    @dynamic_title = "Home" # find something better to change this
    @dynamic_author = "nitzaalfinas" # change this if you want
    @dynamic_description = $appset.site_description
    @dynamic_keyword = $appset.site_keywords
    @dynamic_image = "logo.png"
		
  end

end
