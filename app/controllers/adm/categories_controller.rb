class Adm::CategoriesController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index
    @q = params[:q]
    
    if(params[:rows])
      @rows = params[:rows]
    else
      @rows = 10
    end
    
    # order field
    if(params[:of])
      @of = params[:of]
    else
      @of = 'created_at'
    end
    
    # order direction
    if(params[:od])
      @od = params[:od]
    else
      @od = 'DESC'
    end

    if @q
      @q.gsub!(/[^0-9a-z ]/i, '')

      @arr = @q.split(" ")

      @qa = ""
      @arr.each { |q| @qa = @qa+"cat_name like '%"+q+"%' and "; }

      @categories = Category.where(@qa[0..(@qa.length - 5)]).order(@of+' '+@od).paginate(page: params[:page], per_page: @rows)
    else
      @categories = Category.all.order(@of+' '+@od).paginate(page: params[:page], per_page: @rows)
    end
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
