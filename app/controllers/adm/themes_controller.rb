class Adm::ThemesController < ApplicationController

  before_action :authenticate_user!

  include Adm::Helper

  layout "adm_layout"

  def index
    count_active = Theme.where(:active => 1).count
    if count_active == 0
      tact = Theme.first
      tact.active = 1
      tact.save
    end

    @default = Theme.where(:active => 1).take
    @themes = Theme.where('active <> 1').order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @theme = Theme.new
  end

  def upload
    # params 
    t_filename = params[:theme][:folder_name]

    # path
    f_path = Rails.root.join('app/assets/themes').to_s

    # unzip command 
    unzip_command = 'unzip '+f_path+'/tmp/'+t_filename.original_filename.to_s+' -d '+f_path

    @theme = Theme.new
    @theme.folder_name = t_filename.original_filename.gsub(".zip","")
    @theme_save = @theme.save
  
    if @theme_save
      #upload original
      File.open(Rails.root.join('app/assets/themes/tmp',t_filename.original_filename),'wb') do |file|
        file.write(t_filename.read)
      end

      #unzip
      system(unzip_command)
      
      cp_image_to_public(t_filename.original_filename.gsub(".zip",""))
      
      # remove theme zip
      FileUtils.rm f_path+'/tmp/'+t_filename.original_filename.to_s 

      redirect_to adm_themes_path

    else
      render "new"
    end
  end

  def active
    id = params[:id]

    #get theme by id
    theme = Theme.find(id)

    # current theme active set to inactive or active = 0
    current_theme_active = Theme.where(:active => 1).take
    current_theme_active.active = 0
    current_theme_active.save

    # assign theme active to a new one
    theme.active = 1
    theme.save

    #views
    view_arr = ['article_single','confirmable','devise','galleries','landing','page_single','percategory','search','support','widget']
    del_copy_views_dir(theme.folder_name,view_arr)

    #helpers
    helper_arr = ['application_helper.rb','article_page_helper.rb','article_single_helper.rb','discuss_helper.rb','discuss_helper.rb','galleries_helper.rb','landing_helper.rb','page_single_helper.rb','percategory_helper.rb']
    del_copy_helper(theme.folder_name,helper_arr)

    #js
    replace_js(theme.folder_name,current_theme_active.folder_name)

    #css
    replace_css(theme.folder_name,current_theme_active.folder_name)

    #supplement
    replace_supplement(theme.folder_name,current_theme_active.folder_name)

    #layout
    theme_layout_application = Rails.root.join('app/assets/themes/'+theme.folder_name+'/views/layouts/application.html.erb')
    real_layout_application = Rails.root.join('app/views/layouts/application.html.erb')
    if File.exists?(theme_layout_application)
      FileUtils.cp theme_layout_application, real_layout_application 
    end

    redirect_to adm_themes_path
  end

  def destroy
    id = params[:id]
    @theme = Theme.find(id)
    
    FileUtils.rm_rf Rails.root.to_s+"/app/assets/themes/#{@theme.folder_name}" 
    
    FileUtils.rm_rf Rails.root.to_s+"/public/images/themes/#{@theme.folder_name}" 
    
    @theme.destroy
    
    redirect_to adm_themes_path
