class PercategoryController < ApplicationController
  include Adm::Helper

  def index
    permalink = params[:permalink]
    @articles = VArticleCategory.where('cat_slug = ?',permalink).order('created_at DESC').paginate(page: params[:page], per_page: $appset.article_size)
  end
end
