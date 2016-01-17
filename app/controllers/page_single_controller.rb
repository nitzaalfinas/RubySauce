class PageSingleController < ApplicationController
  
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
  #   - <code>@dynamic_keywords</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
  def index
    

  end #index
end
