class Adm::MyProfileController < ApplicationController
  before_action :authenticate_user!
  
  helper Adm::Helper # to call from view
  include Adm::Helper # to call within controller
  
  layout "adm_layout"
  
  
  def index
    
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  # untuk mengupdate profile sendiri
  # <h3>Process </h3>
  # Jika ada photo dikirimkan, maka simpan photo tersebut dan hapus photo yang lama. 
  # Tetapi harap diperhatikan, photo avata-no.gif tidak boleh dihapus
  def update
    @full_name = params[:user][:full_name]
    @nick_name = params[:user][:nick_name]
    
    @user = User.find(current_user.id)
    @user.full_name = @full_name
    @user.nick_name = @nick_name
    @user.save
    
    if(params[:user][:avatar_file])
      if(@user.avatar_file)
        if(@user.avatar_file != 'avatar-no.gif')
          # hapus file tersebut 
          if(File.exists?(Rails.root.to_s+'/public/images/original/'+@user.avatar_file))
            File.delete(Rails.root.to_s+'/public/images/original/'+@user.avatar_file)
          end
          
          if(File.exists?(Rails.root.to_s+'/public/images/thumb/'+@user.avatar_file))
            File.delete(Rails.root.to_s+'/public/images/thumb/'+@user.avatar_file)
          end
          
          if(File.exists?(Rails.root.to_s+'/public/images/show/'+@user.avatar_file))
            File.delete(Rails.root.to_s+'/public/images/show/'+@user.avatar_file)
          end
        end
      end
      
      
      #upload original
      File.open(Rails.root.join('public/images/original',params[:user][:avatar_file].original_filename),'wb') do |file|
        file.write(params[:user][:avatar_file].read)
      end
      
      # siapkan nama baru untuk file
      randomx = Random.new
      random_id = randomx.rand(1000000...100000000).to_s
      file_extension = File.extname(Rails.root.to_s+'/public/images/original/'+params[:user][:avatar_file].original_filename)
      new_file_name = 'avatar-'+current_user.id.to_s+'-'+random_id+file_extension
      
      # rename
      File.rename(Rails.root.to_s+'/public/images/original/'+params[:user][:avatar_file].original_filename, Rails.root.to_s+'/public/images/original/'+new_file_name)
      
      
      # thumb
      FileUtils.cp(Rails.root.to_s+'/public/images/original/'+new_file_name, Rails.root.to_s+'/public/images/thumb/'+new_file_name)
      system("convert "+Rails.root.to_s+"/public/images/thumb/"+new_file_name+" -resize '250x200^' "+Rails.root.to_s+"/public/images/thumb/"+new_file_name)
      
      # show
      FileUtils.cp(Rails.root.to_s+'/public/images/original/'+new_file_name, Rails.root.to_s+'/public/images/show/'+new_file_name)
      system("convert "+Rails.root.to_s+"/public/images/show/"+new_file_name+" -resize '800x600^' "+Rails.root.to_s+"/public/images/show/"+new_file_name)
    
      # update database with new file
      @user.avatar_file = new_file_name
      @user.save
      
      redirect_to('/adm/my_profile')
      
    end
    
    
  end 
end
