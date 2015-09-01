class PercategoryController < ApplicationController
  
  # Displaying articles based on the selected category
  # * *Path* :
  # get /category/:cat_slug
  # * *Path Params* :
  #   - +cat_slug+ -> A permalink for the category
  # * *Args* :
  # * *Reusable Object* :
  #   - <code>@article</code> -> articles
  #   - <code>@dynamic_title</code> -> SEO
  #   - <code>@dynamic_author</code> -> SEO
  #   - <code>@dynamic_description</code> -> SEO
  #   - <code>@dynamic_keywords</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
  def index
    permalink = params[:permalink]
    
    if current_user
      @articles = VArticleCategory.where('cat_slug = ? and publish_status = "Publish"', permalink).order('created_at DESC').paginate(page: params[:page], per_page: app_set('article_size'))
    else
      @articles = VArticleCategory.where('cat_slug = ? and publish_status = "Publish" and publish_visibility = "Public"', permalink).order('created_at DESC').paginate(page: params[:page], per_page: app_set('article_size'))
    end
    
  end
end
