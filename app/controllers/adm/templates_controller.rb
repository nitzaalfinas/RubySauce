class Adm::TemplatesController < ApplicationController
  
  before_action :authenticate_user!

	include Adm::Helper

	layout "adm_layout"
  
  def index
    count_active = Template.where(:active => 1).count
    if count_active == 0
      tact = Template.first
      tact.active = 1
      tact.save
    end
    
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
    del_copy_views_dir(template.name,'support')
    del_copy_views_dir(template.name,'widget')
    
    #helpers
    del_copy_helper(template.name,'application_helper.rb')
    del_copy_helper(template.name,'article_page_helper.rb')
    del_copy_helper(template.name,'article_single_helper.rb')
    del_copy_helper(template.name,'discuss_helper.rb')
    del_copy_helper(template.name,'galleries_helper.rb')
    del_copy_helper(template.name,'landing_helper.rb')
    del_copy_helper(template.name,'page_single_helper.rb')
    del_copy_helper(template.name,'percategory_helper.rb')
    
    #js
    replace_js(template.name,current_template_active.name)
    
    #css
    replace_css(template.name,current_template_active.name)
    
    #supplement
    replace_supplement(template.name,current_template_active.name)
    
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
  
  ##
  # Replace old template javascript with new one
  # ==== Attributes
  # * +template_dir+ - The directory of new template. (not full path). Ex: ror_cms
  # * +old_template_dir+ - The directory of old template (not full path). Ex: ror_cms_2
  #
  def replace_js(template_dir,old_template_dir)
    
    #delete old javascripts | Please make old_template_dir
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      datax = JSON.parse(data_json)
      datax["js_files"].each do |item|
        #delete real assets js
        the_file = Rails.root.join('app/assets/javascripts/'+item).to_s
        if File.exists?(the_file)
          FileUtils.rm(the_file)
        end
      end
    end
    
    # copy and paste new javascripts to assets/javascripts directory
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      datax = JSON.parse(data_json)
      datax["js_files"].each do |item|
        the_file = Rails.root.join('app/assets/templates/'+template_dir+'/assets/javascripts/'+item).to_s
        the_real_file = Rails.root.join('app/assets/javascripts/'+item).to_s
        if File.exists?(the_file)
          FileUtils.cp the_file, the_real_file
        end
      end
    end
  end
  
  ##
  # Replace old template css with new one
  # ==== Attributes
  # * +template_dir+ - The directory of new template. (not full path). Ex: ror_cms
  # * +old_template_dir+ - The directory of old template (not full path). Ex: ror_cms_2
  #
  def replace_css(template_dir,old_template_dir)
    
    #delete old css | Please make old_template_dir
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      datax = JSON.parse(data_json)
      datax["css_files"].each do |item|
        #delete real assets css
        the_file = Rails.root.join('app/assets/stylesheets/'+item).to_s
        if File.exists?(the_file)
          FileUtils.rm(the_file)
        end
      end
    end
    
    # copy and paste new css to assets/stylesheets directory
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      datax = JSON.parse(data_json)
      datax["css_files"].each do |item|
        the_file = Rails.root.join('app/assets/templates/'+template_dir+'/assets/stylesheets/'+item).to_s
        the_real_file = Rails.root.join('app/assets/stylesheets/'+item).to_s
        if File.exists?(the_file)
          FileUtils.cp the_file, the_real_file
        end
      end
    end
  end
  
  ##
  # Replace old supplement with new one
  # ==== Attributes
  # * +template_dir+ - The directory of new template. (not full path). Ex: ror_cms
  # * +old_template_dir+ - The directory of old template (not full path). Ex: ror_cms_2
  #
  def replace_supplement(template_dir,old_template_dir)
    
    # remove old_template
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+old_template_dir+'/template.json')
      datax = JSON.parse(data_json)
      
      if defined?(datax["supplements"].each)
        datax["supplements"].each do |supp|
          # remove file
          if(supp["copy_type"] == "file") 
            the_file = Rails.root.join(supp["copy_to"]+'/'+supp["name"]).to_s
            if File.exists?(the_file)
              FileUtils.rm(the_file)
            end
          end

          # remove folder
          if(supp["copy_type"] == "folder")
            the_folder = Rails.root.join(supp["copy_to"]+'/'+supp["name"]).to_s
            if Dir.exists?(the_folder)
              FileUtils.remove_dir(the_folder)
            end
          end
        end
      end    
    end # end of remove old_template
    
    # apply new template
    if File.exist?(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/templates/'+template_dir+'/template.json')
      datax = JSON.parse(data_json)
      if defined?(datax["supplements"].each)
        datax["supplements"].each do |supp|  
          # co-pas file
          if(supp["copy_type"] == "file") 
            the_file_temp = Rails.root.to_s+'/app/assets/templates/'+template_dir+'/supplements/'+supp["name"]
            the_file_copy_to = Rails.root.to_s+'/'+supp["copy_to"]+'/'+supp["name"]
            if File.exists?(the_file_temp)
              FileUtils.cp(the_file_temp, the_file_copy_to) 
            end
          end

          # co-pas folder
          if(supp["copy_type"] == "folder")
            the_folder_temp = Rails.root.to_s+'/app/assets/templates'+template_dir+'/supplements/'+supp["name"]
            the_folder_copy_to = Rails.root.to_s+'/'+supp["copy_to"]+'/'+supp["name"]

            # remove destination folder as mention in http://ruby-doc.org/stdlib-2.0.0/libdoc/fileutils/rdoc/FileUtils.html#method-c-copy_entry
            if Dir.exists?(the_folder_copy_to)
              FileUtils.remove_dir(the_folder_copy_to)
            end

            # copy
            if Dir.exists?(the_folder_temp)
              FileUtils.copy_entry(the_folder_temp,the_folder_copy_to)
            end
          end
        end
      end
    end
  end
end
