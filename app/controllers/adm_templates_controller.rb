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
end
