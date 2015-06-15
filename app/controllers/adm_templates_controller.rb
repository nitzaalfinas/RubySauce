class AdmTemplatesController < ApplicationController
  
  before_action :authenticate_user!

	include AdmHelper

	layout "adm_layout"
  
  def index
    @default = Template.where(:active => 1).take
    @templates = Template.where('active <> 1').order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @template = Template.new
  end
  
  
  def upload
    #params 
    t_filename = params[:template][:name]
    
    #path
    f_path = Rails.root.join('app/assets/templates')
    
    #unzip command 
    unzip_command = 'unzip '+Rails.root.to_s+'/app/assets/templates/tmp/'+t_filename.original_filename.to_s+' -d '+f_path.to_s
    
    @template = Template.new
		@template.name = t_filename.original_filename.gsub(".zip","")
		@template_save = @template.save

		if @template_save
      
			#upload original
			File.open(Rails.root.join('app/assets/templates/tmp',t_filename.original_filename),'wb') do |file|
				file.write(t_filename.read)
			end
      
      #unzip
      system(unzip_command)
      
			redirect_to adm_templates_path

		else
			render "new"
		end
  end
  
  
  def active
    id = params[:id]
    
    #get template by id
    template = Template.find(id)
    
    # current template active set to inactive or active = 0
    current_template_active = Template.where(:active => 1).take
    current_template_active.active = 0
    current_template_active.save
    
    # assign template active to a new one
    template.active = 1
    template.save
    
    #views
    del_copy_views_dir(template.name,'article_single')
    del_copy_views_dir(template.name,'confirmable')
    del_copy_views_dir(template.name,'devise')
    del_copy_views_dir(template.name,'galleries')
    del_copy_views_dir(template.name,'landing')
    del_copy_views_dir(template.name,'page_single')
    del_copy_views_dir(template.name,'percategory')
    
    #helpers
    del_copy_helper(template.name,'application_helper.rb')
    del_copy_helper(template.name,'article_page_helper.rb')
    del_copy_helper(template.name,'article_single_helper.rb')
    del_copy_helper(template.name,'discuss_helper.rb')
    del_copy_helper(template.name,'galleries_helper.rb')
    del_copy_helper(template.name,'landing_helper.rb')
    del_copy_helper(template.name,'page_single_helper.rb')
    del_copy_helper(template.name,'percategory_helper.rb')
    
    
    #layout
    template_layout_application = Rails.root.join('app/assets/templates/'+template.name+'/views/layouts/application.html.erb')
    real_layout_application = Rails.root.join('app/views/layouts/application.html.erb')
    FileUtils.cp template_layout_application, real_layout_application 
    
    
    
    redirect_to adm_templates_path
  end
  
  # PRIVATE START FROM HERE! ------------------------------------------------------------
  private
  ##
  # Delete the directory and create a new one
  # ==== Attributes
  # * +template_dir+ - The directory to delete and create a new one in app/views
  # * +the_dir+ - The directory to delete and create a new one in app/views
  # 
  def del_copy_views_dir(template_dir,the_dir)
    
    real_template_dir = Rails.root.join('app/assets/templates/'+template_dir).to_s     # /app/assets/templates/ror_cms
    real_view_dir = Rails.root.join('app/views/'+the_dir).to_s                         # /app/views/[landing,devise,article_single,...]
    
    #view directory
    if Dir.exists?(real_view_dir)
      FileUtils.rm_rf(Dir.glob(real_view_dir+'/*'))
    end
    
    #template directory
    if Dir.exists?(real_template_dir+'/views/'+the_dir)
      FileUtils.cp_r real_template_dir+'/views/'+the_dir+'/.', real_view_dir
    end
    
  end
  
  def del_copy_helper(template_dir,helper_filename)
    real_template_helpers_dir = Rails.root.join('app/assets/templates/'+template_dir+'/helpers').to_s
    real_helpers_dir = Rails.root.join('app/helpers').to_s
    
    #helpers file delete
    if File.exists?(real_helpers_dir+'/'+helper_filename)
      FileUtils.rm real_helpers_dir+'/'+helper_filename
    end
    
    #copy helpers in the template to helpers folder
    if File.exists?(real_template_helpers_dir+'/'+helper_filename)
      FileUtils.cp real_template_helpers_dir+'/'+helper_filename, real_helpers_dir+'/'+helper_filename
    end
    
  end
end
