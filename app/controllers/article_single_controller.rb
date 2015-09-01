class ArticleSingleController < ApplicationController
  
  # Showing single page of the article.<br>
  # The article has 2 publish type; public and private.<br> 
  # The visitor who are not logged on, he/she can't read the article with type of private
  # * *Path* :
  # get /:article_permalink
  # * *Path Params* :
  #   - +permalink+ -> Article permalink
  # * *Args* :
  # * *Returns* :
  #   - <code>@article</code> -> articles
  #   - <code>@article_categories</code> -> categories of current article
  #   - <code>@dynamic_title</code> -> SEO
  #   - <code>@dynamic_author</code> -> SEO
  #   - <code>@dynamic_description</code> -> SEO
  #   - <code>@dynamic_keywords</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
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
