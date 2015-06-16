class Adm::AkunController < ApplicationController

	before_action :authenticate_user!

	include Adm::Helper

	layout "adm_layout"


	def edit
		@userext = UserExt.where('user_id = ?', current_user.id).take
		if @userext == nil
			@userext = UserExt.new
		end #if @userext == nil
	end #def edit

	def update
		@user_id = current_user.id
		@userext = UserExt.where('user_id = ?',@user_id).take

		#if nil insert and else update
		if @userext == nil
			@userin = UserExt.new
			@userin.user_id = @user_id
			@userin.description = params[:user_ext][:description]
			@userin.description_short = params[:user_ext][:description_short]
			@userin.save
		else 
			@userext.description = params[:user_ext][:description]
			@userext.description_short = params[:user_ext][:description_short]
			@userext.save
		end #if @userext == nil

	end #def update

end