#     render inline: Rails.root.to_s+"/app/assets/themes/#{@theme.folder_name}" 
  end
  
  # PRIVATE START FROM HERE! ------------------------------------------------------------
  private
  
  def cp_image_to_public(theme_dir)
    real_theme_dir = Rails.root.join('app/assets/themes/'+theme_dir).to_s       # theme directory
    dir_dest = Rails.root.to_s+'/public/images/themes/'+theme_dir               # destination directory
    file_src = real_theme_dir+'/theme.png'                                      # file source
    file_dest = dir_dest+'/theme.png'                                           # file destination
    
    if Dir.exists?(dir_dest)
      FileUtils.cp file_src, file_dest
    else
      FileUtils.mkdir Rails.root.to_s+'/public/images/themes/'+theme_dir
      FileUtils.cp file_src, file_dest
    end
  end

  ##
  # Delete the directory and create a new one
  # ==== Attributes
  # * +theme_dir+ - The directory to delete and create a new one in app/views
  # * +the_dir+ - The directory to delete and create a new one in app/views
  # 
  def del_copy_views_dir(theme_dir,the_dir_arr)
    
    the_dir_arr.each do |the_dir|
      real_theme_dir = Rails.root.join('app/assets/themes/'+theme_dir).to_s     # /app/assets/themes/ror_cms
      real_view_dir = Rails.root.join('app/views/'+the_dir).to_s                # /app/views/[landing,devise,article_single,...]

      #view directory
      if Dir.exists?(real_view_dir)
        FileUtils.rm_rf(Dir.glob(real_view_dir+'/*'))
      end

      #theme directory
      if Dir.exists?(real_theme_dir+'/views/'+the_dir)
        FileUtils.cp_r real_theme_dir+'/views/'+the_dir+'/.', real_view_dir
      end
    end
  end

  def del_copy_helper(theme_dir,helper_filename_arr)
    helper_filename_arr.each do |helper_filename|
      real_theme_helpers_dir = Rails.root.join('app/assets/themes/'+theme_dir+'/helpers').to_s
      real_helpers_dir = Rails.root.join('app/helpers').to_s

      #helpers file delete
      if File.exists?(real_helpers_dir+'/'+helper_filename)
        FileUtils.rm real_helpers_dir+'/'+helper_filename
      end

      #copy helpers in the theme to helpers folder
      if File.exists?(real_theme_helpers_dir+'/'+helper_filename)
        FileUtils.cp real_theme_helpers_dir+'/'+helper_filename, real_helpers_dir+'/'+helper_filename
      end
    end
  end

  ##
  # Replace old theme javascript with new one
  # ==== Attributes
  # * +theme_dir+ - The directory of new theme. (not full path). Ex: ror_cms
  # * +old_theme_dir+ - The directory of old theme (not full path). Ex: ror_cms_2
  #
  def replace_js(theme_dir,old_theme_dir)

    #delete old javascripts | Please make old_theme_dir
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
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
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      datax = JSON.parse(data_json)
      datax["js_files"].each do |item|
        the_file = Rails.root.join('app/assets/themes/'+theme_dir+'/assets/javascripts/'+item).to_s
        the_real_file = Rails.root.join('app/assets/javascripts/'+item).to_s
        if File.exists?(the_file)
          FileUtils.cp the_file, the_real_file
        end
      end
    end
  end

  ##
  # Replace old theme css with new one
  # ==== Attributes
  # * +theme_dir+ - The directory of new theme. (not full path). Ex: ror_cms
  # * +old_theme_dir+ - The directory of old theme (not full path). Ex: ror_cms_2
  #
  def replace_css(theme_dir,old_theme_dir)

    #delete old css | Please make old_theme_dir
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
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
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      datax = JSON.parse(data_json)
      datax["css_files"].each do |item|
        the_file = Rails.root.join('app/assets/themes/'+theme_dir+'/assets/stylesheets/'+item).to_s
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
  # * +theme_dir+ - The directory of new theme. (not full path). Ex: ror_cms
  # * +old_theme_dir+ - The directory of old theme (not full path). Ex: ror_cms_2
  #
  def replace_supplement(theme_dir,old_theme_dir)

    # remove old_theme
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+old_theme_dir+'/theme.json')
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
    end # end of remove old_theme

    # apply new theme
    if File.exist?(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      data_json = File.read(Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/theme.json')
      datax = JSON.parse(data_json)
      if defined?(datax["supplements"].each)
        datax["supplements"].each do |supp|  
          # co-pas file
          if(supp["copy_type"] == "file") 
            the_file_temp = Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/supplements/'+supp["name"]
            the_file_copy_to = Rails.root.to_s+'/'+supp["copy_to"]+'/'+supp["name"]
            if File.exists?(the_file_temp)

              # create directory if doesn't exist
              unless File.directory?(Rails.root.to_s+'/'+supp["copy_to"])
                FileUtils.mkdir_p(Rails.root.to_s+'/'+supp["copy_to"])
              end

              # copy the file into directory
              FileUtils.cp(the_file_temp, the_file_copy_to) 
            end
          end

          # co-pas folder
          if(supp["copy_type"] == "folder")
            the_folder_temp = Rails.root.to_s+'/app/assets/themes/'+theme_dir+'/supplements/'+supp["name"]
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
