class AdmMenuController < ApplicationController

	before_action :authenticate_user!

	include AdmHelper

	layout "adm_layout"

	def index

		

		@menu = Option.find(1)

		# if @menu.site_menu == "<ol class='sortable'></ol>" || @menu.site_menu == "" || @menu.site_menu == nil
		# 	menu_string = "<ol class='sortable'>"
		# 	@pages = VPage.where("publish_status = 'Publish'")
		# 	if @pages.present?
		# 		@pages.each do |pag|
		# 			menu_string = menu_string+'<li><div>'+pag.title+'</div></li>'
		# 		end #@pages.each do |pag|
		# 	end #@pages.present?
			
		# 	menu_string = menu_string+"</ol>"	

		# 	#saving menu
		# 	@menu.site_menu = menu_string
		# 	@menu.save
		# end

		redirect_to adm_menu_edit_path		

	end #def index
		
	def edit
		
	end

	def draft_menu_element
		@menu = Option.find(1)
		render :layout => false
	end

	def current_menu_element
		@menu = Option.find(1)
		render :layout => false
	end

	def update_draft
		@menu = Option.find(1)

		@menu.site_menu_draft = params[:data]
		@menu.save
		render inline: "success"
	end #update_draft

	def update
		@menu = Option.find(1)

		menu_str_a = params[:data].gsub "<ol", "<ul"
		menu_str_b = menu_str_a.gsub "</ol", "</ul"
		menu_str_c = menu_str_b.gsub "sortable ui-sortable", "" #replace sortable
		menu_str_d = menu_str_c.gsub "menu_page_", "page_" #replace page
		menu_str = menu_str_d
		
		@menu.site_menu = menu_str
		@menu.save
		render inline: "success"
	end #update

	def form_manual
		@menu = Option.find(1)
		render :layout => false
	end #form_manual

	def form_manual_update
		@menu = Option.find(1)

		menu_str = params[:data]
		
		@menu.site_menu = menu_str
		@menu.save
		render inline: "success"
	end #form_manual_update

end
