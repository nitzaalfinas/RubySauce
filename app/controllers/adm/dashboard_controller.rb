class Adm::DashboardController < ApplicationController

	before_action :authenticate_user!

	layout "adm_layout"

	def index
    @article_count = Article.count
    @visitor_sum = Article.sum(:article_vcount)
    @category_count = Category.count
    @media_count = Media.count
    @articles = VArticle.limit(10).order('article_vcount desc')
	end

end
