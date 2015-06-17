class LandingController < ApplicationController

	def index
		if current_user
      @articles = VArticle.where('publish_status = "Publish"').order('created_at DESC').paginate(page: params[:page], per_page: 10)
    else
      @articles = VArticle.where('publish_status = "Publish" and publish_visibility = "public"').order('created_at DESC').paginate(page: params[:page], per_page: 10)
    end
		
		@dynamic_title = "Ruby on Rails CMS"
		@dynamic_author = "nitzaalfinas"
		@dynamic_description = "Ruby on Rails CMS"
		@dynamic_keyword = "ruby on rails, rails, ruby, cms"
		@dynamic_image = "logo.png"
		
	end

end
