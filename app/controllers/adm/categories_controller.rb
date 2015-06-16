class Adm::CategoriesController < ApplicationController

	before_action :authenticate_user!

	include Adm::Helper

	layout "adm_layout"

	def index
		@categories = Category.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		
		if @category.save
			redirect_to "/adm/categories"
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update 	
		id = params[:id]
		@category = Category.find(id)

		if @category.update(category_params)
			redirect_to "/adm/categories"
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to adm_categories_path
	end

	private
		def category_params
			params.require(:category).permit(:cat_name, :cat_slug, :cat_description)
		end

end
