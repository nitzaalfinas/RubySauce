module Adm::Helper
  
  $page_menus = VPage.where("publish_status = 'Publish'")
  
	def adm_check (user_level)
		if user_level != "Admin"
			redirect_to "/"
		end #if current_user != "Admin"
	end #def adm_check

  def app_set(key)
    Option.where('option_key = ?',key).take.option_value
  end
  
end
