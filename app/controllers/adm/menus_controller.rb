class Adm::MenusController < ApplicationController

  before_action :authenticate_user!

  helper Adm::Helper # to call from view
  include Adm::Helper # to call within controller

  layout "adm_layout"

  def index

    # if app_set('site_menu == "<ol class='sortable'></ol>" || app_set('site_menu == "" || app_set('site_menu == nil
    # 	menu_string = "<ol class='sortable'>"
    # 	@pages = VPage.where("publish_status = 'Publish'")
    # 	if @pages.present?
    # 		@pages.each do |pag|
    # 			menu_string = menu_string+'<li><div>'+pag.title+'</div></li>'
    # 		end #@pages.each do |pag|
    # 	end #@pages.present?

    # 	menu_string = menu_string+"</ol>"	

    # 	#saving menu
    # 	app_set('site_menu = menu_string
    # 	app_set('save
    # end

    redirect_to edit_adm_menus_path		

  end #def index

  def edit

  end

  def draft_menu_element
    render :layout => false
  end

  def current_menu_element
    render :layout => false
  end

  def update_draft

    @opt = Option.where("option_key = 'site_menu_draft'").take
    @opt.option_value = params[:data]
    @opt.save
    render inline: "success"
  end #update_draft

  def update

    menu_str_a = params[:data].gsub "<ol", "<ul"
    menu_str_b = menu_str_a.gsub "</ol", "</ul"
    menu_str_c = menu_str_b.gsub "sortable ui-sortable", "" #replace sortable
    menu_str_d = menu_str_c.gsub "menu_page_", "page_" #replace page
    menu_str = menu_str_d

    @opt = Option.where("option_key = 'site_menu'").take
    @opt.option_value = menu_str
    @opt.save
    render inline: "success"
  end #update

  def form_manual
    render :layout => false
  end #form_manual

  def form_manual_update

    menu_str = params[:data]

    @opt = Option.where("option_key = 'site_menu'").take 
    @opt.option_value = menu_str
    @opt.save
    render inline: "success"
  end #form_manual_update

end
