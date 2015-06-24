class PageSingleController < ApplicationController
  include Adm::Helper

  # The page is an article with type = page. <br>
  # So, the page has the same properties with article.
  # * *Path* :
  # get /page/:permalink
  # * *Path Params* :
  #   - +permalink+ -> Page permalink 
  # * *Args* :
  # * *Returns* :
  #   - <code>@article</code> -> articles
  #   - <code>@dynamic_title</code> -> SEO
  #   - <code>@dynamic_author</code> -> SEO
  #   - <code>@dynamic_description</code> -> SEO
  #   - <code>@dynamic_keyword</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
  def index
    permalink = params[:permalink]
    @article = VPage.where("permalink = ?",permalink).take

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
