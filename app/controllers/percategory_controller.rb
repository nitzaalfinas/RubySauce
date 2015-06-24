class PercategoryController < ApplicationController
  include Adm::Helper

  # Displaying articles based on the selected category
  # * *Path* :
  # get /category/:cat_slug
  # * *Path Params* :
  #   - +cat_slug+ -> A permalink for the category
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
    
    if current_user
      @articles = VArticle.where('cat_slug = ? and publish_status = "Publish"', permalink).order('created_at DESC').paginate(page: params[:page], per_page: $appset.article_size)
    else
      @articles = VArticle.where('cat_slug = ? and publish_status = "Publish" and publish_visibility = "Public"', permalink).order('created_at DESC').paginate(page: params[:page], per_page: $appset.article_size)
    end
    
  end
end
