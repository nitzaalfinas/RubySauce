class SearchController < ApplicationController
  include Adm::Helper
  
  # Searcing for articles
  # * *Path* :
  # get /search
  # * *Path Params* :
  # * *Args* :
  # * *Returns* :
  #   - <code>@articles</code> -> articles
  def index
    @q = params[:q]

    @q.gsub!(/[^0-9a-z ]/i, '')

    @arr = @q.split(" ")

    @qa = ""
    @arr.each do |q|
      @qa = @qa+"article_all like '%"+q+"%' and "
    end

    @articles = VArticle.where(@qa[0..(@qa.length - 5)]).paginate(page: params[:page], per_page: $appset.article_size)
  end
end
