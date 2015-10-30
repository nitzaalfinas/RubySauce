class Adm::MediaController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index
    @media = Medium.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @medium = Medium.new
  end

  def upload
    @medium = Medium.new
    @medium.med_storage_name = params[:medium][:med_storage_name]
    @medium.med_title = params[:medium][:med_title]
    @medium.med_caption = params[:medium][:med_caption]
    @medium.med_alt = params[:medium][:med_alt]
    @medium.med_description = params[:medium][:med_description]
    @medium.med_author_id = current_user.id
    @medium.gallery = params[:medium][:gallery]
    @medium_save = @medium.save


    if @medium_save

      med_storage_name = params[:medium][:med_storage_name] # Assign a file like this
      randomx = Random.new
      random_id = randomx.rand(1000000...100000000).to_s

      #upload original
      original = File.open(Rails.root.join('public/images/original',med_storage_name.original_filename),'wb') do |file|
        file.write(med_storage_name.read)
      end

      #rename original if it uploaded
      if original 
        #get file extension
        file_ex = File.extname(Rails.root.to_s+'/public/images/original/'+med_storage_name.original_filename)

        #get id for just saved image, in this case is @medium.id. Then rename it
        ## table id into string
        table_id = @medium.id.to_s
        ## old name
        old_name = Rails.root.to_s+'/public/images/original/'+med_storage_name.original_filename
        ## new name with extension
        new_name = Rails.root.to_s+'/public/images/original/'+table_id+'-'+random_id+file_ex

        ## executing rename file
        file_rename = File.rename(old_name, new_name)

        ###UPDATE DATABASE BECAUSE IMAGE HAS A NEW NAME
        @medup = Medium.where(id: @medium.id).take
        @medup.med_storage_name = table_id+'-'+random_id+file_ex
        @medup.save

        #if it renamed, then copy and resize for thumbnail and show
        if file_rename

          #THUMBNAIL
          FileUtils.cp new_name, Rails.root.to_s+'/public/images/thumb/'+table_id+'-'+random_id+file_ex
          MiniMagick::Image.new(Rails.root.join('public/images/thumb',table_id+'-'+random_id+file_ex)) do |b|
            b.resize "250x200>"
          end

          #SHOW
          FileUtils.cp new_name, Rails.root.to_s+'/public/images/show/'+table_id+'-'+random_id+file_ex
          MiniMagick::Image.new(Rails.root.join('public/images/show',table_id+'-'+random_id+file_ex)) do |b|
            b.resize "800x800>"
          end
        end #end file_rename
      end #end original

      redirect_to adm_media_path

    else #else for @medium_save
      render "new"
    end #end @medium_save

  end #upload


  def edit
    id = params[:id].to_i
    @medium = Medium.find(id)
    @page = params[:page]
  end #edit


  def update
    @medium = Medium.find(params[:id])

    #if there is med_storage_name
    if params[:medium][:med_storage_name]
      @medium.med_storage_name = params[:medium][:med_storage_name]	
    end

    @medium.med_title = params[:medium][:med_title]
    @medium.med_caption = params[:medium][:med_caption]
    @medium.med_alt = params[:medium][:med_alt]
    @medium.med_description = params[:medium][:med_description]
    @medium.med_author_id = current_user.id
    @medium.gallery = params[:medium][:gallery]
    @medium_save = @medium.save


    if @medium_save

      med_storage_name = params[:medium][:med_storage_name] # Assign a file like this, or

      if med_storage_name

        #upload original
        original = File.open(Rails.root.join('public/images/original',med_storage_name.original_filename),'wb') do |file|
          file.write(med_storage_name.read)
        end

        #rename original if it has been uploaded
        if original 
          #get file extension
          file_ex = File.extname(Rails.root.to_s+'/public/images/original/'+med_storage_name.original_filename)

          #get id for just saved image, in this case is @medium.id. Then rename it
          ## table id into string
          table_id = @medium.id.to_s
          ## old name
          old_name = Rails.root.to_s+'/public/images/original/'+med_storage_name.original_filename
          ## new name with extension
          new_name = Rails.root.to_s+'/public/images/original/'+table_id+file_ex

          ## executing rename file
          file_rename = File.rename(old_name, new_name)

          ###UPDATE DATABASE BECAUSE IMAGE HAS NEW NAME
          @medup = Medium.where(id: @medium.id).take
          @medup.med_storage_name = table_id+file_ex
          @medup.save


          #if it renamed, then copy and resize for thumbnail and show
          if file_rename

            #THUMBNAIL
            FileUtils.cp new_name, Rails.root.to_s+'/public/images/thumb/'+table_id+file_ex
            MiniMagick::Image.new(Rails.root.join('public/images/thumb',table_id+file_ex)) do |b|
              b.resize "250x200>"
            end

            #SHOW
            FileUtils.cp new_name, Rails.root.to_s+'/public/images/show/'+table_id+file_ex					
            MiniMagick::Image.new(Rails.root.join('public/images/show',table_id+file_ex)) do |b|
              b.resize "800x800>"
            end
          end #end file_rename
        end #end original
      end #end med_storage_name

      redirect_to adm_media_path

    else #else for @medium_save
      render "edit"
    end #end @medium_save

  end #end update

  def destroy
    @data = Medium.find(params[:id])

    if @data.med_storage_name != nil

      if File.exist?(Rails.root+'/public/images/thumb/'+@data.med_storage_name)
        File.delete(Rails.root+'/public/images/thumb/'+@data.med_storage_name)
      end

      if File.exist?(Rails.root+'/public/images/original/'+@data.med_storage_name)
        File.delete(Rails.root+'/public/images/original/'+@data.med_storage_name)
      end

      if File.exist?(Rails.root+'/public/images/show/'+@data.med_storage_name)
        File.delete(Rails.root+'/public/images/show/'+@data.med_storage_name)
      end

    end

    @data.destroy
    redirect_to adm_media_path
  end #end destroy


  #--------------------------- media win
  def media_win_index
    rows = params[:rows].to_i
    sortx = params[:sort]
    orderx = params[:order]

    #mencari offset
    if(!params[:page])
      page = 1
    else
      page = params[:page].to_i
    end

    startx = (page - 1) * rows

    orderxx = sortx+" "+orderx

    total = Medium.all.size

    @medium = Medium.order(orderxx).limit(rows).offset(startx)

    @next_page = page + 1
    @prev_page = page - 1

    render partial: "media_win_index"

  end #def index


  def media_win_the_page
    rows = params[:rows].to_i
    sortx = params[:sort]
    orderx = params[:order]

    #mencari offset
    if(!params[:page])
      page = 1
    else
      page = params[:page].to_i
    end

    startx = (page - 1) * rows

    orderxx = sortx+" "+orderx

    total = Medium.all.size

    @medium = Medium.order(orderxx).limit(rows).offset(startx)

    @next_page = page + 1
    @prev_page = page - 1

    render partial: "media_win_the_page"
  end #def the_page


  
end
