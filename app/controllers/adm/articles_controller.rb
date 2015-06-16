class Adm::ArticlesController < ApplicationController

	before_action :authenticate_user!

	include Adm::Helper

	layout "adm_layout"

	def index
		@articles = VArticle.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
	end #index

	def new
		@article = Article.new
		@categories = Category.all		
	end #new

	def create
		@article = Article.new(article_params)
		@article.article_type = 'Article'
		@article.article_vcount = 0
		@article_save = @article.save

		#if article has been saved
		if @article_save
			if params[:category]
				if params[:category][:category_id]
					@cats = params[:category][:category_id]
					@cats.each do |cat|
						@artcat = ArticleCategory.new
						@artcat.article_id = @article.id
						@artcat.category_id = cat
						@artcat.save
					end
				end	
			end
		end

		if @article_save
      redirect_to adm_articles_path
		else
			
			@categories = Category.all
			render 'new'
		end #if @article_save
	end #def create

	def edit
		id = params[:id].to_i
    page = params[:page].to_i
    
		@article = Article.find(id)
		@categories = Category.all
		@page = page
		
	end #def edit

	def update
    id = params[:id].to_i
		page = params[:page].to_i
		
		@article = Article.find(id)
		@article_update = @article.update(article_params)

		#deleting category by article_id and later create new category to this article
		ArticleCategory.where(:article_id => id).destroy_all

		#insert all of categories
		if params[:category]
			if params[:category][:category_id]
				@cats = params[:category][:category_id]
				@cats.each do |cat|
					@artcat = ArticleCategory.new
					@artcat.article_id = id
					@artcat.category_id = cat
					@artcat.save
				end
			end	
		end #params[:category]

		if @article_update
      redirect_to adm_articles_path(:page => page)
		else
			#if saving failure, this object need to cast
			
			@categories = Category.all
			render 'edit'
		end #if @article_update
	end #def update

	def destroy
    page = params[:page].to_i
		#find article id
		@art = Article.find(params[:id])

		#destroy article_category
		ArticleCategory.where('article_id = ?',@art.id).destroy_all

		#destroy article based on id
		@art.destroy
		
		redirect_to adm_articles_path(:page => page)
	end #def destroy


	private
		def article_params
			params.require(:article).permit(:title, :body, :permalink, :publish_status, :publish_visibility, :excerp, :author_id, :feat_img)
		end

end