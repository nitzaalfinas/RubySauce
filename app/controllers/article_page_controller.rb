class ArticlePageController < ApplicationController

	def index
		permalink = params[:permalink].to_s
		@article = VPage.where("permalink = ?",permalink).take

		#update article count
		@ina = Article.find(@article.id)
		@old_count = @ina.article_vcount
		@new_count = @old_count.to_i + 1
		@ina.article_vcount = @new_count
		@ina.save

		#SEO
		@dynamic_title = @article.title
		@dynamic_author = "diaspora_minang"
		@dynamic_description = @article.excerp
		@dynamic_keyword = "minang, minangkabau, pantun, patatah-patitih, sumatera barat, padang, pariaman, bukittinggi, pesisir selatan, payakumbuh, solok"
		@dynamic_image = 'upload/thumb/'+@article.feat_img
	end #index
end
