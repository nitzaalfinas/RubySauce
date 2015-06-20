class ArticleSingleController < ApplicationController
  include Adm::Helper
  
  def index
    permalink = params[:permalink]
    @article = VArticle.where("permalink = ?",permalink).take
    @article_categories = VArticleCategory.where('article_id = ?',@article.id)
    
    # redirect if its private and guest user
    if @article.publish_visibility == "Private" && !user_signed_in?
      redirect_to root_path
    end
    
    #update article count
    @ina = Article.find(@article.id)
    @old_count = @ina.article_vcount
    @new_count = @old_count.to_i + 1
    @ina.article_vcount = @new_count
    @ina.save
    
    #SEO
    @dynamic_title = @article.title
    @dynamic_author = ""
    @dynamic_description = @article.excerp
    @dynamic_keyword = ""
    @dynamic_image = 'upload/thumb/'+@article.feat_img
    
  end #index	
end
