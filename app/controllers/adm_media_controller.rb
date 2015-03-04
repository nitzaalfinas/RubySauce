class AdmMediaController < ApplicationController

	before_action :authenticate_user!

	include AdmHelper

	layout "adm_layout"

	def index
		@media = Media.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
	end

	def new
		@media = Media.new
	end


	def upload
		@media = Media.new
		@media.med_storage_name = params[:media][:med_storage_name]
		@media.med_title = params[:media][:med_title]
		@media.med_caption = params[:media][:med_caption]
		@media.med_alt = params[:media][:med_alt]
		@media.med_description = params[:media][:med_description]
		@media.med_author_id = current_user.id
		@media.gallery = params[:media][:gallery]
		@media_save = @media.save


		if @media_save

			med_storage_name = params[:media][:med_storage_name] # Assign a file like this, or

			#upload original
			original = File.open(Rails.root.join('app/assets/images/upload/original',med_storage_name.original_filename),'wb') do |file|
				file.write(med_storage_name.read)
			end

			#rename original if it has been uploaded
			if original 
				#get file extension
				file_ex = File.extname(Rails.root.to_s+'/app/assets/images/upload/original/'+med_storage_name.original_filename)

				#get id for just saved image, in this case is @media.id. Then rename it
				## table id into string
				table_id = @media.id.to_s
				## old name
				old_name = Rails.root.to_s+'/app/assets/images/upload/original/'+med_storage_name.original_filename
				## new name with extension
				new_name = Rails.root.to_s+'/app/assets/images/upload/original/'+table_id+file_ex

				## executing rename file
				file_rename = File.rename(old_name, new_name)

				###UPDATE DATABASE BECAUSE IMAGE HAS NEW NAME
				@medup = Media.where(id: @media.id).take
				@medup.med_storage_name = table_id+file_ex
				@medup.save


				#if it renamed, then copy and resize for thumbnail and show
				if file_rename

					#THUMBNAIL
					FileUtils.cp new_name, Rails.root.to_s+'/app/assets/images/upload/thumb/'+table_id+file_ex
					MiniMagick::Image.new(Rails.root.join('app/assets/images/upload/thumb',table_id+file_ex)) do |b|
					  b.resize "250x200>"
					end

					#SHOW
					FileUtils.cp new_name, Rails.root.to_s+'/app/assets/images/upload/show/'+table_id+file_ex					
					MiniMagick::Image.new(Rails.root.join('app/assets/images/upload/show',table_id+file_ex)) do |b|
					  b.resize "800x800>"
					end
				end #end file_rename
			end #end original

			redirect_to adm_media_path

		else #else for @media_save
			render "new"
		end #end @media_save
		
	end #upload


	def edit
		id = params[:id]
		@media = Media.find(params[:id])
		@page = params[:page]
	end #edit


	def update
		@media = Media.find(params[:id])

		#if there is med_storage_name
		if params[:media][:med_storage_name]
			@media.med_storage_name = params[:media][:med_storage_name]	
		end
		
		@media.med_title = params[:media][:med_title]
		@media.med_caption = params[:media][:med_caption]
		@media.med_alt = params[:media][:med_alt]
		@media.med_description = params[:media][:med_description]
		@media.med_author_id = current_user.id
		@media.gallery = params[:media][:gallery]
		@media_save = @media.save


		if @media_save

			med_storage_name = params[:media][:med_storage_name] # Assign a file like this, or

			if med_storage_name

				#upload original
				original = File.open(Rails.root.join('app/assets/images/upload/original',med_storage_name.original_filename),'wb') do |file|
					file.write(med_storage_name.read)
				end

				#rename original if it has been uploaded
				if original 
					#get file extension
					file_ex = File.extname(Rails.root.to_s+'/app/assets/images/upload/original/'+med_storage_name.original_filename)

					#get id for just saved image, in this case is @media.id. Then rename it
					## table id into string
					table_id = @media.id.to_s
					## old name
					old_name = Rails.root.to_s+'/app/assets/images/upload/original/'+med_storage_name.original_filename
					## new name with extension
					new_name = Rails.root.to_s+'/app/assets/images/upload/original/'+table_id+file_ex

					## executing rename file
					file_rename = File.rename(old_name, new_name)

					###UPDATE DATABASE BECAUSE IMAGE HAS NEW NAME
					@medup = Media.where(id: @media.id).take
					@medup.med_storage_name = table_id+file_ex
					@medup.save


					#if it renamed, then copy and resize for thumbnail and show
					if file_rename

						#THUMBNAIL
						FileUtils.cp new_name, Rails.root.to_s+'/app/assets/images/upload/thumb/'+table_id+file_ex
						MiniMagick::Image.new(Rails.root.join('app/assets/images/upload/thumb',table_id+file_ex)) do |b|
						  b.resize "250x200>"
						end

						#SHOW
						FileUtils.cp new_name, Rails.root.to_s+'/app/assets/images/upload/show/'+table_id+file_ex					
						MiniMagick::Image.new(Rails.root.join('app/assets/images/upload/show',table_id+file_ex)) do |b|
						  b.resize "800x800>"
						end
					end #end file_rename
				end #end original
			end #end med_storage_name

			redirect_to adm_media_path

		else #else for @media_save
			render "edit"
		end #end @media_save
		
	end #end update

	def destroy
		@data = Media.find(params[:id])
		@data.destroy
		redirect_to adm_media_path
	end #end destroy

end
