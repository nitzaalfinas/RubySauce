class Adm::PagesController < ApplicationController

  before_action :authenticate_user!

  include Adm::Helper

  layout "adm_layout"

  def index
    adm_check current_user.level

    @articles = VPage.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)

  end #def index

  def new
    adm_check current_user.level

    @article = Article.new

  end

  def create
    adm_check current_user.level

    @article = Article.new(article_params)
    @article.article_type = "Page"
    @article_save = @article.save

    if @article_save
      redirect_to "/adm/pages"
    else

      render 'new'
    end
  end #create

  def edit
    adm_check current_user.level

    id = params[:id]
    @article = Article.find(id)
    @page = params[:page]

  end #def edit

  def update
    adm_check current_user.level

    page = params[:page]
    id = params[:id]
    @article = Article.find(id)
    @article_update = @article.update(article_params)

    if @article_update
      redirect_to "/adm/pages?page="+page
    else
      #if saving failure, this object need to cast


      render 'edit'
    end #if @article_update
  end #def update

  def destroy
    adm_check current_user.level

    @art = Article.find(params[:id])
    @art.destroy
    redirect_to adm_pages_path
  end #destroy

  private
  def article_params
    params.require(:article).permit(:title, :body, :permalink, :publish_status, :excerp, :author_id, :feat_img)
  end

end
