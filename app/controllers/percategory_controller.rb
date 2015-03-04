class PercategoryController < ApplicationController

	def index
		permalink = params[:permalink]
		@articles = VArticleCategory.where('cat_slug = ?',permalink).order('created_at DESC').paginate(page: params[:page], per_page: 10)
	end
end
