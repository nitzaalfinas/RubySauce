class PageSingleController < ApplicationController
  include Adm::Helper

  def index
    permalink = params[:permalink].to_s
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
    @dynamic_title = "Ruby on Rails CMS"
    @dynamic_author = "nitzaalfinas"
    @dynamic_description = "Ruby on Rails CMS"
    @dynamic_keyword = "ruby on rails, rails, ruby, cms"
    @dynamic_image = 'upload/thumb/'+@article.feat_img

  end #index
end
